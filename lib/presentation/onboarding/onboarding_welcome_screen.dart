import 'package:flutter/material.dart';
import 'package:elder_shield/l10n/app_localizations.dart';

/// Block 6 — Onboarding screen 1: plain-language intro.
class OnboardingWelcomeScreen extends StatelessWidget {
  const OnboardingWelcomeScreen({
    super.key,
    required this.step,
    required this.totalSteps,
    required this.onGetStarted,
  });

  final int step;
  final int totalSteps;
  final VoidCallback onGetStarted;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                l10n.onboardingStepOf(step, totalSteps),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shield, size: 100, color: Color(0xFF1565C0)),
                    const SizedBox(height: 24),
                    Text(
                      l10n.appTitle,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.onboardingWelcomeBody1,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontSize: 18,
                            height: 1.4,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      l10n.onboardingWelcomeBody2,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            height: 1.4,
                            color: Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 48),
                    SizedBox(
                      width: double.infinity,
                      height: 56,
                      child: ElevatedButton(
                        onPressed: onGetStarted,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1565C0),
                          foregroundColor: Colors.white,
                        ),
                        child: Text(l10n.onboardingGetStarted, style: const TextStyle(fontSize: 18)),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
