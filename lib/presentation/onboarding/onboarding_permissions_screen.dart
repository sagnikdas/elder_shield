import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

/// Block 6 — Onboarding screen 2: explain permissions, then request them.
class OnboardingPermissionsScreen extends StatefulWidget {
  const OnboardingPermissionsScreen({
    super.key,
    required this.onDone,
    required this.onSkip,
  });

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              Text(
                'Why we need access',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
              ),
              const SizedBox(height: 24),
              _bullet(
                'Messages: so we can read your texts and warn you if one looks like a scam.',
              ),
              const SizedBox(height: 12),
              _bullet(
                'Phone: so we know when you are on a call. Scammers often ask for OTPs while you are on the phone.',
              ),
              const SizedBox(height: 20),
              Text(
                'When you tap "Allow Permissions" below, your device will ask for: Messages, Phone, and Notifications (so we can alert you about possible scams even when the app is closed).',
                style: TextStyle(
                  fontSize: 14,
                  height: 1.3,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
              const Spacer(),
              if (_showRetry) ...[
                Text(
                  'Some permissions were denied. Protection will be limited until you allow them.',
                  style: TextStyle(
                    fontSize: 14,
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
                      : Text(_showRetry ? 'Try Again' : 'Allow Permissions',
                          style: const TextStyle(fontSize: 18)),
                ),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: _allGranted ? null : widget.onSkip,
                child: Text(
                  'Skip for now',
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
        const Text('• ', style: TextStyle(fontSize: 18)),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, height: 1.4),
          ),
        ),
      ],
    );
  }
}
