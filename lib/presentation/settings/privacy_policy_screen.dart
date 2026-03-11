import 'package:flutter/material.dart';
import 'package:elder_shield/l10n/app_localizations.dart';

/// Block 10 — In-app Privacy Policy. Content matches [docs/privacy_policy_draft.md].
/// Update before publishing (e.g. contact placeholder).
class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/icon/icon.png', fit: BoxFit.contain),
        ),
        title: Text(l10n.privacyTitle),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          _section(context, l10n.privacySection1Title, [l10n.privacySection1Body]),
          _section(context, l10n.privacySection2Title, [l10n.privacySection2Paragraphs]),
          _section(context, l10n.privacySection3Title, [l10n.privacySection3Paragraphs]),
          _section(context, l10n.privacySection4Title, [l10n.privacySection4Paragraphs]),
          _section(context, l10n.privacySection5Title, [l10n.privacySection5Paragraphs]),
          _section(context, l10n.privacySection6Title, [l10n.privacySection6Paragraphs]),
          _section(context, l10n.privacySection7Title, [l10n.privacySection7Paragraphs]),
          _section(context, l10n.privacySection8Title, [l10n.privacySection8Body]),
          const SizedBox(height: 24),
          Text(
            l10n.privacyLastUpdatedNote,
            style: TextStyle(
              fontSize: 12,
              fontStyle: FontStyle.italic,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _section(BuildContext context, String title, List<String> paragraphs) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 8),
          ...paragraphs.map(
            (p) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                p,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.4,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
