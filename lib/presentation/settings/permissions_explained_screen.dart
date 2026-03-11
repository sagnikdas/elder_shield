import 'package:flutter/material.dart';
import 'package:elder_shield/l10n/app_localizations.dart';

/// Block 10 — Short in-app summary of why we need each permission.
/// Matches [docs/permission_disclosures.md].
class PermissionsExplainedScreen extends StatelessWidget {
  const PermissionsExplainedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/icon/icon.png', fit: BoxFit.contain),
        ),
        title: Text(l10n.settingsPermissionsExplainedTitle),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(
            l10n.permissionsIntro,
            style: TextStyle(
              fontSize: 15,
              height: 1.4,
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
          const SizedBox(height: 24),
          _permissionCard(
            context,
            l10n.permissionsSmsTitle,
            l10n.permissionsSmsBody,
          ),
          _permissionCard(
            context,
            l10n.permissionsPhoneStateTitle,
            l10n.permissionsPhoneStateBody,
          ),
          _permissionCard(
            context,
            l10n.permissionsPhoneCallTitle,
            l10n.permissionsPhoneCallBody,
          ),
          _permissionCard(
            context,
            l10n.permissionsNotificationsTitle,
            l10n.permissionsNotificationsBody,
          ),
          _permissionCard(
            context,
            l10n.permissionsOverlayTitle,
            l10n.permissionsOverlayBody,
          ),
        ],
      ),
    );
  }

  Widget _permissionCard(
    BuildContext context,
    String title,
    String body,
  ) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              body,
              style: TextStyle(
                fontSize: 14,
                height: 1.4,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
