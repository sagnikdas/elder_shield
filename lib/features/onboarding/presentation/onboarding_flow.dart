import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/features/onboarding/presentation/caregiver_flow.dart';
import 'package:elder_shield/features/onboarding/presentation/role_selection_screen.dart';
import 'package:elder_shield/features/onboarding/presentation/self_protection_flow.dart';

/// Feature-level export of the role-based onboarding flow.
///
/// Flow:
/// 1. RoleSelectionScreen — user picks caregiver or self-protection
/// 2a. CaregiverFlow (3 steps: name person, add guardian, permissions)
/// 2b. SelfProtectionFlow (2 steps: your name, permissions + optional guardian)
/// Both paths finish by calling [onComplete].
class OnboardingFlow extends ConsumerStatefulWidget {
  const OnboardingFlow({super.key, required this.onComplete});

  final VoidCallback onComplete;

  @override
  ConsumerState<OnboardingFlow> createState() => _OnboardingFlowState();
}

enum _OnboardingPhase { roleSelection, caregiver, selfProtection }

class _OnboardingFlowState extends ConsumerState<OnboardingFlow> {
  _OnboardingPhase _phase = _OnboardingPhase.roleSelection;

  Future<void> _selectRole(String role) async {
    final settings = ref.read(settingsServiceProvider);
    await settings.setUserRole(role);
    setState(() {
      _phase = role == 'caregiver'
          ? _OnboardingPhase.caregiver
          : _OnboardingPhase.selfProtection;
    });
  }

  void _backToRoleSelection() {
    setState(() => _phase = _OnboardingPhase.roleSelection);
  }

  Future<void> _finishOnboarding() async {
    final settings = ref.read(settingsServiceProvider);
    await settings.setOnboardingComplete(true);
    if (mounted) widget.onComplete();
  }

  @override
  Widget build(BuildContext context) {
    switch (_phase) {
      case _OnboardingPhase.roleSelection:
        return RoleSelectionScreen(
          onCaregiver: () => _selectRole('caregiver'),
          onSelfProtection: () => _selectRole('self'),
        );
      case _OnboardingPhase.caregiver:
        return CaregiverFlow(
          onComplete: _finishOnboarding,
          onBack: _backToRoleSelection,
        );
      case _OnboardingPhase.selfProtection:
        return SelfProtectionFlow(
          onComplete: _finishOnboarding,
          onBack: _backToRoleSelection,
        );
    }
  }
}
