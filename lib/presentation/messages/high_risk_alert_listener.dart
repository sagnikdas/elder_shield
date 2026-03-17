import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/data/message_repository.dart';
import 'package:elder_shield/presentation/messages/high_risk_warning_sheet.dart';

/// When [pendingHighRiskMessageProvider] is set, shows the high-risk warning sheet.
/// When the app comes to foreground with a pending message, shows the sheet.
/// (Launch from "possible scam" notification is handled by [LaunchGate] with full-screen warning.)
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
      if (pending != null) _showSheetFor(pending);
    }
  }

  void _showSheetFor(AnalyzedMessage message) {
    ref.read(pendingHighRiskMessageProvider.notifier).state = null;
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
