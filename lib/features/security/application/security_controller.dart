import 'dart:async';

import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/domain/detector/heuristic_detector.dart';
import 'package:elder_shield/features/messages/data/message_repository.dart';
import 'package:elder_shield/l10n/app_localizations.dart';
import 'package:elder_shield/platform/native_event_stream.dart';
import 'package:elder_shield/services/notification_service.dart';
import 'package:elder_shield/utils/sender_utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Tracks whether the user is currently on a phone call.
/// Updated by [SecurityController] on every call-state event.
final isInCallProvider = StateProvider<bool>((ref) => false);

/// Anti-duplicate: don't alert twice for the same message within this window.
const _dedupeWindow = Duration(minutes: 1);

/// The [SecurityController] subscribes to native events, runs detection,
/// persists results, and triggers notifications + in-app high-risk sheet.
class SecurityController {
  SecurityController(this._ref);

  final Ref _ref;
  final _detector = const HeuristicDetector();
  StreamSubscription<NativeEvent>? _sub;

  /// Maps dedup key → expiry time. O(1) lookup and automatic TTL via expiry check.
  final _recentAlertKeys = <String, DateTime>{};

  void start() {
    _sub = NativeEventStream.instance.events.listen(
      _onEvent,
      onError: (Object err) {
        debugPrint('[SecurityController] stream error: $err');
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
    if (sms.body.trim().isEmpty) return;

    // Skip whitelisted senders entirely — no alert, no DB save.
    final whitelist = _ref.read(whitelistedSendersProvider);
    if (whitelist.contains(normalizeSender(sms.sender))) {
      debugPrint('[SecurityController] ${sms.sender} is whitelisted — skipping');
      return;
    }

    // Skip TRAI DLT-verified sender headers — no alert, no DB save.
    if (_isTrustedDltSender(sms.sender)) {
      debugPrint('[SecurityController] ${sms.sender} is DLT-trusted — skipping');
      return;
    }

    final inCall = _ref.read(isInCallProvider);
    final result = _detector.analyze(
      sender: sms.sender,
      body: sms.body,
      isInCall: inCall,
    );
    debugPrint('[SecurityController] SMS from ${sms.sender} → $result');

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
        debugPrint('[SecurityController] persist/alert error: $e');
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
    final now = DateTime.now();
    // Purge expired entries to prevent unbounded growth.
    _recentAlertKeys.removeWhere((_, expiry) => expiry.isBefore(now));
    if (_recentAlertKeys.containsKey(key)) return;
    _recentAlertKeys[key] = now.add(_dedupeWindow);

    final band = result.band;
    if (band == RiskBand.low) return;

    // Suppress alerts for senders the user has previously marked safe.
    // The message is still saved to history; only the alert is silenced.
    final repo = _ref.read(messageRepositoryProvider);
    if (await repo.hasSafeFeedback(sender)) {
      debugPrint('[SecurityController] $sender has safe feedback — suppressing alert');
      return;
    }

    final appInForeground = _ref.read(appInForegroundProvider);

    if (appInForeground) {
      // Use current app locale for notification text.
      final context =
          WidgetsBinding.instance.platformDispatcher.implicitView == null
              ? null
              : WidgetsBinding.instance.rootElement;
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

  /// Returns true when [sender] is a TRAI DLT-registered header.
  /// Matches on the entity-code suffix after the two-letter telco prefix
  /// (e.g. "AD-SBIBNK" → "SBIBNK"), so a single entry covers all operators.
  /// Falls back to an exact uppercase match for gateways that strip the prefix.
  bool _isTrustedDltSender(String sender) {
    final upper = sender.toUpperCase().trim();
    final suffixes = HeuristicDetector.config.trustedDltSuffixes;
    // DLT format: 2-letter telco code + '-' + entity code
    if (upper.length > 3 && upper[2] == '-') {
      final entityCode = upper.substring(3);
      if (suffixes.contains(entityCode)) return true;
    }
    return suffixes.contains(upper);
  }

  void _handleCallState(CallStateEvent call) {
    final inCall =
        call.state == CallState.offhook || call.state == CallState.ringing;
    _ref.read(isInCallProvider.notifier).state = inCall;
    debugPrint('[SecurityController] Call state → ${call.state}');
  }
}

/// Riverpod provider so the controller can be kept alive at app root.
final securityControllerProvider =
    Provider<SecurityController>((ref) {
  final controller = SecurityController(ref);
  ref.onDispose(controller.stop);
  return controller;
});

