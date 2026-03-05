import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/application/security_controller.dart';

/// Home: protection status, today risk count, large "Call trusted contact" button.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _permissionsGranted = false;
  bool _requestedOnce = false;
  int _todayRiskCount = 0;
  String? _trustedContactName;
  String? _trustedContactNumber;

  @override
  void initState() {
    super.initState();
    _ensurePermissionsAndStart();
    _loadTrustedContact();
    _loadTodayCount();
  }

  Future<void> _loadTrustedContact() async {
    final settings = ref.read(settingsServiceProvider);
    final list = await settings.getTrustedContacts();
    if (mounted && list.isNotEmpty) {
      setState(() {
        _trustedContactName = list.first.name;
        _trustedContactNumber = list.first.number;
      });
    }
  }

  Future<void> _loadTodayCount() async {
    final repo = ref.read(messageRepositoryProvider);
    final count = await repo.fetchTodayRiskCount();
    if (mounted) setState(() => _todayRiskCount = count);
  }

  Future<void> _ensurePermissionsAndStart() async {
    if (_requestedOnce) return;
    _requestedOnce = true;

    final smsStatus = await Permission.sms.status;
    final phoneStatus = await Permission.phone.status;

    final notificationStatus = await Permission.notification.status;
    if (!smsStatus.isGranted || !phoneStatus.isGranted || !notificationStatus.isGranted) {
      final result = await [
        Permission.sms,
        Permission.phone,
        Permission.notification,
      ].request();

      final smsGranted = result[Permission.sms]?.isGranted ?? false;
      final phoneGranted = result[Permission.phone]?.isGranted ?? false;
      final notificationGranted = result[Permission.notification]?.isGranted ?? true;

      if (!smsGranted || !phoneGranted || !notificationGranted) {
        if (mounted) setState(() => _permissionsGranted = false);
        return;
      }
    }

    if (mounted) {
      setState(() => _permissionsGranted = true);
    }
    ref.read(securityControllerProvider).start();
  }

  Future<void> _callTrustedContact() async {
    final number = _trustedContactNumber?.trim();
    if (number == null || number.isEmpty) return;
    final uri = Uri.parse('tel:${number.replaceAll(RegExp(r'\s'), '')}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final hasTrusted = _trustedContactNumber != null &&
        _trustedContactNumber!.trim().isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Elder Shield'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await _loadTodayCount();
          await _loadTrustedContact();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                // Protection status
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _permissionsGranted ? Icons.shield : Icons.shield_outlined,
                      size: 48,
                      color: _permissionsGranted
                          ? Colors.green
                          : Colors.amber.shade700,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      _permissionsGranted ? 'Protected' : 'Permissions needed',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                if (!_permissionsGranted) ...[
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _ensurePermissionsAndStart,
                    child: const Text('Enable protection'),
                  ),
                ],
                const SizedBox(height: 32),
                // Today's risk summary (tappable -> Messages tab in Block 7)
                Material(
                  color: _todayRiskCount > 0
                      ? Colors.orange.shade50
                      : Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    onTap: () =>
                        ref.read(shellTabIndexProvider.notifier).state = 1,
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        _todayRiskCount > 0
                            ? '$_todayRiskCount suspicious message${_todayRiskCount == 1 ? '' : 's'} detected today.'
                            : 'No suspicious activity today.',
                        style: const TextStyle(fontSize: 16),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                // Large Call trusted contact button (min 56 dp)
                if (hasTrusted)
                  SizedBox(
                    height: 64,
                    child: ElevatedButton.icon(
                      onPressed: _callTrustedContact,
                      icon: const Icon(Icons.phone, size: 28),
                      label: Text(
                        'Call ${_trustedContactName?.isNotEmpty == true ? _trustedContactName! : 'Trusted Contact'}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1565C0),
                        foregroundColor: Colors.white,
                      ),
                    ),
                  )
                else
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          const Text(
                            'Add a trusted contact so you can call them quickly if you get a scary message.',
                            style: TextStyle(fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          TextButton.icon(
                            onPressed: () {
                              ref.read(shellTabIndexProvider.notifier).state = 2;
                            },
                            icon: const Icon(Icons.person_add),
                            label: const Text('Add a trusted contact'),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
