import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/services/settings_service.dart';

/// Block 6 — Onboarding screen 3: add one trusted contact (name + number).
class OnboardingTrustedContactScreen extends ConsumerStatefulWidget {
  const OnboardingTrustedContactScreen({
    super.key,
    required this.onFinish,
    required this.onSkip,
  });

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

  Future<void> _addAndFinish() async {
    final name = _nameController.text.trim();
    final number = _numberController.text.trim();
    if (name.isEmpty || number.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter both name and number')),
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
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(
            24,
            24,
            24,
            24 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 32),
                Text(
                  'Add a trusted contact',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Someone you can call if you get a scary message — like a family member.',
                  style: TextStyle(fontSize: 16, height: 1.4),
                ),
                const SizedBox(height: 8),
                Text(
                  'By adding them, you can call this person with one tap from the Home screen or when we show a scam warning.',
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.4,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(height: 24),
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    hintText: 'e.g. My son',
                    border: OutlineInputBorder(),
                  ),
                  textCapitalization: TextCapitalization.words,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _numberController,
                  decoration: const InputDecoration(
                    labelText: 'Phone number',
                    hintText: 'e.g. +91 98765 43210',
                    border: OutlineInputBorder(),
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
                    child: const Text('Done', style: TextStyle(fontSize: 18)),
                  ),
                ),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: widget.onSkip,
                  child: Text(
                    'Skip for now',
                    style: TextStyle(
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.primary,
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
