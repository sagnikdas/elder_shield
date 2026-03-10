import 'package:flutter/material.dart';
import 'package:elder_shield/presentation/messages/example_warning_sheet.dart';
import 'package:elder_shield/utils/haptic.dart';

/// In-app Help: "How Elder Shield works" — 3–4 short bullets.
class HowItWorksScreen extends StatelessWidget {
  const HowItWorksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final padding = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            selectionClick();
            Navigator.of(context).pop();
          },
        ),
        title: const Text('How Elder Shield works'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(24, 24, 24, 24 + padding.bottom),
        children: [
          _bullet(
            context,
            'What we check: We read your SMS and look for signs of scams — suspicious links, urgent language, requests for OTP or bank details, and messages that pretend to be your bank or a known service.',
          ),
          const SizedBox(height: 16),
          _bullet(
            context,
            'When we alert: If a message looks risky, we notify you. For high-risk messages we can show a pop-up even when the app is in the background, and list the message on the Messages tab.',
          ),
          const SizedBox(height: 16),
          _bullet(
            context,
            'What to do when you see a warning: Don’t tap any link in the message. You can mark it as "This is a Scam" or "This is Safe" to help us learn. Best step: call your trusted contact from the warning screen or from Home.',
          ),
          const SizedBox(height: 16),
          _bullet(
            context,
            'How to call your trusted contact: On the Home screen, tap the big "Call [Name]" button anytime — especially if you get a worrying message. You can also call from the warning screen when we show a possible scam.',
          ),
          const SizedBox(height: 32),
          OutlinedButton.icon(
            onPressed: () {
              selectionClick();
              showExampleWarningSheet(context);
            },
            icon: const Icon(Icons.visibility_outlined),
            label: const Text('See what a warning looks like'),
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
