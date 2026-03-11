import 'package:flutter/material.dart';
import 'package:elder_shield/l10n/app_localizations.dart';
import 'package:elder_shield/presentation/settings/how_it_works_screen.dart';
import 'package:elder_shield/presentation/settings/permissions_explained_screen.dart';
import 'package:elder_shield/presentation/settings/privacy_policy_screen.dart';
import 'package:elder_shield/utils/haptic.dart';

/// Block 11 — About screen: app name, icon, version, tagline; links to Privacy policy & Permissions explained.
class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const String appVersion = '1.0.0';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/icon/icon.png', fit: BoxFit.contain),
        ),
        title: Text(l10n.settingsAboutTitle),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          const SizedBox(height: 16),
          Center(
            child: Column(
              children: [
                Image.asset('assets/icon/icon.png', width: 80, height: 80, fit: BoxFit.contain),
                const SizedBox(height: 16),
                Text(
                  l10n.appTitle,
                  style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  'Version $appVersion',
                  style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                ),
                const SizedBox(height: 12),
                Text(
                  l10n.aboutTagline,
                  style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          ListTile(
            leading: const Icon(Icons.privacy_tip_outlined),
            title: Text(l10n.settingsPrivacyPolicyTitle),
            subtitle: Text(l10n.settingsPrivacyPolicySubtitle),
            onTap: () {
              selectionClick();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: Text(l10n.settingsPermissionsExplainedTitle),
            subtitle: Text(l10n.settingsPermissionsExplainedSubtitle),
            onTap: () {
              selectionClick();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const PermissionsExplainedScreen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.help_outline),
            title: Text(l10n.settingsHowItWorksTitle),
            subtitle: Text(l10n.settingsHowItWorksSubtitle),
            onTap: () {
              selectionClick();
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const HowItWorksScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
