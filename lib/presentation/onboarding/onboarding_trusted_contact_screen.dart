import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:elder_shield/l10n/app_localizations.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/presentation/messages/example_warning_sheet.dart';
import 'package:elder_shield/services/settings_service.dart';
import 'package:elder_shield/utils/haptic.dart';
import 'package:elder_shield/utils/snackbars.dart';

/// Block 6 — Onboarding screen 3: add one trusted contact (name + number).
class OnboardingTrustedContactScreen extends ConsumerStatefulWidget {
  const OnboardingTrustedContactScreen({
    super.key,
    required this.step,
    required this.totalSteps,
    required this.onBack,
    required this.onFinish,
    required this.onSkip,
  });

  final int step;
  final int totalSteps;
  final VoidCallback onBack;
  final VoidCallback onFinish;
  final VoidCallback onSkip;

  @override
  ConsumerState<OnboardingTrustedContactScreen> createState() =>
      _OnboardingTrustedContactScreenState();
}

class _OnboardingTrustedContactScreenState
    extends ConsumerState<OnboardingTrustedContactScreen> {
  final _nameController = TextEditingController();
  final _numberController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }

  Future<void> _pickContact() async {
    final l10n = AppLocalizations.of(context)!;

    // Request runtime contacts permission using permission_handler.
    final status = await Permission.contacts.request();
    if (!status.isGranted) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        elderSnackBar(l10n.snackbarGenericError),
      );
      return;
    }

    // Load contacts with phone numbers and show a simple picker.
    final contacts = await FlutterContacts.getAll();
    if (!context.mounted) return;

    final contactsWithPhones =
        contacts.where((c) => c.phones.isNotEmpty).toList();
    if (contactsWithPhones.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        elderSnackBar(l10n.snackbarGenericError),
      );
      return;
    }

    final contact = await showModalBottomSheet<Contact?>(
      context: context,
      builder: (ctx) => SafeArea(
        child: ListView.builder(
          itemCount: contactsWithPhones.length,
          itemBuilder: (ctx, index) {
            final c = contactsWithPhones[index];
            final number = c.phones.isNotEmpty ? c.phones.first.number : '';
            return ListTile(
              title: Text(c.displayName ?? ''),
              subtitle: Text(number),
              onTap: () => Navigator.of(ctx).pop(c),
            );
          },
        ),
      ),
    );
    if (contact == null) return;

    final phones = contact.phones;
    if (phones.isEmpty) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        elderSnackBar(l10n.snackbarGenericError),
      );
      return;
    }

    final number = phones.first.number;
    final displayName = contact.displayName ?? '';

    _nameController.text = displayName;
    _numberController.text = number;
  }

  Future<void> _addAndFinish() async {
    final name = _nameController.text.trim();
    final number = _numberController.text.trim();
    if (name.isEmpty || number.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        elderSnackBar(AppLocalizations.of(context)!.onboardingTrustedMissingFields),
      );
      return;
    }

    final settings = ref.read(settingsServiceProvider);
    final list = await settings.getTrustedContacts();
    final updated = [...list, TrustedContact(name: name, number: number)];
    if (updated.length > 3) {
      updated.removeRange(3, updated.length);
    }
    await settings.setTrustedContacts(updated);
    if (mounted) widget.onFinish();
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
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            24,
            16,
            24,
            24 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16),
                Text(
                  l10n.onboardingTrustedTitle,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.onboardingTrustedBody1,
                  style: const TextStyle(fontSize: 16, height: 1.4),
                ),
                const SizedBox(height: 8),
                Text(
                  l10n.onboardingTrustedBody2,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 20),
                OutlinedButton.icon(
                  onPressed: () {
                    selectionClick();
                    _pickContact();
                  },
                  icon: const Icon(Icons.contact_phone_outlined),
                  label: Text(l10n.onboardingTrustedAddFromContacts),
                  style: OutlinedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.onboardingTrustedOrEnterManually,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: l10n.settingsContactNameLabel,
                    hintText: l10n.settingsContactNameHint,
                    border: const OutlineInputBorder(),
                  ),
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _numberController,
                  decoration: InputDecoration(
                    labelText: l10n.settingsContactNumberLabel,
                    hintText: l10n.settingsContactNumberHint,
                    border: const OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: _addAndFinish,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1565C0),
                      foregroundColor: Colors.white,
                    ),
                    child: Text(l10n.onboardingTrustedDone, style: const TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: widget.onSkip,
                  child: Text(
                    l10n.onboardingSkipForNow,
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton.icon(
                  onPressed: () {
                    selectionClick();
                    showExampleWarningSheet(context);
                  },
                  icon: const Icon(Icons.visibility_outlined, size: 20),
                  label: Text(l10n.onboardingTrustedSeeWarningCta),
                  style: TextButton.styleFrom(
                    foregroundColor: Theme.of(context).colorScheme.onSurfaceVariant,
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
