import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/data/message_repository.dart';
import 'package:elder_shield/presentation/messages/risk_detail_sheet.dart';
import 'package:elder_shield/utils/snackbars.dart';

/// Full-height bottom sheet for real-time high-risk alert (Block 7).
/// Same actions as Risk Detail: This is a Scam / This is Safe / Call Trusted / Block sender.
void showHighRiskWarningSheet(
  BuildContext context, {
  required AnalyzedMessage message,
  required VoidCallback onDismiss,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    isDismissible: true,
    enableDrag: true,
    builder: (ctx) => _HighRiskWarningContent(
      message: message,
      onDismiss: onDismiss,
    ),
  );
}

class _HighRiskWarningContent extends ConsumerWidget {
  const _HighRiskWarningContent({
    required this.message,
    required this.onDismiss,
  });

  final AnalyzedMessage message;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.read(messageRepositoryProvider);
    final settings = ref.read(settingsServiceProvider);
     final theme = Theme.of(context);
     final errorBg = theme.colorScheme.errorContainer;
     final errorIcon = theme.colorScheme.error;
     final errorText = theme.colorScheme.onErrorContainer;

    return DraggableScrollableSheet(
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 1,
      expand: false,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.onSurfaceVariant.withValues(alpha: 0.3),
                    borderRadius: BorderRadius.circular(999),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: errorBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.warning_amber_rounded,
                      size: 40,
                      color: errorIcon,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Warning: Possible scam message',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: errorText,
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
              // Primary safety actions first: Scam, then Call Trusted Contact
              _ActionButton(
                label: 'This is a Scam',
                icon: Icons.report,
                onPressed: () async {
                  try {
                    await repo.saveFeedback(
                        messageId: message.id, label: 'scam');
                  } catch (_) {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      elderSnackBar('Something went wrong. Try again.'),
                    );
                    return;
                  }
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      elderSnackBar('Marked as scam. Thank you.'),
                    );
                    onDismiss();
                    Navigator.of(context).pop();
                  }
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
                label: 'This is Safe',
                icon: Icons.check_circle,
                onPressed: () async {
                  try {
                    await repo.saveFeedback(
                        messageId: message.id, label: 'safe');
                  } catch (_) {
                    if (!context.mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      elderSnackBar('Something went wrong. Try again.'),
                    );
                    return;
                  }
                  if (context.mounted) {
                    onDismiss();
                    Navigator.of(context).pop();
                  }
                },
              ),
              const SizedBox(height: 12),
              _ActionButton(
                label: 'Delete message',
                icon: Icons.delete_outline,
                onPressed: () => confirmDeleteMessage(
                  context,
                  message: message,
                  repo: repo,
                  onDismiss: onDismiss,
                ),
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
                  'Block this sender (opens messaging app)',
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  'Swipe up for more details',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
