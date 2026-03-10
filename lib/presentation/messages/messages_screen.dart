import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/data/message_repository.dart';
import 'package:elder_shield/domain/detector/heuristic_detector.dart';
import 'package:elder_shield/presentation/messages/risk_detail_sheet.dart';
import 'package:elder_shield/utils/haptic.dart';
import 'package:elder_shield/utils/responsive.dart';

/// Messages list with risk badges; tap opens Risk Detail sheet. All / High Risk filter.
class MessagesScreen extends ConsumerStatefulWidget {
  const MessagesScreen({super.key});

  @override
  ConsumerState<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends ConsumerState<MessagesScreen> {
  bool _highRiskOnly = false;

  Future<List<AnalyzedMessage>> _fetchMessages() async {
    final repo = ref.read(messageRepositoryProvider);
    if (_highRiskOnly) {
      return repo.fetchHighRisk(limit: 50);
    }
    return repo.fetchRecent(limit: 50);
  }

  @override
  Widget build(BuildContext context) {
    final padding = horizontalPadding(context);
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset('assets/icon/icon.png', fit: BoxFit.contain),
        ),
        title: const Text('Messages'),
        backgroundColor: theme.colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: padding, vertical: 12),
            child: Row(
              children: [
                FilterChip(
                  label: const Text('All'),
                  selected: !_highRiskOnly,
                  onSelected: (v) {
                    selectionClick();
                    setState(() => _highRiskOnly = false);
                  },
                ),
                const SizedBox(width: 12),
                FilterChip(
                  label: const Text('High Risk'),
                  selected: _highRiskOnly,
                  onSelected: (v) {
                    selectionClick();
                    setState(() => _highRiskOnly = true);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<AnalyzedMessage>>(
              future: _fetchMessages(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                final list = snapshot.data ?? [];
                if (list.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(padding * 1.5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'No messages analyzed yet. Elder Shield will check new messages automatically.',
                            style: theme.textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'When we find something suspicious, we\'ll notify you and you can open it here.',
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    lightImpact();
                    setState(() {});
                  },
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: padding * 0.5),
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final msg = list[index];
                      return _MessageTile(
                        message: msg,
                        onTap: () {
                          selectionClick();
                          showRiskDetailSheet(
                            context,
                            message: msg,
                            onDismiss: () => setState(() {}),
                          );
                        },
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _MessageTile extends StatelessWidget {
  const _MessageTile({
    required this.message,
    required this.onTap,
  });

  final AnalyzedMessage message;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final snippet = message.body.length > 60
        ? '${message.body.substring(0, 60)}…'
        : message.body;
    final date = DateTime.fromMillisecondsSinceEpoch(message.timestamp);
    final dateStr = '${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';

    final (badgeLabel, badgeColor) = switch (message.band) {
      RiskBand.low => ('LOW', Colors.grey),
      RiskBand.medium => ('MEDIUM', Colors.orange),
      RiskBand.high => ('HIGH', Colors.red),
    };

    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        title: Text(
          message.sender,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(snippet),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: badgeColor.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                badgeLabel,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: badgeColor.shade700,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              dateStr,
              style: TextStyle(
                fontSize: 12,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
