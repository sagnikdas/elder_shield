import 'package:flutter/services.dart';

/// Light haptic feedback for taps and selections.
void lightImpact() {
  HapticFeedback.lightImpact();
}

/// Medium haptic for important actions (e.g. selection change).
void mediumImpact() {
  HapticFeedback.mediumImpact();
}

/// Selection click for toggles, chips, list items.
void selectionClick() {
  HapticFeedback.selectionClick();
}
