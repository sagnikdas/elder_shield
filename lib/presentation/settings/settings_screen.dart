import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elder_shield/l10n/app_localizations.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/core/navigation/app_routes.dart';
import 'package:elder_shield/core/design_tokens.dart';
import 'package:elder_shield/widgets/app_card.dart';
import 'package:elder_shield/platform/overlay_alerts.dart';
import 'package:elder_shield/presentation/settings/about_screen.dart';
import 'package:elder_shield/presentation/settings/how_it_works_screen.dart';
import 'package:elder_shield/presentation/settings/permissions_explained_screen.dart';
import 'package:elder_shield/presentation/settings/privacy_policy_screen.dart';
import 'package:elder_shield/presentation/widgets/elder_shield_app_bar.dart';
import 'package:elder_shield/features/settings/application/settings_controller.dart';
import 'package:elder_shield/features/settings/data/settings_service.dart';
import 'package:elder_shield/utils/haptic.dart';
import 'package:elder_shield/utils/responsive.dart';
import 'package:elder_shield/utils/snackbars.dart';
import 'package:elder_shield/widgets/contact_picker_sheet.dart';

/// Display name for English in the language list; never translated.
const _languageDisplayNameEnglish = 'English';

/// Settings: collapsible sections (Appearance, Text size, Legal, Sensitivity, Trusted contacts), theme, haptics.
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _overlayEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadOverlayFlag();
  }

  Future<void> _loadOverlayFlag() async {
    final overlayEnabled = await canDrawOverlays();
    if (!mounted) return;
    setState(() => _overlayEnabled = overlayEnabled);
  }

  Future<void> _setThemeMode(String mode) async {
    selectionClick();
    await ref.read(settingsControllerProvider.notifier).setThemeMode(mode);
    ref.read(themeModeProvider.notifier).state = mode;
  }

  Future<void> _setSensitivity(SensitivityMode mode) async {
    selectionClick();
    await ref.read(settingsControllerProvider.notifier).setSensitivity(mode);
  }

  Future<void> _setLanguage(String code) async {
    selectionClick();
    await ref.read(settingsControllerProvider.notifier).setLanguageCode(code);
  }

  Future<void> _removeContact(int index) async {
    final state = ref.read(settingsControllerProvider).valueOrNull;
    if (state == null) return;
    final updated = List<TrustedContact>.from(state.contacts)..removeAt(index);
    await ref
        .read(settingsControllerProvider.notifier)
        .updateContacts(updated);
  }

  Future<void> _removeWhitelistedSender(String sender) async {
    await ref
        .read(settingsControllerProvider.notifier)
        .removeFromWhitelist(sender);
  }

  Future<void> _deleteAllHistory() async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) {
        final l10n = AppLocalizations.of(ctx)!;
        return AlertDialog(
          title: Text(l10n.settingsDeleteAllHistoryDialogTitle),
          content: Text(
            l10n.settingsDeleteAllHistoryDialogBody,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(false),
              child: Text(l10n.commonCancel),
            ),
            FilledButton(
              onPressed: () => Navigator.of(ctx).pop(true),
              style: FilledButton.styleFrom(backgroundColor: Colors.red),
              child: Text(l10n.settingsDeleteAllHistoryDialogConfirm),
            ),
          ],
        );
      },
    );
    if (ok != true || !mounted) return;
    final repo = ref.read(messageRepositoryProvider);
    try {
      await repo.clearAll();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          elderSnackBar(AppLocalizations.of(context)!.settingsHistoryDeletedSnackbar),
        );
      }
    } catch (_) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        elderSnackBar(AppLocalizations.of(context)!.snackbarGenericError),
      );
    }
  }

  Future<void> _rerunPermissions() async {
    await [Permission.sms, Permission.phone].request();
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        elderSnackBar(AppLocalizations.of(context)!.settingsRerunPermissionsSnackbar),
      );
    }
  }

  Future<void> _onFontScaleChanged(double value) async {
    selectionClick();
    ref.read(fontScaleProvider.notifier).state = value;
    final settings = ref.read(settingsServiceProvider);
    await settings.setFontScale(value);
  }

  Future<void> _openOverlayPermissionSettings() async {
    selectionClick();
    await openOverlayPermissionSettings();
    await Future<void>.delayed(const Duration(milliseconds: 400));
    if (!mounted) return;
    final enabled = await canDrawOverlays();
    if (!mounted) return;
    setState(() => _overlayEnabled = enabled);
    ScaffoldMessenger.of(context).showSnackBar(
      elderSnackBar(
        enabled
            ? AppLocalizations.of(context)!.settingsOverlaySubtitleEnabled
            : AppLocalizations.of(context)!.settingsOverlaySubtitleDisabled,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fontScale = ref.watch(fontScaleProvider);
    final settingsAsync = ref.watch(settingsControllerProvider);
    final state = settingsAsync.value;
    final padding = horizontalPadding(context);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    if (state == null) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final _themeMode = state.themeMode;
    final _sensitivityMode = state.sensitivityMode;
    final _contacts = state.contacts;
    final _languageCode = state.languageCode;
    final _whitelistedSenders = state.whitelistedSenders;

    return Scaffold(
      appBar: ElderShieldAppBar(titleText: l10n.settingsTitle),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: padding, vertical: DesignTokens.s16),
        children: [
          // Appearance (theme)
          AppCard(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              leading: Icon(Icons.palette_outlined, color: theme.colorScheme.primary, size: 24),
              title: Text(l10n.settingsAppearanceTitle, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
              subtitle: Text(
                _themeMode == 'system'
                    ? l10n.settingsThemeSystem
                    : _themeMode == 'light'
                        ? l10n.settingsThemeLight
                        : l10n.settingsThemeDark,
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
              onExpansionChanged: (_) => lightImpact(),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: ['light', 'dark', 'system'].map((mode) {
                      final label = switch (mode) {
                        'system' => l10n.settingsThemeSystem,
                        'light' => l10n.settingsThemeLight,
                        'dark' => l10n.settingsThemeDark,
                        _ => mode,
                      };
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
          ),
          // Language
          AppCard(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              leading: Icon(Icons.language_rounded, color: theme.colorScheme.primary, size: 24),
              title: Text(
                l10n.languageSectionTitle,
                style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                l10n.languageSectionSubtitle(
                  switch (_languageCode) {
                    'bn' => l10n.languageBengaliName,
                    'kn' => l10n.languageKannadaName,
                    'hi' => l10n.languageHindiName,
                    'ur' => l10n.languageUrduName,
                    'as' => l10n.languageAssameseName,
                    'ta' => l10n.languageTamilName,
                    'ml' => l10n.languageMalayalamName,
                    'te' => l10n.languageTeluguName,
                    _ => _languageDisplayNameEnglish,
                  },
                ),
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
              onExpansionChanged: (_) => lightImpact(),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RadioListTile<String>(
                        title: const Text(_languageDisplayNameEnglish),
                        value: 'en',
                        groupValue: _languageCode,
                        onChanged: (v) => v != null ? _setLanguage(v) : null,
                      ),
                      RadioListTile<String>(
                        title: Text(l10n.languageBengaliName),
                        value: 'bn',
                        groupValue: _languageCode,
                        onChanged: (v) => v != null ? _setLanguage(v) : null,
                      ),
                      RadioListTile<String>(
                        title: Text(l10n.languageKannadaName),
                        value: 'kn',
                        groupValue: _languageCode,
                        onChanged: (v) => v != null ? _setLanguage(v) : null,
                      ),
                      RadioListTile<String>(
                        title: Text(l10n.languageHindiName),
                        value: 'hi',
                        groupValue: _languageCode,
                        onChanged: (v) => v != null ? _setLanguage(v) : null,
                      ),
                      RadioListTile<String>(
                        title: Text(l10n.languageUrduName),
                        value: 'ur',
                        groupValue: _languageCode,
                        onChanged: (v) => v != null ? _setLanguage(v) : null,
                      ),
                      RadioListTile<String>(
                        title: Text(l10n.languageAssameseName),
                        value: 'as',
                        groupValue: _languageCode,
                        onChanged: (v) => v != null ? _setLanguage(v) : null,
                      ),
                      RadioListTile<String>(
                        title: Text(l10n.languageTamilName),
                        value: 'ta',
                        groupValue: _languageCode,
                        onChanged: (v) => v != null ? _setLanguage(v) : null,
                      ),
                      RadioListTile<String>(
                        title: Text(l10n.languageMalayalamName),
                        value: 'ml',
                        groupValue: _languageCode,
                        onChanged: (v) => v != null ? _setLanguage(v) : null,
                      ),
                      RadioListTile<String>(
                        title: Text(l10n.languageTeluguName),
                        value: 'te',
                        groupValue: _languageCode,
                        onChanged: (v) => v != null ? _setLanguage(v) : null,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Text size
          AppCard(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              leading: Icon(Icons.text_fields_rounded, color: theme.colorScheme.primary, size: 24),
              title: Text(l10n.settingsTextSizeTitle, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
              subtitle: Text(
                '${(fontScale.clamp(0.8, 1.5) * 100).round()}%',
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
              onExpansionChanged: (_) => lightImpact(),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.settingsTextSizeDescription,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.settingsTextSizeSample,
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Text('A', style: theme.textTheme.bodyMedium),
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
                          Text('A', style: theme.textTheme.titleMedium),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Legal & information
          AppCard(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              leading: Icon(Icons.gavel_rounded, color: theme.colorScheme.primary, size: 24),
              title: Text(l10n.settingsLegalTitle, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
              onExpansionChanged: (_) => lightImpact(),
              children: [
                ListTile(
                  leading: const Icon(Icons.privacy_tip_outlined),
                  title: Text(l10n.settingsPrivacyPolicyTitle),
                  subtitle: Text(l10n.settingsPrivacyPolicySubtitle),
                  trailing: const Icon(Icons.chevron_right_rounded, size: 22),
                  onTap: () {
                    selectionClick();
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen()));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline_rounded),
                  title: Text(l10n.settingsPermissionsExplainedTitle),
                  subtitle: Text(l10n.settingsPermissionsExplainedSubtitle),
                  trailing: const Icon(Icons.chevron_right_rounded, size: 22),
                  onTap: () {
                    selectionClick();
                    Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PermissionsExplainedScreen()));
                  },
                ),
              ],
            ),
          ),
          // Sensitivity
          AppCard(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              leading: Icon(Icons.tune_rounded, color: theme.colorScheme.primary, size: 24),
              title: Text(l10n.settingsSensitivityTitle, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
              subtitle: Text(
                switch (_sensitivityMode) {
                  SensitivityMode.conservative => l10n.settingsSensitivityLabelConservative,
                  SensitivityMode.balanced => l10n.settingsSensitivityLabelBalanced,
                  SensitivityMode.sensitive => l10n.settingsSensitivityLabelSensitive,
                },
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
              onExpansionChanged: (_) => lightImpact(),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Column(
                    children: SensitivityMode.values.map((mode) {
                      final desc = switch (mode) {
                        SensitivityMode.conservative => l10n.settingsSensitivityDescConservative,
                        SensitivityMode.balanced => l10n.settingsSensitivityDescBalanced,
                        SensitivityMode.sensitive => l10n.settingsSensitivityDescSensitive,
                      };
                      final label = switch (mode) {
                        SensitivityMode.conservative => l10n.settingsSensitivityLabelConservative,
                        SensitivityMode.balanced => l10n.settingsSensitivityLabelBalanced,
                        SensitivityMode.sensitive => l10n.settingsSensitivityLabelSensitive,
                      };
                      return RadioListTile<SensitivityMode>(
                        title: Text(label),
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
          ),
          // Trusted contacts
          AppCard(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              leading: Icon(Icons.contacts_outlined, color: theme.colorScheme.primary, size: 24),
              title: Text(l10n.settingsTrustedContactsTitle, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
              subtitle: Text(
                _contacts.isEmpty
                    ? l10n.settingsTrustedContactsNone
                    : l10n.settingsTrustedContactsCount(_contacts.length),
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
              onExpansionChanged: (_) => lightImpact(),
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.settingsTrustedContactsExplanation,
                      style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                    ),
                    const SizedBox(height: 8),
                    ...List.generate(_contacts.length, (i) {
                      final c = _contacts[i];
                      return ListTile(
                        title: Text(c.name.isEmpty ? c.number : c.name),
                        subtitle: c.name.isNotEmpty ? Text(c.number) : null,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit_outlined),
                              constraints: const BoxConstraints(
                                minWidth: DesignTokens.minTouchTarget,
                                minHeight: DesignTokens.minTouchTarget,
                              ),
                              onPressed: () {
                                selectionClick();
                                _showEditContactDialog(i);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.remove_circle_outline),
                              constraints: const BoxConstraints(
                                minWidth: DesignTokens.minTouchTarget,
                                minHeight: DesignTokens.minTouchTarget,
                              ),
                              onPressed: () async {
                                selectionClick();
                                final ok = await showDialog<bool>(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text(l10n.settingsTrustedContactsRemoveDialogTitle),
                                    content: Text(
                                      l10n.settingsTrustedContactsRemoveDialogBody,
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.of(ctx).pop(false),
                                        child: Text(l10n.commonCancel),
                                      ),
                                      FilledButton(
                                        onPressed: () => Navigator.of(ctx).pop(true),
                                        child: Text(l10n.settingsTrustedContactsRemoveDialogRemove),
                                      ),
                                    ],
                                  ),
                                );
                                if (ok == true) {
                                  _removeContact(i);
                                }
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
                        title: Text(l10n.settingsTrustedContactsAddContactTitle),
                        subtitle: Text(l10n.settingsTrustedContactsAddContactSubtitle),
                        onTap: () {
                          selectionClick();
                          _showAddContactDialog();
                        },
                      ),
                    if (_contacts.length < 3)
                      ListTile(
                        leading: const Icon(Icons.contact_phone_outlined),
                        title: Text(l10n.settingsTrustedContactsChooseFromContactsTitle),
                        subtitle: Text(l10n.settingsTrustedContactsChooseFromContactsSubtitle),
                        onTap: () {
                          selectionClick();
                          _pickContactAndAdd();
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
          ), // Trusted contacts Card
          // Trusted Senders (whitelist)
          AppCard(
            margin: const EdgeInsets.only(bottom: 12),
            child: ExpansionTile(
              leading: Icon(Icons.verified_user_outlined, color: theme.colorScheme.primary, size: 24),
              title: Text(l10n.settingsTrustedSendersTitle, style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
              subtitle: Text(
                _whitelistedSenders.isEmpty
                    ? l10n.settingsTrustedSendersNone
                    : l10n.settingsTrustedSendersCount(_whitelistedSenders.length),
                style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
              ),
              onExpansionChanged: (_) => lightImpact(),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
                        child: Text(
                          l10n.settingsTrustedSendersExplanation,
                          style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                        ),
                      ),
                      if (_whitelistedSenders.isEmpty)
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                          child: Text(
                            l10n.settingsTrustedSendersNone,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ..._whitelistedSenders.map((sender) {
                        // Show a friendlier label: phone numbers stay as-is,
                        // alphanumeric IDs are shown in uppercase.
                        final displaySender = RegExp(r'^\+?\d{6,}$').hasMatch(sender)
                            ? sender
                            : sender.toUpperCase();
                        return ListTile(
                          leading: const Icon(Icons.verified_user_outlined),
                          title: Text(displaySender),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            constraints: const BoxConstraints(
                              minWidth: DesignTokens.minTouchTarget,
                              minHeight: DesignTokens.minTouchTarget,
                            ),
                            onPressed: () async {
                              selectionClick();
                              final ok = await showDialog<bool>(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: Text(l10n.settingsTrustedSendersRemoveDialogTitle),
                                  content: Text(l10n.settingsTrustedSendersRemoveDialogBody),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.of(ctx).pop(false),
                                      child: Text(l10n.commonCancel),
                                    ),
                                    FilledButton(
                                      onPressed: () => Navigator.of(ctx).pop(true),
                                      child: Text(l10n.settingsTrustedSendersRemoveDialogRemove),
                                    ),
                                  ],
                                ),
                              );
                              if (ok == true) {
                                unawaited(_removeWhitelistedSender(sender));
                              }
                            },
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Advanced & info
          AppCard(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                    child: Text(
                      l10n.settingsAdvancedSectionTitle,
                      style: theme.textTheme.labelLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      mediumImpact();
                      _deleteAllHistory();
                    },
                    icon: const Icon(Icons.delete_outline_rounded, size: 22),
                    label: Text(l10n.settingsDeleteAllHistoryButton),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      lightImpact();
                      _rerunPermissions();
                    },
                    child: Text(l10n.settingsRerunPermissionsButton),
                  ),
                  const Divider(height: 1),
                  ListTile(
                  leading: Icon(Icons.open_in_new_rounded, color: theme.colorScheme.primary, size: 24),
                  title: Text(l10n.settingsOverlayTitle),
                  subtitle: Text(
                    _overlayEnabled
                        ? l10n.settingsOverlaySubtitleEnabled
                        : l10n.settingsOverlaySubtitleDisabled,
                  ),
                  trailing: const Icon(Icons.chevron_right_rounded, size: 22),
                  onTap: _openOverlayPermissionSettings,
                ),
                // Guardian Plan section
                Consumer(
                  builder: (context, ref, _) {
                    final isPremiumAsync = ref.watch(isPremiumProvider);
                    final isPremium = isPremiumAsync.valueOrNull ?? false;
                    return ListTile(
                      leading: Icon(
                        isPremium
                            ? Icons.shield_rounded
                            : Icons.shield_outlined,
                        color: isPremium
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurfaceVariant,
                        size: 24,
                      ),
                      title: Text(l10n.guardianPlanTitle),
                      subtitle: Text(
                        isPremium
                            ? l10n.guardianPlanActiveSubtitle
                            : l10n.guardianPlanUpgradeSubtitle,
                      ),
                      trailing: isPremium
                          ? Chip(
                              label: Text(
                                l10n.guardianPlanActiveBadge,
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: theme.colorScheme.onPrimary,
                                ),
                              ),
                              backgroundColor: theme.colorScheme.primary,
                              padding: EdgeInsets.zero,
                            )
                          : const Icon(Icons.chevron_right_rounded, size: 22),
                      onTap: isPremium
                          ? null
                          : () {
                              selectionClick();
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.guardianPaywall);
                            },
                    );
                  },
                ),
                const Divider(height: 1),
                ListTile(
                  leading: Icon(Icons.help_outline_rounded, color: theme.colorScheme.primary, size: 24),
                  title: Text(l10n.settingsHowItWorksTitle),
                  subtitle: Text(l10n.settingsHowItWorksSubtitle),
                  trailing: const Icon(Icons.chevron_right_rounded, size: 22),
                  onTap: () {
                    selectionClick();
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const HowItWorksScreen()),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info_outline_rounded, color: theme.colorScheme.primary, size: 24),
                  title: Text(l10n.settingsAboutTitle),
                  subtitle: Text(AboutScreen.appVersion),
                  trailing: const Icon(Icons.chevron_right_rounded, size: 22),
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
          ),
        ],
      ),
    );
  }

  Future<void> _showAddContactDialog() async {
    final state = ref.read(settingsControllerProvider).valueOrNull;
    if (state == null) return;
    final nameController = TextEditingController();
    final numberController = TextEditingController();
    final ok = await _showContactDialog(
      title: AppLocalizations.of(context)!.settingsAddTrustedDialogTitle,
      consent: AppLocalizations.of(context)!.settingsAddTrustedDialogConsent,
      nameController: nameController,
      numberController: numberController,
      confirmLabel: AppLocalizations.of(context)!.settingsAddTrustedDialogConfirm,
    );
    if (ok != true || !mounted) return;
    final name = nameController.text.trim();
    final number = numberController.text.trim();
    if (number.isEmpty) return;
    final updated = [...state.contacts, TrustedContact(name: name, number: number)];
    if (updated.length > 3) updated.removeRange(3, updated.length);
    await ref
        .read(settingsControllerProvider.notifier)
        .updateContacts(updated);
  }

  Future<void> _showEditContactDialog(int index) async {
    final state = ref.read(settingsControllerProvider).valueOrNull;
    if (state == null) return;
    final c = state.contacts[index];
    final nameController = TextEditingController(text: c.name);
    final numberController = TextEditingController(text: c.number);
    final ok = await _showContactDialog(
      title: AppLocalizations.of(context)!.settingsEditTrustedDialogTitle,
      consent: null,
      nameController: nameController,
      numberController: numberController,
      confirmLabel: AppLocalizations.of(context)!.settingsEditTrustedDialogConfirm,
    );
    if (ok != true || !mounted) return;
    final name = nameController.text.trim();
    final number = numberController.text.trim();
    if (number.isEmpty) return;
    final updated = List<TrustedContact>.from(state.contacts)
      ..[index] = TrustedContact(name: name, number: number);
    await ref
        .read(settingsControllerProvider.notifier)
        .updateContacts(updated);
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
              decoration: InputDecoration(
                labelText: AppLocalizations.of(ctx)!.settingsContactNameLabel,
                hintText: AppLocalizations.of(ctx)!.settingsContactNameHint,
                border: const OutlineInputBorder(),
              ),
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: numberController,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(ctx)!.settingsContactNumberLabel,
                hintText: AppLocalizations.of(ctx)!.settingsContactNumberHint,
                border: const OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(AppLocalizations.of(ctx)!.settingsContactDialogCancel),
          ),
          FilledButton(
            onPressed: () {
              final raw = numberController.text.trim();
              // Allow spaces, dashes, brackets etc. by validating only cleaned digits / leading plus.
              final cleaned = raw.replaceAll(RegExp(r'[^\d+]'), '');
              final isValid = RegExp(r'^\+?\d{6,15}$').hasMatch(cleaned);
              if (!isValid) {
                ScaffoldMessenger.of(context).showSnackBar(
                  elderSnackBar(AppLocalizations.of(context)!.settingsContactInvalidNumber),
                );
                return;
              }
              Navigator.of(ctx).pop(true);
            },
            child: Text(confirmLabel),
          ),
        ],
      ),
    );
  }

  Future<void> _pickContactAndAdd() async {
    final l10n = AppLocalizations.of(context)!;
    final state = ref.read(settingsControllerProvider).valueOrNull;
    if (state == null) return;

    // Request contacts permission before opening the picker.
    final status = await Permission.contacts.request();
    if (!status.isGranted) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        elderSnackBar(l10n.snackbarGenericError),
      );
      return;
    }

    final contacts = await FlutterContacts.getAll(
      properties: {ContactProperty.phone, ContactProperty.name},
    );
    if (!mounted) return;

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
      isScrollControlled: true,
      builder: (_) => ContactPickerSheet(contacts: contactsWithPhones),
    );
    if (contact == null) return;

    final number = contact.phones.first.number;
    final displayName = contact.displayName ?? '';

    final updated = [
      ...state.contacts,
      TrustedContact(name: displayName, number: number),
    ];
    if (updated.length > 3) {
      updated.removeRange(3, updated.length);
    }
    await ref
        .read(settingsControllerProvider.notifier)
        .updateContacts(updated);
  }
}
