import 'package:elder_shield/data/database.dart';
import 'package:elder_shield/domain/detector/heuristic_detector.dart';

/// Persistence model for an analyzed message.
class AnalyzedMessage {
  final int id;
  final String sender;
  final String body;
  final int timestamp;
  final double score;
  final RiskBand band;
  final List<String> reasons;
  final String? feedbackLabel; // e.g. 'scam', 'safe', null

  const AnalyzedMessage({
    required this.id,
    required this.sender,
    required this.body,
    required this.timestamp,
    required this.score,
    required this.band,
    required this.reasons,
    this.feedbackLabel,
  });
}

class MessageRepository {
  MessageRepository(this._db);

  final AppDatabase _db;

  /// Save an analyzed message and its reasons.
  Future<int> saveAnalyzedMessage({
    required String sender,
    required String body,
    required int timestamp,
    required DetectionResult result,
  }) async {
    final db = await _db.database;
    return db.transaction((txn) async {
      final messageId = await txn.insert(AppDatabase.tableMessages, {
        'sender': sender,
        'body': body,
        'timestamp': timestamp,
        'score': result.score,
        'band': result.band.name,
        'feedback_label': null,
      });

      for (final reason in result.reasons) {
        await txn.insert(AppDatabase.tableReasons, {
          'message_id': messageId,
          'reason': reason,
        });
      }

      return messageId;
    });
  }

  /// Fetch recent analyzed messages ordered by newest first.
  Future<List<AnalyzedMessage>> fetchRecent({int limit = 50}) async {
    final db = await _db.database;
    final rows = await db.query(
      AppDatabase.tableMessages,
      orderBy: 'timestamp DESC',
      limit: limit,
    );

    if (rows.isEmpty) return [];

    final ids = rows.map((r) => r['id'] as int).toList();
    final reasonsRows = await db.query(
      AppDatabase.tableReasons,
      where: 'message_id IN (${List.filled(ids.length, '?').join(',')})',
      whereArgs: ids,
    );

    final reasonsByMessage = <int, List<String>>{};
    for (final row in reasonsRows) {
      final mid = row['message_id'] as int;
      final list = reasonsByMessage.putIfAbsent(mid, () => <String>[]);
      list.add(row['reason'] as String);
    }

    return rows.map((r) {
      final id = r['id'] as int;
      return AnalyzedMessage(
        id: id,
        sender: r['sender'] as String,
        body: r['body'] as String,
        timestamp: r['timestamp'] as int,
        score: (r['score'] as num).toDouble(),
        band: RiskBand.values.byName(r['band'] as String),
        reasons: reasonsByMessage[id] ?? const [],
        feedbackLabel: r['feedback_label'] as String?,
      );
    }).toList();
  }

  /// Fetch only high-risk messages (for alerts/history views).
  Future<List<AnalyzedMessage>> fetchHighRisk({int limit = 50}) async {
    final db = await _db.database;
    final rows = await db.query(
      AppDatabase.tableMessages,
      where: 'band = ?',
      whereArgs: [RiskBand.high.name],
      orderBy: 'timestamp DESC',
      limit: limit,
    );
    if (rows.isEmpty) return [];

    final ids = rows.map((r) => r['id'] as int).toList();
    final reasonsRows = await db.query(
      AppDatabase.tableReasons,
      where: 'message_id IN (${List.filled(ids.length, '?').join(',')})',
      whereArgs: ids,
    );

    final reasonsByMessage = <int, List<String>>{};
    for (final row in reasonsRows) {
      final mid = row['message_id'] as int;
      final list = reasonsByMessage.putIfAbsent(mid, () => <String>[]);
      list.add(row['reason'] as String);
    }

    return rows.map((r) {
      final id = r['id'] as int;
      return AnalyzedMessage(
        id: id,
        sender: r['sender'] as String,
        body: r['body'] as String,
        timestamp: r['timestamp'] as int,
        score: (r['score'] as num).toDouble(),
        band: RiskBand.values.byName(r['band'] as String),
        reasons: reasonsByMessage[id] ?? const [],
        feedbackLabel: r['feedback_label'] as String?,
      );
    }).toList();
  }

  /// Delete a message and its reasons from local storage.
  /// Does not delete the SMS from the system inbox (only the default SMS app can do that).
  Future<void> deleteMessage(int messageId) async {
    final db = await _db.database;
    await db.transaction((txn) async {
      await txn.delete(AppDatabase.tableReasons, where: 'message_id = ?', whereArgs: [messageId]);
      await txn.delete(AppDatabase.tableMessages, where: 'id = ?', whereArgs: [messageId]);
    });
  }

  /// Save user feedback label for a message (e.g. user marks scam/safe).
  Future<void> saveFeedback({
    required int messageId,
    required String label,
  }) async {
    final db = await _db.database;
    await db.update(
      AppDatabase.tableMessages,
      {'feedback_label': label},
      where: 'id = ?',
      whereArgs: [messageId],
    );
  }

  /// Count messages with medium or high risk from today (local time).
  Future<int> fetchTodayRiskCount() async {
    final db = await _db.database;
    final result = await db.rawQuery(
      "SELECT COUNT(*) AS c FROM ${AppDatabase.tableMessages} "
      "WHERE band IN (?, ?) AND date(timestamp/1000, 'unixepoch', 'localtime') = date('now', 'localtime')",
      [RiskBand.medium.name, RiskBand.high.name],
    );
    return (result.first['c'] as int?) ?? 0;
  }

  /// Clear all local data (for settings "delete history" action).
  Future<void> clearAll() async {
    final db = await _db.database;
    await db.transaction((txn) async {
      await txn.delete(AppDatabase.tableReasons);
      await txn.delete(AppDatabase.tableMessages);
    });
  }
}

