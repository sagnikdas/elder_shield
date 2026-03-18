import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/features/settings/data/settings_service.dart';
import 'package:elder_shield/l10n/app_localizations.dart';

/// Self-protection onboarding flow: 2 steps.
/// 1. Your name
/// 2. Permissions + optional guardian contact
class SelfProtectionFlow extends ConsumerStatefulWidget {
  const SelfProtectionFlow({
    super.key,
    required this.onComplete,
    required this.onBack,
  });

  final VoidCallback onComplete;
  final VoidCallback onBack;

  @override
  ConsumerState<SelfProtectionFlow> createState() => _SelfProtectionFlowState();
}

class _SelfProtectionFlowState extends ConsumerState<SelfProtectionFlow> {
  int _step = 0;
  static const int _totalSteps = 2;

  // Step 1 state
  final _nameController = TextEditingController();

  // Step 2 state — permissions
  bool _requesting = false;
  bool _showRetry = false;
  bool _allGranted = false;

  // Optional guardian
  bool _guardianExpanded = false;
  final _guardianNameController = TextEditingController();
  final _guardianPhoneController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _guardianNameController.dispose();
    _guardianPhoneController.dispose();
    super.dispose();
  }

  Future<void> _saveNameAndContinue() async {
    final name = _nameController.text.trim();
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(AppLocalizations.of(context)!.yourNameValidation)),
      );
      return;
    }
    final settings = ref.read(settingsServiceProvider);
    await settings.setProtectedPersonName(name);
    setState(() => _step = 1);
  }

  void _back() {
    if (_step > 0) {
      setState(() => _step--);
    } else {
      widget.onBack();
    }
  }

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
    final notificationOk = result[Permission.notification]?.isGranted ?? true;
    final allOk = smsOk && phoneOk && notificationOk;

    if (mounted) {
      setState(() {
        _requesting = false;
        _allGranted = allOk;
        if (!allOk) _showRetry = true;
      });
      if (allOk) _finishSetup();
    }
  }

  Future<void> _finishSetup() async {
    // Save optional guardian if filled
    final gName = _guardianNameController.text.trim();
    final gPhone = _guardianPhoneController.text.trim();
    if (gName.isNotEmpty && gPhone.isNotEmpty) {
      final settings = ref.read(settingsServiceProvider);
      await settings.setGuardianContact(
        TrustedContact(name: gName, number: gPhone),
      );
    }
    widget.onComplete();
  }

  @override
  Widget build(BuildContext context) {
    switch (_step) {
      case 0:
        return _buildNameStep(context);
      case 1:
        return _buildPermissionsStep(context);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildNameStep(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _back,
        ),
        title: Text(
          l10n.onboardingStepOf(1, _totalSteps),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
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
                l10n.yourNameTitle,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.yourNameSubtitle,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 28),
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: l10n.yourNameHint,
                  border: const OutlineInputBorder(),
                ),
                style: const TextStyle(fontSize: 20),
                textCapitalization: TextCapitalization.words,
                autofocus: true,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _saveNameAndContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    l10n.yourNameContinue,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPermissionsStep(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: _back,
        ),
        title: Text(
          l10n.onboardingStepOf(2, _totalSteps),
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            24,
            16,
            24,
            24 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
              Text(
                l10n.onboardingPermissionsTitle,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 24),
              _bullet(l10n.onboardingPermissionsBulletMessages),
              const SizedBox(height: 12),
              _bullet(l10n.onboardingPermissionsBulletPhone),
              const SizedBox(height: 20),
              Text(
                l10n.onboardingPermissionsBody1,
                style: TextStyle(
                  fontSize: 17,
                  height: 1.3,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                l10n.onboardingPermissionsBody2,
                style: TextStyle(
                  fontSize: 16,
                  height: 1.3,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 28),

              // Optional guardian section
              InkWell(
                onTap: () =>
                    setState(() => _guardianExpanded = !_guardianExpanded),
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: theme.colorScheme.outlineVariant),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _guardianExpanded
                            ? Icons.expand_less
                            : Icons.expand_more,
                        color: theme.colorScheme.primary,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          l10n.addGuardianOptional,
                          style: TextStyle(
                            fontSize: 15,
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (_guardianExpanded) ...[
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: Text(
                    l10n.addGuardianOptionalSubtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _guardianNameController,
                  decoration: InputDecoration(
                    labelText: l10n.guardianNameLabel,
                    hintText: l10n.guardianNameHint,
                    border: const OutlineInputBorder(),
                  ),
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _guardianPhoneController,
                  decoration: InputDecoration(
                    labelText: l10n.guardianPhoneLabel,
                    hintText: l10n.guardianPhoneHint,
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ],

              const SizedBox(height: 28),
              if (_showRetry) ...[
                Text(
                  l10n.onboardingPermissionsRetryWarning,
                  style: TextStyle(
                    fontSize: 16,
                    color: theme.colorScheme.error,
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
                onPressed: _allGranted ? null : _finishSetup,
                child: Text(
                  l10n.onboardingSkipForNow,
                  style: TextStyle(
                    fontSize: 16,
                    color: _allGranted
                        ? Colors.grey
                        : theme.colorScheme.primary,
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
        const Text(
          '\u2022 ',
          style: TextStyle(fontSize: 20),
        ),
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
