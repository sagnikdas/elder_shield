import 'package:flutter/services.dart';

const _channel = MethodChannel('elder_shield/launch');

/// When the app was opened from the "possible scam" notification (app was killed),
/// returns the SMS that triggered it so Flutter can analyze and show the warning sheet.
/// Returns null if not launched from that notification.
Future<Map<String, dynamic>?> getLaunchSms() async {
  try {
    final result = await _channel.invokeMethod<Map<Object?, Object?>>('getLaunchSms');
    if (result == null) return null;
    return Map<String, dynamic>.from(
      result.map((k, v) => MapEntry(k as String, v)),
    );
  } on PlatformException {
    return null;
  }
}
