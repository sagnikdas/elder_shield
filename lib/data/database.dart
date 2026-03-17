import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_sqlcipher/sqflite.dart';

/// SQLite database helper for Elder Shield.
///
/// The database is encrypted with SQLCipher using a per-device 256-bit key
/// stored in the system keystore via [FlutterSecureStorage]. On first launch
/// after upgrading from an unencrypted build the old database file is deleted
/// (message history is analysis logs; user-critical data lives in secure
/// storage).
class AppDatabase {
  AppDatabase._internal();

  static final AppDatabase instance = AppDatabase._internal();
  Database? _db;

  static const _dbName = 'elder_shield.db';
  static const _dbVersion = 1;
  static const _keyAlias = 'elder_shield_db_key';

  // Table: analyzed messages
  static const tableMessages = 'analyzed_messages';
  static const tableReasons = 'message_reasons';

  Future<Database> get database async {
    final existing = _db;
    if (existing != null) return existing;

    final db = await _open();
    _db = db;
    return db;
  }

  Future<Database> _open() async {
    final dir = await getApplicationDocumentsDirectory();
    final path = p.join(dir.path, _dbName);

    const storage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );

    String? key = await storage.read(key: _keyAlias);

    if (key == null) {
      // First run with encryption — drop any existing unencrypted database.
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
      key = _generateKey();
      await storage.write(key: _keyAlias, value: key);
    }

    // Normal open path with SQLCipher. If this fails with "file is not a database"
    // (e.g. legacy or corrupt file), we reset the DB file and key once, then retry.
    try {
      return await openDatabase(
        path,
        password: key,
        version: _dbVersion,
        onCreate: _onCreate,
      );
    } on DatabaseException catch (e) {
      final msg = e.toString();
      final isNotDb = msg.contains('file is not a database') ||
          msg.contains('open_failed') ||
          msg.contains('file is encrypted or is not a database');
      if (!isNotDb) rethrow;

      // Best-effort recovery: delete the bad file and rotate the key,
      // then create a fresh encrypted database. Message history is
      // analysis-only, so it's safe to drop on corruption.
      final file = File(path);
      if (await file.exists()) {
        await file.delete();
      }
      await storage.delete(key: _keyAlias);
      final newKey = _generateKey();
      await storage.write(key: _keyAlias, value: newKey);

      return openDatabase(
        path,
        password: newKey,
        version: _dbVersion,
        onCreate: _onCreate,
      );
    }
  }

  /// Generates a cryptographically random 256-bit key as a 64-char hex string.
  String _generateKey() {
    final rng = Random.secure();
    final bytes = Uint8List(32);
    for (var i = 0; i < 32; i++) {
      bytes[i] = rng.nextInt(256);
    }
    return bytes.map((b) => b.toRadixString(16).padLeft(2, '0')).join();
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $tableMessages (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        sender TEXT NOT NULL,
        body TEXT NOT NULL,
        timestamp INTEGER NOT NULL,
        score REAL NOT NULL,
        band TEXT NOT NULL,
        feedback_label TEXT
      )
    ''');

    await db.execute('''
      CREATE TABLE $tableReasons (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        message_id INTEGER NOT NULL,
        reason TEXT NOT NULL,
        FOREIGN KEY(message_id) REFERENCES $tableMessages(id) ON DELETE CASCADE
      )
    ''');

    // Indexes for common query patterns.
    await db.execute(
      'CREATE INDEX idx_messages_timestamp ON $tableMessages(timestamp DESC)',
    );
    await db.execute(
      'CREATE INDEX idx_messages_band ON $tableMessages(band)',
    );
    await db.execute(
      'CREATE INDEX idx_reasons_message_id ON $tableReasons(message_id)',
    );
  }

  Future<void> close() async {
    final db = _db;
    if (db != null) {
      await db.close();
      _db = null;
    }
  }
}
