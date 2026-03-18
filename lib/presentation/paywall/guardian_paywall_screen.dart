import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/core/design_tokens.dart';
import 'package:elder_shield/l10n/app_localizations.dart';
import 'package:elder_shield/presentation/widgets/elder_shield_app_bar.dart';
import 'package:elder_shield/services/subscription_service.dart';
import 'package:elder_shield/utils/haptic.dart';
import 'package:elder_shield/widgets/app_card.dart';

/// Paywall screen for the Guardian Plan subscription.
///
/// Shows subscription benefits, pricing options (monthly/yearly),
/// and a restore-purchase button. Can be dismissed with "Maybe later".
class GuardianPaywallScreen extends ConsumerStatefulWidget {
  const GuardianPaywallScreen({super.key});

  @override
  ConsumerState<GuardianPaywallScreen> createState() =>
      _GuardianPaywallScreenState();
}

class _GuardianPaywallScreenState extends ConsumerState<GuardianPaywallScreen> {
  List<ProductDetails> _products = [];
  bool _loading = true;
  bool _purchasing = false;

  @override
  void initState() {
    super.initState();
    _loadProducts();
  }

  Future<void> _loadProducts() async {
    final service = ref.read(subscriptionServiceProvider);
    final products = await service.getProducts();
    if (mounted) {
      setState(() {
        _products = products;
        _loading = false;
      });
    }
  }

  ProductDetails? get _monthlyProduct {
    return _products
        .where((p) => p.id == SubscriptionService.monthlyPlanId)
        .firstOrNull;
  }

  ProductDetails? get _yearlyProduct {
    return _products
        .where((p) => p.id == SubscriptionService.yearlyPlanId)
        .firstOrNull;
  }

  Future<void> _purchaseMonthly() async {
    if (_purchasing) return;
    setState(() => _purchasing = true);
    mediumImpact();
    final service = ref.read(subscriptionServiceProvider);
    await service.purchaseMonthly();
    if (mounted) setState(() => _purchasing = false);
  }

  Future<void> _purchaseYearly() async {
    if (_purchasing) return;
    setState(() => _purchasing = true);
    mediumImpact();
    final service = ref.read(subscriptionServiceProvider);
    await service.purchaseYearly();
    if (mounted) setState(() => _purchasing = false);
  }

  Future<void> _restorePurchases() async {
    lightImpact();
    final service = ref.read(subscriptionServiceProvider);
    await service.restorePurchases();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    // If user becomes premium while on this screen, pop back.
    ref.listen<AsyncValue<bool>>(isPremiumProvider, (prev, next) {
      final wasPremium = prev?.valueOrNull ?? false;
      final nowPremium = next.valueOrNull ?? false;
      if (!wasPremium && nowPremium && mounted) {
        Navigator.of(context).pop(true);
      }
    });

    return Scaffold(
      appBar: ElderShieldAppBar(titleText: l10n.guardianPlanTitle),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(DesignTokens.s24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              Icon(
                Icons.shield_rounded,
                size: 64,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(height: DesignTokens.s16),
              Text(
                l10n.guardianPlanTitle,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme.colorScheme.onSurface,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: DesignTokens.s8),
              Text(
                l10n.guardianPlanSubtitle,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: DesignTokens.s32),

              // Benefits
              AppCard(
                padding: const EdgeInsets.all(DesignTokens.s16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.guardianPlanWhatYouGet,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: DesignTokens.s12),
                    _BenefitRow(
                      icon: Icons.chat_bubble_outline_rounded,
                      text: l10n.guardianPlanBenefitAlerts,
                    ),
                    const SizedBox(height: DesignTokens.s8),
                    _BenefitRow(
                      icon: Icons.favorite_outline_rounded,
                      text: l10n.guardianPlanBenefitHeartbeat,
                    ),
                    const SizedBox(height: DesignTokens.s8),
                    _BenefitRow(
                      icon: Icons.summarize_outlined,
                      text: l10n.guardianPlanBenefitSummary,
                    ),
                    const SizedBox(height: DesignTokens.s8),
                    _BenefitRow(
                      icon: Icons.family_restroom_rounded,
                      text: l10n.guardianPlanBenefitFamily,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: DesignTokens.s24),

              // Pricing buttons
              if (_loading)
                const Center(child: CircularProgressIndicator())
              else ...[
                // Monthly button
                _PricingButton(
                  label: _monthlyProduct != null
                      ? l10n.guardianPlanMonthlyPrice(_monthlyProduct!.price)
                      : l10n.guardianPlanMonthlyFallback,
                  onPressed: _purchasing ? null : _purchaseMonthly,
                  isPrimary: false,
                ),
                const SizedBox(height: DesignTokens.s12),
                // Yearly button (primary — better deal)
                _PricingButton(
                  label: _yearlyProduct != null
                      ? l10n.guardianPlanYearlyPrice(_yearlyProduct!.price)
                      : l10n.guardianPlanYearlyFallback,
                  badge: l10n.guardianPlanYearlySaveBadge,
                  onPressed: _purchasing ? null : _purchaseYearly,
                  isPrimary: true,
                ),
              ],

              if (_purchasing) ...[
                const SizedBox(height: DesignTokens.s16),
                const Center(child: CircularProgressIndicator()),
              ],

              const SizedBox(height: DesignTokens.s24),

              // Restore purchases
              Center(
                child: TextButton(
                  onPressed: _restorePurchases,
                  child: Text(l10n.guardianPlanRestore),
                ),
              ),

              const SizedBox(height: DesignTokens.s8),

              // Maybe later
              Center(
                child: TextButton(
                  onPressed: () {
                    lightImpact();
                    Navigator.of(context).pop(false);
                  },
                  child: Text(
                    l10n.guardianPlanMaybeLater,
                    style: TextStyle(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: DesignTokens.s16),

              // Legal links
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      l10n.guardianPlanTerms,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  Text(
                    ' | ',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      l10n.guardianPlanPrivacy,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A single benefit row with a check icon and text.
class _BenefitRow extends StatelessWidget {
  const _BenefitRow({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          Icons.check_circle_rounded,
          color: theme.colorScheme.primary,
          size: 22,
        ),
        const SizedBox(width: DesignTokens.s12),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}

/// A large pricing button with optional savings badge.
class _PricingButton extends StatelessWidget {
  const _PricingButton({
    required this.label,
    required this.onPressed,
    required this.isPrimary,
    this.badge,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isPrimary;
  final String? badge;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final button = SizedBox(
      width: double.infinity,
      child: isPrimary
          ? FilledButton(
              onPressed: onPressed,
              style: FilledButton.styleFrom(
                minimumSize: const Size.fromHeight(DesignTokens.minTouchTarget + 8),
                textStyle: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: Text(label),
            )
          : OutlinedButton(
              onPressed: onPressed,
              style: OutlinedButton.styleFrom(
                minimumSize: const Size.fromHeight(DesignTokens.minTouchTarget + 8),
                textStyle: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: Text(label),
            ),
    );

    if (badge == null) return button;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        button,
        Positioned(
          top: -10,
          right: 16,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: DesignTokens.s8,
              vertical: 2,
            ),
            decoration: BoxDecoration(
              color: theme.colorScheme.tertiary,
              borderRadius: BorderRadius.circular(DesignTokens.radiusPill),
            ),
            child: Text(
              badge!,
              style: theme.textTheme.labelSmall?.copyWith(
                color: theme.colorScheme.onTertiary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
