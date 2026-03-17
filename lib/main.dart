import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:elder_shield/domain/detector/detector_config.dart';
import 'package:elder_shield/domain/detector/heuristic_detector.dart';
import 'package:elder_shield/services/notification_service.dart';

import 'app.dart';

// URL of the remotely hosted detector configuration JSON.
// When pushed to GitHub, replace <user>, <repo>, and <branch> accordingly.
const _detectorConfigUrl =
    'https://raw.githubusercontent.com/sagnikdas/eproj_sms/refs/heads/main/config/detector-config.json';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Install a safe default config synchronously so the detector is usable
  // immediately, without any IO.
  HeuristicDetector.updateConfig(DetectorConfig.defaults());

  // Show UI as soon as possible; avoid blocking on secure storage, networking,
  // or notification initialization on the startup frame.
  runApp(const ProviderScope(child: ElderShieldApp()));

  // Fire-and-forget background work that touches plugins / IO. This reduces
  // the chance of main-thread jank and avoids doing work when the engine is
  // being torn down.
  unawaited(_bootstrapDetectorConfigFromStorage());
  unawaited(_refreshDetectorConfigFromRemote());
  unawaited(NotificationService.instance.init());
}

/// Try to load a cached detector configuration from secure storage and, if
/// valid, apply it via [HeuristicDetector.updateConfig].
///
/// If anything fails, we keep using the defaults installed in [main].
Future<void> _bootstrapDetectorConfigFromStorage() async {
  const storage = FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );
  const key = 'detector_config_v1';

  try {
    final raw = await storage.read(key: key);
    if (raw == null || raw.isEmpty) {
      return;
    }

    final decoded = jsonDecode(raw);
    if (decoded is! Map<String, dynamic>) {
      return;
    }

    final config = DetectorConfig.fromJson(decoded);
    HeuristicDetector.updateConfig(config);
  } catch (_) {
    // On any error, we keep using the default config.
  }
}

/// Silently fetch detector configuration from a remote JSON endpoint and
/// persist it for future launches.
///
/// This runs in the background; failures are ignored and do not affect the app.
Future<void> _refreshDetectorConfigFromRemote() async {
  if (_detectorConfigUrl.isEmpty) return;

  try {
    final uri = Uri.parse(_detectorConfigUrl);
    final response = await http.get(uri);
    if (response.statusCode != 200) return;

    final body = response.body;
    if (body.isEmpty) return;

    final decoded = jsonDecode(body);
    if (decoded is! Map<String, dynamic>) return;

    final config = DetectorConfig.fromJson(decoded);

    const storage = FlutterSecureStorage(
      aOptions: AndroidOptions(encryptedSharedPreferences: true),
    );
    const key = 'detector_config_v1';

    await storage.write(key: key, value: body);
    HeuristicDetector.updateConfig(config);
  } catch (_) {
    // Network / parse / storage errors are intentionally swallowed.
  }
}

