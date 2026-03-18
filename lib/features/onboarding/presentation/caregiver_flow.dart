import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/features/settings/data/settings_service.dart';
import 'package:elder_shield/l10n/app_localizations.dart';
import 'package:elder_shield/presentation/onboarding/onboarding_permissions_screen.dart';

/// Caregiver onboarding flow: 3 steps within a single widget.
/// 1. Name the protected person
/// 2. Add yourself as guardian
/// 3. Permissions
class CaregiverFlow extends ConsumerStatefulWidget {
  const CaregiverFlow({
    super.key,
    required this.onComplete,
    required this.onBack,
  });

  final VoidCallback onComplete;
  final VoidCallback onBack;

  @override
  ConsumerState<CaregiverFlow> createState() => _CaregiverFlowState();
}

class _CaregiverFlowState extends ConsumerState<CaregiverFlow> {
  int _step = 0;
  static const int _totalSteps = 3;

  // Step 1 state
  String? _selectedPreset;
  final _customNameController = TextEditingController();

  // Step 2 state
  final _guardianNameController = TextEditingController();
  final _guardianPhoneController = TextEditingController();

  @override
  void dispose() {
    _customNameController.dispose();
    _guardianNameController.dispose();
    _guardianPhoneController.dispose();
    super.dispose();
  }

  String _resolvedName() {
    final custom = _customNameController.text.trim();
    if (custom.isNotEmpty) return custom;
    return _selectedPreset ?? '';
  }

  Future<void> _saveNameAndContinue() async {
    final name = _resolvedName();
    if (name.isEmpty) {
      _showValidation(AppLocalizations.of(context)!.namePersonValidation);
      return;
    }
    final settings = ref.read(settingsServiceProvider);
    await settings.setProtectedPersonName(name);
    setState(() => _step = 1);
  }

  Future<void> _saveGuardianAndContinue() async {
    final l10n = AppLocalizations.of(context)!;
    final gName = _guardianNameController.text.trim();
    final gPhone = _guardianPhoneController.text.trim();
    if (gName.isEmpty || gPhone.isEmpty) {
      _showValidation(l10n.guardianValidation);
      return;
    }
    final settings = ref.read(settingsServiceProvider);
    await settings.setGuardianContact(
      TrustedContact(name: gName, number: gPhone),
    );
    setState(() => _step = 2);
  }

  void _showValidation(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _back() {
    if (_step > 0) {
      setState(() => _step--);
    } else {
      widget.onBack();
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (_step) {
      case 0:
        return _buildNameStep(context);
      case 1:
        return _buildGuardianStep(context);
      case 2:
        return OnboardingPermissionsScreen(
          step: 3,
          totalSteps: _totalSteps,
          onBack: _back,
          onDone: widget.onComplete,
          onSkip: widget.onComplete,
        );
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildNameStep(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    final presets = [
      l10n.presetNameMaa,
      l10n.presetNamePapa,
      l10n.presetNameDadi,
      l10n.presetNameDada,
      l10n.presetNameNani,
      l10n.presetNameNana,
    ];

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
                l10n.namePersonTitle,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.namePersonSubtitle,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: presets.map((name) {
                  final selected = _selectedPreset == name &&
                      _customNameController.text.trim().isEmpty;
                  return ChoiceChip(
                    label: Text(
                      name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                            selected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    selected: selected,
                    selectedColor: theme.colorScheme.primaryContainer,
                    onSelected: (val) {
                      setState(() {
                        _selectedPreset = val ? name : null;
                        if (val) _customNameController.clear();
                      });
                    },
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _customNameController,
                decoration: InputDecoration(
                  hintText: l10n.namePersonCustomHint,
                  border: const OutlineInputBorder(),
                ),
                style: const TextStyle(fontSize: 18),
                textCapitalization: TextCapitalization.words,
                onChanged: (_) {
                  if (_customNameController.text.trim().isNotEmpty) {
                    setState(() => _selectedPreset = null);
                  }
                },
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
                    l10n.namePersonContinue,
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

  Widget _buildGuardianStep(BuildContext context) {
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
                l10n.guardianTitle,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                l10n.guardianSubtitle,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontSize: 16,
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 28),
              TextField(
                controller: _guardianNameController,
                decoration: InputDecoration(
                  labelText: l10n.guardianNameLabel,
                  hintText: l10n.guardianNameHint,
                  border: const OutlineInputBorder(),
                ),
                style: const TextStyle(fontSize: 17),
                textCapitalization: TextCapitalization.words,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _guardianPhoneController,
                decoration: InputDecoration(
                  labelText: l10n.guardianPhoneLabel,
                  hintText: l10n.guardianPhoneHint,
                  border: const OutlineInputBorder(),
                ),
                style: const TextStyle(fontSize: 17),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _saveGuardianAndContinue,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1565C0),
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    l10n.guardianContinue,
                    style: const TextStyle(fontSize: 18),
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
}
