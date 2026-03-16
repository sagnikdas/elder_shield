import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:elder_shield/data/database.dart';
import 'package:elder_shield/features/messages/data/message_repository.dart';
import 'package:elder_shield/features/settings/data/settings_service.dart';

/// When non-null, the app shows the high-risk warning sheet (Block 7).
/// SecurityController sets this; [HighRiskAlertListener] shows the sheet and clears.
final pendingHighRiskMessageProvider = StateProvider<AnalyzedMessage?>((ref) => null);

/// True when the Flutter UI is visible in the foreground.
/// Used to avoid duplicate alerts when native Android already interrupts the user.
final appInForegroundProvider = StateProvider<bool>((ref) => true);

final appDatabaseProvider = Provider<AppDatabase>((ref) => AppDatabase.instance);

final messageRepositoryProvider = Provider<MessageRepository>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return MessageRepository(db);
});

final _secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  const androidOptions = AndroidOptions(encryptedSharedPreferences: true);
  return const FlutterSecureStorage(aOptions: androidOptions);
});

final settingsServiceProvider = Provider<SettingsService>((ref) {
  final storage = ref.watch(_secureStorageProvider);
  return SettingsService(storage);
});

/// Index of the main shell bottom nav (0=Home, 1=Messages, 2=Settings).
final shellTabIndexProvider = StateProvider<int>((ref) => 0);

/// Text scale factor for the whole app (1.0 = 100%). Updated in Settings; applied via MaterialApp builder.
final fontScaleProvider = StateProvider<double>((ref) => 1.0);

/// Theme mode: 'light', 'dark', 'system'. Updated in Settings; applied in app.dart.
final themeModeProvider = StateProvider<String>((ref) => 'system');

/// Current app language code: 'en', 'bn', 'kn', etc. Null = follow system locale.
final languageCodeProvider = StateProvider<String?>((ref) => null);
