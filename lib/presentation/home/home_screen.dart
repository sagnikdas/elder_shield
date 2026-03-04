import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:elder_shield/application/security_controller.dart';

/// Placeholder Home screen wired up in Block 6.
/// Starts the SecurityController so native events are consumed from app launch.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _permissionsGranted = false;
  bool _requestedOnce = false;

  @override
  void initState() {
    super.initState();
    _ensurePermissionsAndStart();
  }

  Future<void> _ensurePermissionsAndStart() async {
    // Only request once per app lifetime of this widget instance.
    if (_requestedOnce) return;
    _requestedOnce = true;

    final smsStatus = await Permission.sms.status;
    final phoneStatus = await Permission.phone.status;

    if (!smsStatus.isGranted || !phoneStatus.isGranted) {
      final result = await [
        Permission.sms,
        Permission.phone,
      ].request();

      final smsGranted = result[Permission.sms]?.isGranted ?? false;
      final phoneGranted = result[Permission.phone]?.isGranted ?? false;

      if (!smsGranted || !phoneGranted) {
        if (mounted) {
          setState(() {
            _permissionsGranted = false;
          });
        }
        // Do not start SecurityController; native side would throw SecurityException.
        return;
      }
    }

    if (mounted) {
      setState(() {
        _permissionsGranted = true;
      });
    }

    // Permissions are granted — safe to start listening to native events.
    ref.read(securityControllerProvider).start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elder Shield'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.shield, size: 80, color: Color(0xFF1565C0)),
              const SizedBox(height: 24),
              Text(
                _permissionsGranted
                    ? 'Elder Shield is active.'
                    : 'Permissions required to activate Elder Shield.',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              Text(
                _permissionsGranted
                    ? 'Your messages and calls are being monitored for scams.'
                    : 'Please grant SMS and Phone permissions so we can monitor messages and calls for scams.',
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              if (!_permissionsGranted) ...[
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: _ensurePermissionsAndStart,
                  child: const Text('Enable protection'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
