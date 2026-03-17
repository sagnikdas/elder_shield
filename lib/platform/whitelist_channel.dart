import 'package:flutter/services.dart';

/// Syncs the trusted-sender whitelist to the Kotlin layer so that
/// [SimpleRiskCheck] can skip whitelisted senders when the app is killed.
///
/// This is best-effort: failures are swallowed. The Dart-side check in
/// [SecurityController] is the authoritative gate; the Kotlin side is a
/// supplement for the background / killed-app path.
class WhitelistChannel {
  static const _channel = MethodChannel('elder_shield/whitelist');

  static Future<void> setWhitelist(List<String> normalizedSenders) async {
    try {
      await _channel.invokeMethod<void>('setWhitelist', normalizedSenders);
    } catch (_) {
      // Best-effort only.
    }
  }
}
