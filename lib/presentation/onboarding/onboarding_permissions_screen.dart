import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:elder_shield/l10n/app_localizations.dart';

/// Block 6 — Onboarding screen 2: explain permissions, then request them.
class OnboardingPermissionsScreen extends StatefulWidget {
  const OnboardingPermissionsScreen({
    super.key,
    required this.step,
    required this.totalSteps,
    required this.onBack,
    required this.onDone,
    required this.onSkip,
  });

  final int step;
  final int totalSteps;
  final VoidCallback onBack;
  final VoidCallback onDone;
  final VoidCallback onSkip;

  @override
  State<OnboardingPermissionsScreen> createState() =>
      _OnboardingPermissionsScreenState();
}

class _OnboardingPermissionsScreenState
    extends State<OnboardingPermissionsScreen> {
  bool _requesting = false;
  bool _showRetry = false;
  bool _allGranted = false;

  Future<void> _requestPermissions() async {
    setState(() {
      _requesting = true;
      _showRetry = false;
    });

    final result = await [
      Permission.sms,
      Permission.phone,
      Permission.notification,
    ].request();

    final smsOk = result[Permission.sms]?.isGranted ?? false;
    final phoneOk = result[Permission.phone]?.isGranted ?? false;
    final notificationOk = result[Permission.notification]?.isGranted ?? true; // pre-Android 13 no runtime ask
    final allOk = smsOk && phoneOk && notificationOk;

    if (mounted) {
      setState(() {
        _requesting = false;
        _allGranted = allOk;
        if (!allOk) _showRetry = true;
      });
      if (allOk) widget.onDone();
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: widget.onBack,
        ),
        title: Text(
          l10n.onboardingStepOf(widget.step, widget.totalSteps),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Text(
                l10n.onboardingPermissionsTitle,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
              ),
              const SizedBox(height: 24),
              _bullet(
                l10n.onboardingPermissionsBulletMessages,
              ),
              const SizedBox(height: 12),
              _bullet(
                l10n.onboardingPermissionsBulletPhone,
              ),
              const SizedBox(height: 20),
              Text(
                l10n.onboardingPermissionsBody1,
                style: TextStyle(
                  fontSize: 17,
                  height: 1.3,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.onboardingPermissionsBody2,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.3,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              if (_showRetry) ...[
                Text(
                  l10n.onboardingPermissionsRetryWarning,
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.error,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
              ],
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _requesting ? null : _requestPermissions,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    foregroundColor: Colors.white,
                  ),
                  child: _requesting
                      ? const SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : Text(
                          _showRetry
                              ? l10n.onboardingPermissionsPrimaryRetry
                              : l10n.onboardingPermissionsPrimaryAllow,
                          style: const TextStyle(fontSize: 18),
                        ),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: _allGranted ? null : widget.onSkip,
                child: Text(
                  l10n.onboardingSkipForNow,
                  style: TextStyle(
                    fontSize: 16,
                    color: _allGranted
                        ? Colors.grey
                        : Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  Widget _bullet(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('• ', style: TextStyle(fontSize: 20)),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 18, height: 1.4),
          ),
        ),
      ],
    );
  }
}
