import 'package:flutter/material.dart';

import 'package:elder_shield/core/design_tokens.dart';

/// Primary button used across the app with subtle press feedback.
class AppButton extends StatefulWidget {
  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.expand = true,
  });

  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final bool expand;

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  bool _pressed = false;

  void _setPressed(bool value) {
    if (_pressed == value) return;
    setState(() => _pressed = value);
  }

  @override
  Widget build(BuildContext context) {
    final scale = _pressed ? 0.97 : 1.0;

    final button = Listener(
      onPointerDown: widget.onPressed == null
          ? null
          : (_) => _setPressed(true),
      onPointerUp: widget.onPressed == null
          ? null
          : (_) => _setPressed(false),
      onPointerCancel: widget.onPressed == null
          ? null
          : (_) => _setPressed(false),
      child: AnimatedScale(
        scale: scale,
        duration: DesignTokens.animationFast,
        curve: DesignTokens.animationEaseOutCubic,
        child: FilledButton.icon(
          onPressed: widget.onPressed,
          icon: widget.icon != null
              ? Icon(widget.icon, size: 22)
              : const SizedBox.shrink(),
          label: Text(widget.label),
          style: FilledButton.styleFrom(
            minimumSize: const Size.fromHeight(
              DesignTokens.minTouchTarget,
            ),
          ),
        ),
      ),
    );

    if (!widget.expand) return button;

    return SizedBox(
      width: double.infinity,
      child: button,
    );
  }
}


