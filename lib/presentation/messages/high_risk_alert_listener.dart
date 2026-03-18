import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/data/message_repository.dart';
import 'package:elder_shield/domain/detector/heuristic_detector.dart';
import 'package:elder_shield/platform/launch_sms.dart';
import 'package:elder_shield/presentation/messages/high_risk_warning_sheet.dart';

/// When [pendingHighRiskMessageProvider] is set, shows the high-risk warning sheet.
/// When the app comes to foreground with a pending message, shows the sheet.
/// Also handles the overlay "Open warning" tap: checks getLaunchSms() on every
/// resume so that intent extras placed by ScamOverlayService are picked up even
/// when the app was already running in the background.
/// (Kill-from-notification launch is handled by [LaunchGate] with full-screen warning.)
class HighRiskAlertListener extends ConsumerStatefulWidget {
  const HighRiskAlertListener({super.key, required this.child});

  final Widget child;

  @override
  ConsumerState<HighRiskAlertListener> createState() =>
      _HighRiskAlertListenerState();
}

class _HighRiskAlertListenerState extends ConsumerState<HighRiskAlertListener>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      ref.read(appInForegroundProvider.notifier).state = true;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final isForeground = state == AppLifecycleState.resumed;
    ref.read(appInForegroundProvider.notifier).state = isForeground;
    if (state == AppLifecycleState.resumed) {
      final pending = ref.read(pendingHighRiskMessageProvider);
      if (pending != null) {
        _showSheetFor(pending);
      } else {
        // Check if the app was brought to foreground via the overlay "Open
        // warning" button. ScamOverlayService puts SMS extras on the activity
        // intent; MainActivity.onNewIntent calls setIntent so getLaunchSms()
        // returns them here.
        _checkOverlayLaunch();
      }
    }
  }

  Future<void> _checkOverlayLaunch() async {
    final data = await getLaunchSms().timeout(
      const Duration(seconds: 3),
      onTimeout: () => null,
    );
    if (!mounted || data == null) return;

    final sender = data['sender'] as String?;
    final body = data['body'] as String?;
    final timestamp = (data['timestamp'] as num?)?.toInt() ?? 0;
    if (sender == null || body == null || timestamp <= 0) return;

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
    _showSheetFor(message);
  }

  void _showSheetFor(AnalyzedMessage message) {
    ref.read(pendingHighRiskMessageProvider.notifier).state = null;
    // Navigate to the Messages tab so the warning sheet appears in context.
    ref.read(shellTabIndexProvider.notifier).state = 1;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      showHighRiskWarningSheet(
        context,
        message: message,
        onDismiss: () {},
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen<AnalyzedMessage?>(
      pendingHighRiskMessageProvider,
      (prev, next) {
        if (next != null) _showSheetFor(next);
      },
    );
    return widget.child;
  }
}
