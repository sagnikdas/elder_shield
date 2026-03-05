import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/presentation/settings/about_screen.dart';
import 'package:elder_shield/presentation/settings/permissions_explained_screen.dart';
import 'package:elder_shield/presentation/settings/privacy_policy_screen.dart';
import 'package:elder_shield/services/settings_service.dart';
import 'package:elder_shield/utils/haptic.dart';
import 'package:elder_shield/utils/responsive.dart';

/// Settings: collapsible sections (Appearance, Text size, Legal, Sensitivity, Trusted contacts), theme, haptics.
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  String _sensitivityMode = 'conservative';
  String _themeMode = 'system';
  List<TrustedContact> _contacts = [];

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final settings = ref.read(settingsServiceProvider);
    final mode = await settings.getSensitivityMode();
    final theme = await settings.getThemeMode();
    final contacts = await settings.getTrustedContacts();
    if (mounted) {
      setState(() {
        _sensitivityMode = mode;
        _themeMode = theme;
        _contacts = contacts;
      });
    }
  }

  Future<void> _setThemeMode(String mode) async {
    selectionClick();
    final settings = ref.read(settingsServiceProvider);
    await settings.setThemeMode(mode);
    ref.read(themeModeProvider.notifier).state = mode;
    setState(() => _themeMode = mode);
  }

  Future<void> _setSensitivity(String mode) async {
    selectionClick();
    final settings = ref.read(settingsServiceProvider);
    await settings.setSensitivityMode(mode);
    setState(() => _sensitivityMode = mode);
  }

  Future<void> _removeContact(int index) async {
    final updated = List<TrustedContact>.from(_contacts)..removeAt(index);
    final settings = ref.read(settingsServiceProvider);
    await settings.setTrustedContacts(updated);
    setState(() => _contacts = updated);
  }

  Future<void> _deleteAllHistory() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete all history?'),
        content: const Text(
          'This will permanently delete all analyzed messages and reasons from this device. You cannot undo this.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            style: FilledButton.styleFrom(backgroundColor: Colors.red),
            child: const Text('Delete all'),
          ),
        ],
      ),
    );
    if (ok != true || !mounted) return;
    final repo = ref.read(messageRepositoryProvider);
    await repo.clearAll();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('History deleted')),
      );
    }
  }

  Future<void> _rerunPermissions() async {
    await [Permission.sms, Permission.phone].request();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permission check done. Restart the app if you just granted access.')),
      );
    }
  }

  Future<void> _onFontScaleChanged(double value) async {
    selectionClick();
    ref.read(fontScaleProvider.notifier).state = value;
    final settings = ref.read(settingsServiceProvider);
    await settings.setFontScale(value);
  }

  @override
  Widget build(BuildContext context) {
    final fontScale = ref.watch(fontScaleProvider);
    final padding = horizontalPadding(context);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/icon/icon.png', fit: BoxFit.contain),
        ),
        title: const Text('Settings'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: 16),
        children: [
          // Appearance (theme)
          ExpansionTile(
            leading: Icon(Icons.palette_outlined, color: theme.colorScheme.primary),
            title: Text('Appearance', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            subtitle: Text(_themeMode == 'system' ? 'System' : _themeMode == 'light' ? 'Light' : 'Dark', style: TextStyle(fontSize: 14, color: theme.colorScheme.onSurfaceVariant)),
            onExpansionChanged: (_) => lightImpact(),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: ['light', 'dark', 'system'].map((mode) {
                    final label = mode == 'system' ? 'System' : mode == 'light' ? 'Light' : 'Dark';
                    return RadioListTile<String>(
                      title: Text(label),
                      value: mode,
                      groupValue: _themeMode,
                      onChanged: (v) => v != null ? _setThemeMode(v) : null,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const Divider(height: 1),
          // Text size
          ExpansionTile(
            leading: Icon(Icons.text_fields, color: theme.colorScheme.primary),
            title: Text('Text size', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            subtitle: Text('${(fontScale.clamp(0.8, 1.5) * 100).round()}%', style: TextStyle(fontSize: 14, color: theme.colorScheme.onSurfaceVariant)),
            onExpansionChanged: (_) => lightImpact(),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Adjust to see text larger or smaller. Changes apply immediately.', style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text('A', style: TextStyle(fontSize: 14)),
                        Expanded(
                          child: Slider(
                            value: fontScale.clamp(0.8, 1.5),
                            min: 0.8,
                            max: 1.5,
                            divisions: 7,
                            label: '${(fontScale.clamp(0.8, 1.5) * 100).round()}%',
                            onChanged: (v) => _onFontScaleChanged(v),
                          ),
                        ),
                        Text('A', style: TextStyle(fontSize: 22)),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 1),
          // Legal & information
          ExpansionTile(
            leading: Icon(Icons.gavel_outlined, color: theme.colorScheme.primary),
            title: Text('Legal & information', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            onExpansionChanged: (_) => lightImpact(),
            children: [
              ListTile(
                leading: const Icon(Icons.privacy_tip_outlined),
                title: const Text('Privacy policy'),
                subtitle: const Text('How we use your data'),
                onTap: () {
                  selectionClick();
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen()));
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline),
                title: const Text('Permissions explained'),
                subtitle: const Text('Why we need each permission'),
                onTap: () {
                  selectionClick();
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PermissionsExplainedScreen()));
                },
              ),
            ],
          ),
          const Divider(height: 1),
          // Sensitivity
          ExpansionTile(
            leading: Icon(Icons.tune, color: theme.colorScheme.primary),
            title: Text('Sensitivity', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            subtitle: Text(_sensitivityMode[0].toUpperCase() + _sensitivityMode.substring(1), style: TextStyle(fontSize: 14, color: theme.colorScheme.onSurfaceVariant)),
            onExpansionChanged: (_) => lightImpact(),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Column(
                  children: ['conservative', 'balanced', 'sensitive'].map((mode) {
                    final desc = switch (mode) {
                      'conservative' => 'Fewer alerts. Only very obvious scams.',
                      'balanced' => 'Medium. Good for most people.',
                      'sensitive' => 'More alerts. Catches more but may flag some safe messages.',
                      _ => '',
                    };
                    return RadioListTile<String>(
                      title: Text(mode[0].toUpperCase() + mode.substring(1)),
                      subtitle: Text(desc, style: const TextStyle(fontSize: 13)),
                      value: mode,
                      groupValue: _sensitivityMode,
                      onChanged: (v) => v != null ? _setSensitivity(v) : null,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          const Divider(height: 1),
          // Trusted contacts
          ExpansionTile(
            leading: Icon(Icons.contacts_outlined, color: theme.colorScheme.primary),
            title: Text('Trusted contacts', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            subtitle: Text(_contacts.isEmpty ? 'None' : '${_contacts.length} contact${_contacts.length == 1 ? '' : 's'}', style: TextStyle(fontSize: 14, color: theme.colorScheme.onSurfaceVariant)),
            onExpansionChanged: (_) => lightImpact(),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'You can call them with one tap from Home or when we show a scam warning. First in the list is used for the main "Call" button.',
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                    ),
                    const SizedBox(height: 8),
                    ...List.generate(_contacts.length, (i) {
                      final c = _contacts[i];
                      return ListTile(
                        title: Text(c.name.isEmpty ? c.number : c.name),
                        subtitle: c.name.isNotEmpty ? Text(c.number) : null,
                        leading: i == 0 ? Icon(Icons.star, size: 20, color: theme.colorScheme.primary) : null,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit_outlined),
                              onPressed: () {
                                selectionClick();
                                _showEditContactDialog(i);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              onPressed: () {
                                selectionClick();
                                _removeContact(i);
                              },
                            ),
                          ],
                        ),
                        onTap: () {
                          selectionClick();
                          _showEditContactDialog(i);
                        },
                      );
                    }),
                    if (_contacts.length < 3)
                      ListTile(
                        leading: const Icon(Icons.person_add),
                        title: const Text('Add contact'),
                        onTap: () {
                          selectionClick();
                          _showAddContactDialog();
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
          const Divider(height: 1),
          // Data & permissions (bottom actions)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                OutlinedButton.icon(
                  onPressed: () {
                    mediumImpact();
                    _deleteAllHistory();
                  },
                  icon: const Icon(Icons.delete_outline),
                  label: const Text('Delete all history'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.red,
                    side: const BorderSide(color: Colors.red),
                  ),
                ),
                const SizedBox(height: 8),
                TextButton(
                  onPressed: () {
                    lightImpact();
                    _rerunPermissions();
                  },
                  child: const Text('Re-run permissions check'),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: Icon(Icons.info_outlined, color: theme.colorScheme.primary),
                  title: const Text('About Elder Shield'),
                  subtitle: Text(AboutScreen.appVersion),
                  onTap: () {
                    selectionClick();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const AboutScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showAddContactDialog() async {
    final nameController = TextEditingController();
    final numberController = TextEditingController();
    final ok = await _showContactDialog(
      title: 'Add trusted contact',
      consent: 'They can be called with one tap from Home or when we show a scam warning.',
      nameController: nameController,
      numberController: numberController,
      confirmLabel: 'Add',
    );
    if (ok != true || !mounted) return;
    final name = nameController.text.trim();
    final number = numberController.text.trim();
    if (number.isEmpty) return;
    final updated = [..._contacts, TrustedContact(name: name, number: number)];
    if (updated.length > 3) updated.removeRange(3, updated.length);
    final settings = ref.read(settingsServiceProvider);
    await settings.setTrustedContacts(updated);
    setState(() => _contacts = updated);
  }

  Future<void> _showEditContactDialog(int index) async {
    final c = _contacts[index];
    final nameController = TextEditingController(text: c.name);
    final numberController = TextEditingController(text: c.number);
    final ok = await _showContactDialog(
      title: 'Edit trusted contact',
      consent: null,
      nameController: nameController,
      numberController: numberController,
      confirmLabel: 'Save',
    );
    if (ok != true || !mounted) return;
    final name = nameController.text.trim();
    final number = numberController.text.trim();
    if (number.isEmpty) return;
    final updated = List<TrustedContact>.from(_contacts)
      ..[index] = TrustedContact(name: name, number: number);
    final settings = ref.read(settingsServiceProvider);
    await settings.setTrustedContacts(updated);
    setState(() => _contacts = updated);
  }

  Future<bool?> _showContactDialog({
    required String title,
    required String? consent,
    required TextEditingController nameController,
    required TextEditingController numberController,
    required String confirmLabel,
  }) {
    return showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (consent != null) ...[
              Text(
                consent,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(ctx).colorScheme.onSurfaceVariant,
                  height: 1.3,
                ),
              ),
              const SizedBox(height: 16),
            ],
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: 'Name',
                hintText: 'e.g. My son',
                border: OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: numberController,
              decoration: const InputDecoration(
                labelText: 'Phone number',
                hintText: 'e.g. +91 98765 43210',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
  }
}
