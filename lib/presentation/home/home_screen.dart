import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/application/security_controller.dart';
import 'package:elder_shield/utils/haptic.dart';
import 'package:elder_shield/utils/responsive.dart';

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
    final padding = horizontalPadding(context);
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final riskCardColor = _todayRiskCount > 0
        ? (isDark ? Colors.orange.shade900.withValues(alpha: 0.3) : Colors.orange.shade50)
        : (isDark ? theme.colorScheme.surfaceContainerHighest : Colors.grey.shade100);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/icon/icon.png', fit: BoxFit.contain),
        ),
        title: const Text('Elder Shield'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          lightImpact();
          await _loadTodayCount();
          await _loadTrustedContact();
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(padding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: verticalPadding(context)),
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
                    onPressed: () {
                      lightImpact();
                      _ensurePermissionsAndStart();
                    },
                    child: const Text('Enable protection'),
                  ),
                ],
                SizedBox(height: verticalPadding(context) * 1.5),
                // Today's risk summary (tappable -> Messages tab)
                Material(
                  color: riskCardColor,
                  borderRadius: BorderRadius.circular(12),
                  child: InkWell(
                    onTap: () {
                      selectionClick();
                      ref.read(shellTabIndexProvider.notifier).state = 1;
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Padding(
                      padding: EdgeInsets.all(padding * 0.75),
                      child: Text(
                        _todayRiskCount > 0
                            ? '$_todayRiskCount suspicious message${_todayRiskCount == 1 ? '' : 's'} detected today.'
                            : 'No suspicious activity today.',
                        style: theme.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: verticalPadding(context) * 1.5),
                // Large Call trusted contact button (min 56 dp)
                if (hasTrusted)
                  SizedBox(
                    height: 64,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        selectionClick();
                        _callTrustedContact();
                      },
                      icon: const Icon(Icons.phone, size: 28),
                      label: Text(
                        'Call ${_trustedContactName?.isNotEmpty == true ? _trustedContactName! : 'Trusted Contact'}',
                        style: const TextStyle(fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: theme.colorScheme.primary,
                        foregroundColor: theme.colorScheme.onPrimary,
                      ),
                    ),
                  )
                else
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(padding),
                      child: Column(
                        children: [
                          Text(
                            'Add a trusted contact so you can call them quickly if you get a scary message.',
                            style: theme.textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          TextButton.icon(
                            onPressed: () {
                              selectionClick();
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
