import 'dart:async';

import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:elder_shield/features/settings/data/settings_service.dart';

/// Manages Guardian Plan subscriptions via Google Play Billing.
///
/// Core protection stays free forever. Guardian features (alerts, heartbeat,
/// summary) are gated behind this subscription.
///
/// Premium state is cached locally in [SettingsService] (EncryptedSharedPreferences)
/// and re-verified with the Play Store on every app start.
class SubscriptionService {
  SubscriptionService(this._settingsService);

  final SettingsService _settingsService;

  /// Google Play Console product IDs.
  static const String monthlyPlanId = 'guardian_plan_monthly';
  static const String yearlyPlanId = 'guardian_plan_yearly';

  static const Set<String> _productIds = {monthlyPlanId, yearlyPlanId};

  final InAppPurchase _iap = InAppPurchase.instance;
  StreamSubscription<List<PurchaseDetails>>? _purchaseSubscription;

  final _isPremiumController = StreamController<bool>.broadcast();
  bool _isPremium = false;

  /// Stream of premium status updates.
  Stream<bool> get isPremiumStream => _isPremiumController.stream;

  /// Current premium status (synchronous).
  bool get isPremium => _isPremium;

  /// Initialize the service: load cached state, listen to purchase stream,
  /// and verify existing purchases with the store.
  Future<void> initialize() async {
    // Load cached premium state for instant UI rendering.
    _isPremium = await _settingsService.getIsPremiumCached();
    _isPremiumController.add(_isPremium);

    final available = await _iap.isAvailable();
    if (!available) return;

    // Listen to purchase updates (new purchases, restorations, errors).
    _purchaseSubscription = _iap.purchaseStream.listen(
      _handlePurchaseUpdates,
      onDone: () => _purchaseSubscription?.cancel(),
      onError: (_) {},
    );

    // Re-verify existing purchases on startup.
    await restorePurchases();
  }

  /// Fetch available subscription products from the Play Store.
  Future<List<ProductDetails>> getProducts() async {
    final available = await _iap.isAvailable();
    if (!available) return [];

    final response = await _iap.queryProductDetails(_productIds);
    if (response.error != null) return [];
    return response.productDetails;
  }

  /// Initiate a monthly subscription purchase.
  Future<void> purchaseMonthly() async {
    final products = await getProducts();
    final monthly = products.where((p) => p.id == monthlyPlanId).firstOrNull;
    if (monthly == null) return;
    await _purchase(monthly);
  }

  /// Initiate a yearly subscription purchase.
  Future<void> purchaseYearly() async {
    final products = await getProducts();
    final yearly = products.where((p) => p.id == yearlyPlanId).firstOrNull;
    if (yearly == null) return;
    await _purchase(yearly);
  }

  /// Purchase a specific product.
  Future<void> _purchase(ProductDetails product) async {
    final purchaseParam = PurchaseParam(productDetails: product);
    await _iap.buyNonConsumable(purchaseParam: purchaseParam);
  }

  /// Restore previous purchases (e.g. after reinstall or device change).
  Future<void> restorePurchases() async {
    await _iap.restorePurchases();
  }

  /// Handle incoming purchase update events from the Play Store.
  Future<void> _handlePurchaseUpdates(
    List<PurchaseDetails> purchases,
  ) async {
    for (final purchase in purchases) {
      switch (purchase.status) {
        case PurchaseStatus.purchased:
        case PurchaseStatus.restored:
          await _deliverEntitlement(true);
          // Complete pending purchases to acknowledge with the store.
          if (purchase.pendingCompletePurchase) {
            await _iap.completePurchase(purchase);
          }
          break;

        case PurchaseStatus.pending:
          // Purchase is pending (e.g. awaiting payment confirmation).
          // Don't change premium state — keep current cached value.
          break;

        case PurchaseStatus.error:
          // Purchase failed. If the user was previously premium (e.g. subscription
          // expired), we should not revoke until we confirm via restore.
          break;

        case PurchaseStatus.canceled:
          // User canceled the purchase flow. No state change needed.
          break;
      }
    }
  }

  /// Update premium state both in memory and in the local cache.
  Future<void> _deliverEntitlement(bool premium) async {
    _isPremium = premium;
    _isPremiumController.add(premium);
    await _settingsService.setIsPremiumCached(premium);
  }

  /// Clean up resources.
  void dispose() {
    _purchaseSubscription?.cancel();
    _isPremiumController.close();
  }
}
