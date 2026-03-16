import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/features/settings/data/settings_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Aggregated state for SettingsScreen.
class SettingsState {
  const SettingsState({
    required this.sensitivityMode,
    required this.themeMode,
    required this.overlayEnabled,
    required this.contacts,
    required this.languageCode,
  });

  final String sensitivityMode;
  final String themeMode;
  final bool overlayEnabled;
  final List<TrustedContact> contacts;
  final String languageCode;

  SettingsState copyWith({
    String? sensitivityMode,
    String? themeMode,
    bool? overlayEnabled,
    List<TrustedContact>? contacts,
    String? languageCode,
  }) {
    return SettingsState(
      sensitivityMode: sensitivityMode ?? this.sensitivityMode,
      themeMode: themeMode ?? this.themeMode,
      overlayEnabled: overlayEnabled ?? this.overlayEnabled,
      contacts: contacts ?? this.contacts,
      languageCode: languageCode ?? this.languageCode,
    );
  }
}

class SettingsController extends AutoDisposeAsyncNotifier<SettingsState> {
  @override
  Future<SettingsState> build() async {
    final settings = ref.read(settingsServiceProvider);
    final mode = await settings.getSensitivityMode();
    final theme = await settings.getThemeMode();
    final contacts = await settings.getTrustedContacts();
    final language = await settings.getLanguageCode();
    // Overlay permission is platform-specific; keep false by default.
    return SettingsState(
      sensitivityMode: mode,
      themeMode: theme,
      overlayEnabled: false,
      contacts: contacts,
      languageCode: language ?? 'en',
    );
  }

  Future<void> setSensitivity(String mode) async {
    final settings = ref.read(settingsServiceProvider);
    await settings.setSensitivityMode(mode);
    final current = state.valueOrNull;
    if (current != null) {
      state = AsyncData(current.copyWith(sensitivityMode: mode));
    }
  }

  Future<void> setThemeMode(String mode) async {
    final settings = ref.read(settingsServiceProvider);
    await settings.setThemeMode(mode);
    final current = state.valueOrNull;
    if (current != null) {
      state = AsyncData(current.copyWith(themeMode: mode));
    }
  }

  Future<void> updateContacts(List<TrustedContact> contacts) async {
    final settings = ref.read(settingsServiceProvider);
    await settings.setTrustedContacts(contacts);
    final current = state.valueOrNull;
    if (current != null) {
      state = AsyncData(current.copyWith(contacts: contacts));
    }
  }

  Future<void> setLanguageCode(String code) async {
    final settings = ref.read(settingsServiceProvider);
    await settings.setLanguageCode(code);
    ref.read(languageCodeProvider.notifier).state = code;
    final current = state.valueOrNull;
    if (current != null) {
      state = AsyncData(current.copyWith(languageCode: code));
    }
  }
}

final settingsControllerProvider =
    AutoDisposeAsyncNotifierProvider<SettingsController, SettingsState>(
  SettingsController.new,
);

