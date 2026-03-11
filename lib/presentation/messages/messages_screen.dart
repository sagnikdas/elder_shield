import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elder_shield/l10n/app_localizations.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/core/design_tokens.dart';
import 'package:elder_shield/data/message_repository.dart';
import 'package:elder_shield/domain/detector/heuristic_detector.dart';
import 'package:elder_shield/presentation/messages/risk_detail_sheet.dart';
import 'package:elder_shield/presentation/widgets/elder_shield_app_bar.dart';
import 'package:elder_shield/utils/haptic.dart';
import 'package:elder_shield/utils/responsive.dart';
import 'package:elder_shield/utils/snackbars.dart';

/// Messages list with risk badges; tap opens Risk Detail sheet. All / High Risk filter.
class MessagesScreen extends ConsumerStatefulWidget {
  const MessagesScreen({super.key});

  @override
  ConsumerState<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends ConsumerState<MessagesScreen> {
  bool _highRiskOnly = false;
  final ScrollController _scrollController = ScrollController();
  Timer? _autoRefreshTimer;

  @override
  void initState() {
    super.initState();
    _startAutoRefresh();
  }

  @override
  void dispose() {
    _autoRefreshTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _startAutoRefresh() {
    _autoRefreshTimer?.cancel();
    _autoRefreshTimer = Timer.periodic(const Duration(seconds: 30), (_) {
      if (!mounted) return;
      // Only refresh when Messages tab is currently visible.
      final currentIndex = ref.read(shellTabIndexProvider);
      if (currentIndex != 1) return;
      setState(() {});
    });
  }

  Future<List<AnalyzedMessage>> _fetchMessages() async {
    final repo = ref.read(messageRepositoryProvider);
    try {
      if (_highRiskOnly) {
        return await repo.fetchHighRisk(limit: 50);
      }
      return await repo.fetchRecent(limit: 50);
    } catch (_) {
      // Let FutureBuilder handle the error via snapshot.hasError
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final padding = horizontalPadding(context);
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: ElderShieldAppBar(titleText: l10n.messagesAppBarTitle),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: padding,
              vertical: DesignTokens.s12,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Semantics(
                    container: true,
                    button: true,
                    label: l10n.messagesFilterAllSemanticsLabel,
                    hint: l10n.messagesFilterAllSemanticsHint,
                    child: ExcludeSemantics(
                      child: _FilterSegment(
                        label: l10n.messagesFilterAll,
                        selected: !_highRiskOnly,
                        onTap: () {
                          selectionClick();
                          setState(() => _highRiskOnly = false);
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Semantics(
                    container: true,
                    button: true,
                    label: l10n.messagesFilterHighRiskSemanticsLabel,
                    hint: l10n.messagesFilterHighRiskSemanticsHint,
                    child: ExcludeSemantics(
                      child: _FilterSegment(
                        label: l10n.messagesFilterHighRisk,
                        selected: _highRiskOnly,
                        onTap: () {
                          selectionClick();
                          setState(() => _highRiskOnly = true);
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FutureBuilder<List<AnalyzedMessage>>(
              future: _fetchMessages(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(padding * 1.5),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            l10n.messagesErrorTitle,
                            style: theme.textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            l10n.messagesErrorSubtitle,
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
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListView(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    children: const [
                      SizedBox(height: 24),
                      _MessagesLoadingHeader(),
                      SizedBox(height: 16),
                      _MessageSkeletonTile(),
                      SizedBox(height: 12),
                      _MessageSkeletonTile(),
                      SizedBox(height: 12),
                      _MessageSkeletonTile(),
                    ],
                  );
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
                            l10n.messagesEmptyTitle,
                            style: theme.textTheme.bodyLarge,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            l10n.messagesEmptySubtitle,
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
                  onRefresh: () {
                    lightImpact();
                    setState(() {});
                    final disableAnims =
                        MediaQuery.of(context).disableAnimations;
                    if (disableAnims) {
                      _scrollController.jumpTo(0);
                    } else {
                      _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeOut,
                      );
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      elderSnackBar(l10n.messagesRefreshSnackbar),
                    );
                    return Future<void>.value();
                  },
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: padding * 0.5),
                    controller: _scrollController,
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

class _FilterSegment extends StatelessWidget {
  const _FilterSegment({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Material(
      color: selected
          ? colorScheme.primary
          : colorScheme.surfaceContainerHighest,
      borderRadius: BorderRadius.circular(DesignTokens.radiusMedium),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(DesignTokens.radiusMedium),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: selected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurface,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _MessagesLoadingHeader extends StatelessWidget {
  const _MessagesLoadingHeader();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        SizedBox(
          height: 22,
          width: 22,
          child: CircularProgressIndicator(
            strokeWidth: 2,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(width: DesignTokens.s12),
        Text(
          'Loading messages…',
          style: theme.textTheme.bodyMedium?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
      ],
    );
  }
}

class _MessageSkeletonTile extends StatelessWidget {
  const _MessageSkeletonTile();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final base = theme.colorScheme.surfaceContainerHighest;
    return Container(
      decoration: BoxDecoration(
        color: base,
        borderRadius: BorderRadius.circular(DesignTokens.radiusLarge),
        border: Border.all(color: theme.colorScheme.outlineVariant.withValues(alpha: 0.6)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 10,
            width: 160,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(DesignTokens.radiusSmall),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            height: 8,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(DesignTokens.radiusSmall),
            ),
          ),
          const SizedBox(height: 6),
          Container(
            height: 8,
            width: 220,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainerHigh,
              borderRadius: BorderRadius.circular(DesignTokens.radiusSmall),
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
    final now = DateTime.now();
    String formatTime(DateTime d) {
      final hour = d.hour % 12 == 0 ? 12 : d.hour % 12;
      final minute = d.minute.toString().padLeft(2, '0');
      final suffix = d.hour >= 12 ? 'PM' : 'AM';
      return '$hour:$minute $suffix';
    }

    String dateStr;
    final isSameDay = now.year == date.year &&
        now.month == date.month &&
        now.day == date.day;
    final yesterday = now.subtract(const Duration(days: 1));
    final isYesterday = yesterday.year == date.year &&
        yesterday.month == date.month &&
        yesterday.day == date.day;
    final l10n = AppLocalizations.of(context)!;
    if (isSameDay) {
      dateStr = l10n.messagesDateToday(formatTime(date));
    } else if (isYesterday) {
      dateStr = l10n.messagesDateYesterday(formatTime(date));
    } else {
      const months = [
        'Jan',
        'Feb',
        'Mar',
        'Apr',
        'May',
        'Jun',
        'Jul',
        'Aug',
        'Sep',
        'Oct',
        'Nov',
        'Dec',
      ];
      final month = months[date.month - 1];
      dateStr = l10n.messagesDateOther(month, date.day, formatTime(date));
    }

    final (badgeLabel, Color badgeBg, Color badgeText) = switch (message.band) {
      RiskBand.low => (
          l10n.riskLowLabel,
          DesignTokens.riskLow.withValues(alpha: 0.12),
          DesignTokens.riskLow,
        ),
      RiskBand.medium => (
          l10n.riskMediumLabel,
          DesignTokens.riskMedium.withValues(alpha: 0.12),
          DesignTokens.riskMedium,
        ),
      RiskBand.high => (
          l10n.riskHighLabel,
          DesignTokens.riskHigh.withValues(alpha: 0.12),
          DesignTokens.riskHigh,
        ),
    };

    final theme = Theme.of(context);
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(DesignTokens.radiusLarge),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withValues(alpha: 0.6),
        ),
      ),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        title: Text(
          message.sender,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            snippet,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ),
        trailing: FittedBox(
          fit: BoxFit.scaleDown,
          alignment: Alignment.centerRight,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: badgeBg,
                  borderRadius:
                      BorderRadius.circular(DesignTokens.radiusSmall),
                ),
                child: Text(
                  badgeLabel,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: badgeText,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Text(
                dateStr,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
