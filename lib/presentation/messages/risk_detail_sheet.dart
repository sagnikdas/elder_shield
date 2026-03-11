import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/data/message_repository.dart';
import 'package:elder_shield/domain/detector/heuristic_detector.dart';
import 'package:elder_shield/utils/snackbars.dart';

/// Risk detail bottom sheet: message, reasons, actions (Scam / Safe / Call Trusted / Block).
void showRiskDetailSheet(
  BuildContext context, {
  required AnalyzedMessage message,
  required VoidCallback onDismiss,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (ctx) => _RiskDetailSheetContent(
      message: message,
      onDismiss: onDismiss,
    ),
  );
}

/// Shows "Are you sure?" confirmation for delete message; on confirm deletes it from Elder Shield only.
Future<void> confirmDeleteMessage(
  BuildContext context, {
  required AnalyzedMessage message,
  required MessageRepository repo,
  required VoidCallback onDismiss,
}) async {
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Delete message?'),
      content: const Text(
        'Are you sure? This will remove the message from Elder Shield.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(ctx).pop(false),
          child: const Text('Cancel'),
        ),
        FilledButton(
          onPressed: () => Navigator.of(ctx).pop(true),
          style: FilledButton.styleFrom(backgroundColor: Colors.red),
          child: const Text('Delete'),
        ),
      ],
    ),
  );
  if (ok != true || !context.mounted) return;
  await repo.deleteMessage(message.id);
  if (context.mounted) {
    ScaffoldMessenger.of(context).showSnackBar(
      elderSnackBar(
        'Removed from Elder Shield.',
      ),
    );
    onDismiss();
    Navigator.of(context).pop();
  }
}

class _RiskDetailSheetContent extends ConsumerWidget {
  const _RiskDetailSheetContent({
    required this.message,
    required this.onDismiss,
  });

  final AnalyzedMessage message;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.read(messageRepositoryProvider);
    final settings = ref.read(settingsServiceProvider);

    return DraggableScrollableSheet(
      initialChildSize: 0.7,
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      message.sender,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Delete message',
                    color: Colors.red,
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => confirmDeleteMessage(
                      context,
                      message: message,
                      repo: repo,
                      onDismiss: onDismiss,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                message.body,
                style: const TextStyle(fontSize: 16, height: 1.4),
              ),
              const SizedBox(height: 16),
              _RiskBandChip(band: message.band),
              if (message.reasons.isNotEmpty) ...[
                const SizedBox(height: 16),
                Text(
                  'Why this was flagged:',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 8),
                ...message.reasons.map((r) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('• ', style: TextStyle(fontSize: 16)),
                          Expanded(child: Text(r, style: const TextStyle(fontSize: 15))),
                        ],
                      ),
                    )),
              ],
              const SizedBox(height: 24),
              // Primary safety actions first: Scam, then Call Trusted Contact
              _ActionButton(
                label: 'This is a Scam',
                icon: Icons.report,
                color: Colors.red,
                onPressed: () async {
                  try {
                    await repo.saveFeedback(messageId: message.id, label: 'scam');
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
              _ActionButton(
                label: 'This is Safe',
                icon: Icons.check_circle,
                color: Colors.green,
                onPressed: () async {
                  try {
                    await repo.saveFeedback(messageId: message.id, label: 'safe');
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
            ],
          ),
        );
      },
    );
  }
}

class _RiskBandChip extends StatelessWidget {
  const _RiskBandChip({required this.band});

  final RiskBand band;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final (label, Color bg, Color fg) = switch (band) {
      RiskBand.low => (
          'Low risk',
          colorScheme.surfaceContainerHighest,
          colorScheme.onSurface,
        ),
      RiskBand.medium => (
          'Medium risk — review',
          colorScheme.tertiaryContainer,
          colorScheme.onTertiaryContainer,
        ),
      RiskBand.high => (
          'High risk — possible scam',
          colorScheme.errorContainer,
          colorScheme.onErrorContainer,
        ),
    };
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: fg,
          fontSize: 16,
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
    this.color,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;
   final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        icon: Icon(icon),
        label: Text(label, style: const TextStyle(fontSize: 16)),
        style: ElevatedButton.styleFrom(
          backgroundColor: color ?? const Color(0xFF1565C0),
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}
