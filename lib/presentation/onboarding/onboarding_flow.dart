import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/presentation/onboarding/onboarding_welcome_screen.dart';
import 'package:elder_shield/presentation/onboarding/onboarding_permissions_screen.dart';
import 'package:elder_shield/presentation/onboarding/onboarding_trusted_contact_screen.dart';

/// Runs the 3-step onboarding; calls [onComplete] when user finishes or skips.
class OnboardingFlow extends ConsumerStatefulWidget {
  const OnboardingFlow({super.key, required this.onComplete});

  final VoidCallback onComplete;

  @override
  ConsumerState<OnboardingFlow> createState() => _OnboardingFlowState();
}

class _OnboardingFlowState extends ConsumerState<OnboardingFlow> {
  int _step = 0;
  static const int _totalSteps = 3;

  void _next() {
    setState(() => _step++);
  }

  void _back() {
    if (_step > 0) setState(() => _step--);
  }

  void _goToTrustedContact() {
    setState(() => _step = 2);
  }

  Future<void> _finishOnboarding() async {
    final settings = ref.read(settingsServiceProvider);
    await settings.setOnboardingComplete(true);
    if (mounted) widget.onComplete();
  }

  @override
  Widget build(BuildContext context) {
    final child = _step == 0
        ? OnboardingWelcomeScreen(
            step: _step + 1,
            totalSteps: _totalSteps,
            onGetStarted: _next,
          )
        : _step == 1
            ? OnboardingPermissionsScreen(
                step: _step + 1,
                totalSteps: _totalSteps,
                onBack: _back,
                onDone: _goToTrustedContact,
                onSkip: _goToTrustedContact,
              )
            : OnboardingTrustedContactScreen(
                step: _step + 1,
                totalSteps: _totalSteps,
                onBack: _back,
                onFinish: _finishOnboarding,
                onSkip: _finishOnboarding,
              );
    return child;
  }
}
