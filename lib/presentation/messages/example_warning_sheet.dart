import 'package:flutter/material.dart';
import 'package:elder_shield/data/message_repository.dart';
import 'package:elder_shield/domain/detector/heuristic_detector.dart';

/// Demo message for "See what a warning looks like" — not saved to repo.
AnalyzedMessage get _demoMessage => AnalyzedMessage(
      id: -1,
      sender: 'Unknown',
      body:
          'Your bank account will be blocked within 24 hours. Click here to verify: http://secure-bank-verify.com. Do not share this with anyone.',
      timestamp: 0,
      score: 0.9,
      band: RiskBand.high,
      reasons: [
        'Contains a suspicious link',
        'Pretends to be your bank',
        'Uses urgent or threatening language',
      ],
      feedbackLabel: null,
    );

/// Shows a sample high-risk warning sheet (demo only). No data is saved.
void showExampleWarningSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    isDismissible: true,
    enableDrag: true,
    builder: (ctx) => _ExampleWarningContent(message: _demoMessage),
  );
}

class _ExampleWarningContent extends StatelessWidget {
  const _ExampleWarningContent({required this.message});

  final AnalyzedMessage message;

  @override
  Widget build(BuildContext context) {
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
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.amber.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(Icons.info_outline, size: 28, color: Colors.amber.shade800),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'This is an example. No real message or action.',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
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
              const SizedBox(height: 28),
              SizedBox(
                height: 56,
                child: FilledButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('This was an example. No action was taken.'),
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  },
                  child: const Text('Got it — this was an example',
                      style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
