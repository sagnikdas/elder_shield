import 'dart:async';

import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/domain/detector/heuristic_detector.dart';
import 'package:elder_shield/features/messages/data/message_repository.dart';
import 'package:elder_shield/l10n/app_localizations.dart';
import 'package:elder_shield/platform/native_event_stream.dart';
import 'package:elder_shield/services/notification_service.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Tracks whether the user is currently on a phone call.
/// Updated by [SecurityController] on every call-state event.
final isInCallProvider = StateProvider<bool>((ref) => false);

/// Anti-duplicate: don't alert twice for the same message within this window (ms).
const _dedupeWindowMs = 60 * 1000;

/// The [SecurityController] subscribes to native events, runs detection,
/// persists results, and triggers notifications + in-app high-risk sheet.
class SecurityController {
  SecurityController(this._ref);

  final Ref _ref;
  final _detector = const HeuristicDetector();
  StreamSubscription<NativeEvent>? _sub;

  /// Keys "sender|body|timestamp" we've already alerted for (with expiry).
  final _recentAlertKeys = <String>[];
  static const _maxDedupeKeys = 100;

  void start() {
    _sub = NativeEventStream.instance.events.listen(
      _onEvent,
      onError: (Object err) {
        // ignore: avoid_print
        print('[SecurityController] stream error: $err');
      },
    );
  }

  void stop() {
    _sub?.cancel();
    _sub = null;
  }

  void _onEvent(NativeEvent event) {
    switch (event) {
      case NativeSmsEvent(:final sms):
        _handleSms(sms);
      case NativeCallEvent(:final call):
        _handleCallState(call);
    }
  }

  void _handleSms(SmsEvent sms) {
    final inCall = _ref.read(isInCallProvider);
    final result = _detector.analyze(
      sender: sms.sender,
      body: sms.body,
      isInCall: inCall,
    );
    // ignore: avoid_print
    print('[SecurityController] SMS from ${sms.sender} → $result');

    final repo = _ref.read(messageRepositoryProvider);
    unawaited(
      repo
          .saveAnalyzedMessage(
            sender: sms.sender,
            body: sms.body,
            timestamp: sms.timestamp,
            result: result,
          )
          .then((id) => _maybeAlert(
                messageId: id,
                sender: sms.sender,
                body: sms.body,
                timestamp: sms.timestamp,
                result: result,
              ))
          .catchError((Object e) {
        // ignore: avoid_print
        print('[SecurityController] persist/alert error: $e');
      }),
    );
  }

  Future<void> _maybeAlert({
    required int messageId,
    required String sender,
    required String body,
    required int timestamp,
    required DetectionResult result,
  }) async {
    final key = '$sender|$timestamp|${body.hashCode}';
    if (_recentAlertKeys.contains(key)) return;
    if (_recentAlertKeys.length >= _maxDedupeKeys) {
      _recentAlertKeys.removeAt(0);
    }
    _recentAlertKeys.add(key);
    Future.delayed(
      const Duration(milliseconds: _dedupeWindowMs),
      () => _recentAlertKeys.remove(key),
    );

    final band = result.band;
    if (band == RiskBand.low) return;
    final appInForeground = _ref.read(appInForegroundProvider);

    if (appInForeground) {
      // Use current app locale for notification text.
      final context =
          WidgetsBinding.instance.platformDispatcher.implicitView == null
              ? null
              : WidgetsBinding.instance.renderViewElement;
      final l10n = context != null ? AppLocalizations.of(context) : null;
      final title = band == RiskBand.high
          ? (l10n?.highRiskHeaderTitle ??
              'Warning: Possible scam message')
          : (l10n?.messagesFilterHighRisk ??
              'Suspicious message');
      final bodyShort =
          body.length > 80 ? '${body.substring(0, 80)}…' : body;
      final bodyText = l10n != null
          ? l10n.messageFromLabel('$sender — $bodyShort')
          : 'From $sender — $bodyShort';
      await NotificationService.instance.show(
        id: messageId.clamp(0, 0x7FFFFFFF),
        title: title,
        body: bodyText,
      );
    }

    if (band == RiskBand.high) {
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
      _ref.read(pendingHighRiskMessageProvider.notifier).state =
          message;
    }
  }

  void _handleCallState(CallStateEvent call) {
    final inCall =
        call.state == 'OFFHOOK' || call.state == 'RINGING';
    _ref.read(isInCallProvider.notifier).state = inCall;
    // ignore: avoid_print
    print('[SecurityController] Call state → ${call.state}');
  }
}

/// Riverpod provider so the controller can be kept alive at app root.
final securityControllerProvider =
    Provider<SecurityController>((ref) {
  final controller = SecurityController(ref);
  ref.onDispose(controller.stop);
  return controller;
});

