import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// A trusted contact (name + number) for one-tap call.
class TrustedContact {
  final String name;
  final String number;

  const TrustedContact({required this.name, required this.number});

  Map<String, dynamic> toJson() => {'name': name, 'number': number};

  factory TrustedContact.fromJson(Map<String, dynamic> json) => TrustedContact(
        name: json['name'] as String? ?? '',
        number: json['number'] as String? ?? '',
      );
}

/// Sensitivity level for the scam detector.
enum SensitivityMode {
  conservative,
  balanced,
  sensitive;

  static SensitivityMode fromString(String? raw) {
    switch (raw) {
      case 'balanced':
        return SensitivityMode.balanced;
      case 'sensitive':
        return SensitivityMode.sensitive;
      default:
        return SensitivityMode.conservative;
    }
  }
}

/// Keys used in secure storage.
class SettingsKeys {
  static const onboardingComplete = 'onboarding_complete';
  static const postOnboardingDialogShown = 'post_onboarding_dialog_shown';
  static const callButtonTooltipShown = 'call_button_tooltip_shown';
  static const sensitivityMode =
      'sensitivity_mode'; // e.g. 'conservative', 'balanced', 'sensitive'
  static const trustedContacts =
      'trusted_contacts'; // JSON array of {name, number}
  static const whitelistedSenders =
      'whitelisted_senders'; // JSON array of normalized sender strings
  static const fontScale = 'font_scale'; // double as string, e.g. '1.0'. 1.0 = 100%.
  static const themeMode = 'theme_mode'; // 'light', 'dark', 'system'
  static const languageCode = 'language_code'; // 'en', 'bn', 'kn', etc.
}

/// Secure settings stored in [FlutterSecureStorage].
class SettingsService {
  SettingsService(this._storage);

  final FlutterSecureStorage _storage;

  Future<bool> isOnboardingComplete() async {
    final value =
        await _storage.read(key: SettingsKeys.onboardingComplete);
    return value == 'true';
  }

  Future<void> setOnboardingComplete(bool value) async {
    await _storage.write(
      key: SettingsKeys.onboardingComplete,
      value: value.toString(),
    );
  }

  Future<bool> isPostOnboardingDialogShown() async {
    final value = await _storage.read(
        key: SettingsKeys.postOnboardingDialogShown);
    return value == 'true';
  }

  Future<void> setPostOnboardingDialogShown(bool value) async {
    await _storage.write(
      key: SettingsKeys.postOnboardingDialogShown,
      value: value.toString(),
    );
  }

  Future<bool> isCallButtonTooltipShown() async {
    final value =
        await _storage.read(key: SettingsKeys.callButtonTooltipShown);
    return value == 'true';
  }

  Future<void> setCallButtonTooltipShown(bool value) async {
    await _storage.write(
      key: SettingsKeys.callButtonTooltipShown,
      value: value.toString(),
    );
  }

  /// Get current sensitivity mode. Defaults to [SensitivityMode.conservative].
  Future<SensitivityMode> getSensitivityMode() async {
    final raw = await _storage.read(key: SettingsKeys.sensitivityMode);
    return SensitivityMode.fromString(raw);
  }

  Future<void> setSensitivityMode(SensitivityMode mode) async {
    await _storage.write(
      key: SettingsKeys.sensitivityMode,
      value: mode.name,
    );
  }

  /// Get trusted contacts (name + number). Max 3 for UI.
  Future<List<TrustedContact>> getTrustedContacts() async {
    final raw =
        await _storage.read(key: SettingsKeys.trustedContacts);
    if (raw == null || raw.isEmpty) return const [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is List) {
        return decoded
            .whereType<Map<String, dynamic>>()
            .map(TrustedContact.fromJson)
            .toList();
      }
    } catch (_) {
      // fall through to empty list
    }
    return const [];
  }

  Future<void> setTrustedContacts(
      List<TrustedContact> contacts) async {
    final json = jsonEncode(
        contacts.map((c) => c.toJson()).toList());
    await _storage.write(
      key: SettingsKeys.trustedContacts,
      value: json,
    );
  }

  /// Senders whose messages are silently ignored (no alert shown).
  /// Stored as a JSON array of normalized sender strings.
  Future<List<String>> getWhitelistedSenders() async {
    final raw =
        await _storage.read(key: SettingsKeys.whitelistedSenders);
    if (raw == null || raw.isEmpty) return const [];
    try {
      final decoded = jsonDecode(raw);
      if (decoded is List) {
        return decoded.whereType<String>().toList();
      }
    } catch (_) {}
    return const [];
  }

  Future<void> setWhitelistedSenders(List<String> senders) async {
    await _storage.write(
      key: SettingsKeys.whitelistedSenders,
      value: jsonEncode(senders),
    );
  }

  /// Text scale factor for the whole app (1.0 = 100%). User-adjustable in Settings.
  Future<double> getFontScale() async {
    final value =
        await _storage.read(key: SettingsKeys.fontScale);
    if (value == null) return 1.0;
    return double.tryParse(value) ?? 1.0;
  }

  Future<void> setFontScale(double scale) async {
    await _storage.write(
      key: SettingsKeys.fontScale,
      value: scale.toString(),
    );
  }

  /// Theme mode: 'light', 'dark', or 'system'. Defaults to 'system'.
  Future<String> getThemeMode() async {
    return await _storage.read(key: SettingsKeys.themeMode) ??
        'system';
  }

  Future<void> setThemeMode(String mode) async {
    await _storage.write(
      key: SettingsKeys.themeMode,
      value: mode,
    );
  }

  /// App language code: 'en', 'bn', 'kn', etc. Null means "follow system".
  Future<String?> getLanguageCode() async {
    return _storage.read(key: SettingsKeys.languageCode);
  }

  Future<void> setLanguageCode(String code) async {
    await _storage.write(
      key: SettingsKeys.languageCode,
      value: code,
    );
  }

  /// Clear all secure settings (used for "reset app" flows).
  Future<void> clearAll() async {
    await _storage.deleteAll();
  }
}

