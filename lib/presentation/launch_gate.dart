import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/data/message_repository.dart';
import 'package:elder_shield/domain/detector/heuristic_detector.dart';
import 'package:elder_shield/platform/launch_sms.dart';
import 'package:elder_shield/presentation/messages/full_screen_warning_screen.dart';
import 'package:elder_shield/presentation/messages/high_risk_alert_listener.dart';
import 'package:elder_shield/presentation/shell/main_shell.dart';

/// After onboarding: if the app was opened from the "possible scam" notification
/// (app was killed), shows the warning in full screen first; otherwise shows main app.
class LaunchGate extends ConsumerStatefulWidget {
  const LaunchGate({super.key});

  @override
  ConsumerState<LaunchGate> createState() => _LaunchGateState();
}

class _LaunchGateState extends ConsumerState<LaunchGate> {
  bool _checked = false;
  AnalyzedMessage? _launchHighRiskMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkLaunchSms());
  }

  Future<void> _checkLaunchSms() async {
    final data = await getLaunchSms().timeout(
      const Duration(seconds: 5),
      onTimeout: () => null,
    );
    if (!mounted) return;
    if (data == null) {
      setState(() => _checked = true);
      return;
    }
    final sender = data['sender'] as String?;
    final body = data['body'] as String?;
    final timestamp = (data['timestamp'] as num?)?.toInt() ?? 0;
    if (sender == null || body == null || timestamp <= 0) {
      setState(() => _checked = true);
      return;
    }

    const detector = HeuristicDetector();
    final result = detector.analyze(sender: sender, body: body, isInCall: false);
    final repo = ref.read(messageRepositoryProvider);
    final messageId = await repo.saveAnalyzedMessage(
      sender: sender,
      body: body,
      timestamp: timestamp,
      result: result,
    );
    if (!mounted) return;
    if (result.band == RiskBand.high) {
      final message = AnalyzedMessage(
        id: messageId,
        sender: sender,
        body: body,
        timestamp: timestamp,
        score: result.score,
        band: result.band,
        reasons: result.reasons,
        feedbackLabel: null,
      );
      setState(() {
        _checked = true;
        _launchHighRiskMessage = message;
      });
    } else {
      setState(() => _checked = true);
    }
  }

  void _dismissFullScreenWarning() {
    setState(() => _launchHighRiskMessage = null);
  }

  @override
  Widget build(BuildContext context) {
    if (!_checked) {
      return const Scaffold(
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 12),
              Text('Checking…'),
            ],
          ),
        ),
      );
    }
    if (_launchHighRiskMessage != null) {
      return FullScreenWarningScreen(
        message: _launchHighRiskMessage!,
        onDismiss: _dismissFullScreenWarning,
      );
    }
    return const HighRiskAlertListener(child: MainShell());
  }
}
