import 'package:flutter/material.dart';
import 'package:elder_shield/l10n/app_localizations.dart';
import 'package:elder_shield/presentation/messages/example_warning_sheet.dart';
import 'package:elder_shield/utils/haptic.dart';

/// In-app Help: "How Elder Shield works" — 3–4 short bullets.
class HowItWorksScreen extends StatelessWidget {
  const HowItWorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            selectionClick();
            Navigator.of(context).pop();
          },
        ),
        title: Text(l10n.settingsHowItWorksTitle),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 24 + padding.bottom),
        children: [
          _bullet(
            context,
            l10n.howItWorksBulletWhatWeCheck,
          ),
          const SizedBox(height: 16),
          _bullet(
            context,
            l10n.howItWorksBulletWhenWeAlert,
          ),
          const SizedBox(height: 16),
          _bullet(
            context,
            l10n.howItWorksBulletWhatToDo,
          ),
          const SizedBox(height: 16),
          _bullet(
            context,
            l10n.howItWorksBulletCallTrusted,
          ),
          const SizedBox(height: 32),
          OutlinedButton.icon(
            onPressed: () {
              selectionClick();
              showExampleWarningSheet(context);
            },
            icon: const Icon(Icons.visibility_outlined),
            label: Text(l10n.howItWorksSeeWarningCta),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _bullet(BuildContext context, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• ',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
        ),
        Expanded(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  height: 1.45,
                  fontSize: 16,
                ),
          ),
        ),
      ],
    );
  }
}
