import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/data/message_repository.dart';

/// Full-screen warning shown when the app is opened from the "possible scam"
/// notification (app was killed). Same actions as the sheet; [onDismiss] closes
/// the screen and shows the main app.
class FullScreenWarningScreen extends ConsumerWidget {
  const FullScreenWarningScreen({
    super.key,
    required this.message,
    required this.onDismiss,
  });

  final AnalyzedMessage message;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.read(messageRepositoryProvider);
    final settings = ref.read(settingsServiceProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Elder Shield'),
        centerTitle: true,
        backgroundColor: Colors.red.shade700,
        foregroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: onDismiss,
            child: const Text('Dismiss', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.red.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.warning_amber_rounded,
                        size: 40, color: Colors.red.shade700),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Warning: Possible scam message',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'From: ${message.sender}',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                message.body.length > 200
                    ? '${message.body.substring(0, 200)}…'
                    : message.body,
                style: const TextStyle(fontSize: 16, height: 1.4),
              ),
              if (message.reasons.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  message.reasons.first,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade700,
                  ),
                ),
                if (message.reasons.length > 1) ...[
                  const SizedBox(height: 8),
                  ...message.reasons.skip(1).map((r) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('• ', style: TextStyle(fontSize: 16)),
                            Expanded(
                                child: Text(r,
                                    style: const TextStyle(fontSize: 15))),
                          ],
                        ),
                      )),
                ],
              ],
              const SizedBox(height: 24),
              _ActionButton(
                label: 'This is a Scam',
                icon: Icons.report,
                onPressed: () async {
                  await repo.saveFeedback(
                      messageId: message.id, label: 'scam');
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Marked as scam. Thank you.')),
                    );
                    onDismiss();
                  }
                },
              ),
              const SizedBox(height: 12),
              _ActionButton(
                label: 'This is Safe',
                icon: Icons.check_circle,
                onPressed: () async {
                  await repo.saveFeedback(
                      messageId: message.id, label: 'safe');
                  if (context.mounted) onDismiss();
                },
              ),
              const SizedBox(height: 12),
              FutureBuilder(
                future: settings.getTrustedContacts(),
                builder: (context, snap) {
                  final contacts = snap.data ?? [];
                  final first =
                      contacts.isNotEmpty ? contacts.first : null;
                  if (first == null) return const SizedBox.shrink();
                  return _ActionButton(
                    label:
                        'Call ${first.name.isNotEmpty ? first.name : "Trusted Contact"}',
                    icon: Icons.phone,
                    onPressed: () async {
                      final uri = Uri.parse(
                          'tel:${first.number.replaceAll(RegExp(r'\s'), '')}');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      }
                    },
                  );
                },
              ),
              const SizedBox(height: 12),
              _ActionButton(
                label: 'Delete message',
                icon: Icons.delete_outline,
                onPressed: () async {
                  await repo.deleteMessage(message.id);
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Removed from Elder Shield. Opening messaging app so you can delete it from your phone.',
                        ),
                      ),
                    );
                    onDismiss();
                    final number = message.sender
                        .replaceAll(RegExp(r'[^\d+]'), '');
                    if (number.isNotEmpty) {
                      final uri = Uri.parse('sms:$number');
                      if (await canLaunchUrl(uri)) {
                        await launchUrl(uri,
                            mode: LaunchMode.externalApplication);
                      }
                    }
                  }
                },
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () async {
                  final number = message.sender
                      .replaceAll(RegExp(r'[^\d+]'), '');
                  if (number.isEmpty) return;
                  final uri = Uri.parse('sms:$number');
                  if (await canLaunchUrl(uri)) {
                    await launchUrl(uri,
                        mode: LaunchMode.externalApplication);
                  }
                },
                child: const Text(
                    'Block this sender (opens messaging app)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label, style: const TextStyle(fontSize: 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF1565C0),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
