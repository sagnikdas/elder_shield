import 'package:flutter/widgets.dart';

/// Centralized route names for Elder Shield.
///
/// These are used with [Navigator] and [onGenerateRoute] so that
/// navigation remains explicit and testable.
abstract final class AppRoutes {
  static const String root = '/';
  static const String onboarding = '/onboarding';
  static const String shell = '/shell';
  static const String messages = '/messages';
  static const String settings = '/settings';
  static const String messageDetail = '/messages/detail';
}

/// Arguments for navigating to a specific analyzed message.
@immutable
class MessageDetailArgs {
  const MessageDetailArgs({required this.messageId});

  final int messageId;
}

