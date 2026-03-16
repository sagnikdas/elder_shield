import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elder_shield/l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/application/security_controller.dart';
import 'package:elder_shield/core/design_tokens.dart';
import 'package:elder_shield/core/theme/app_spacing.dart';
import 'package:elder_shield/presentation/widgets/elder_shield_app_bar.dart';
import 'package:elder_shield/services/settings_service.dart';
import 'package:elder_shield/widgets/app_button.dart';
import 'package:elder_shield/widgets/app_card.dart';
import 'package:elder_shield/utils/haptic.dart';
import 'package:elder_shield/utils/snackbars.dart';

/// Home: protection status, today risk count, large "Call trusted contact" button.
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _permissionsGranted = false;
  bool _requestedOnce = false;
  int _todayRiskCount = 0;
  String? _trustedContactName;
  String? _trustedContactNumber;
  bool _showCallButtonTooltip = false;
  bool _showWhyTrustedContact = false;
  List<TrustedContact> _trustedContacts = [];
  late final SecurityController _securityController;
  late final SettingsService _settings;
  int _selectedTrustedIndex = 0;
  late final ProviderSubscription<int> _shellTabSub;

  @override
  void initState() {
    super.initState();
    _securityController = ref.read(securityControllerProvider);
    _settings = ref.read(settingsServiceProvider);
    // Keep trusted contacts in sync when user navigates back to Home tab.
    _shellTabSub = ref.listenManual<int>(shellTabIndexProvider, (previous, next) {
      if (next == 0) {
        _loadTrustedContact();
      }
    });
    _ensurePermissionsAndStart();
    _loadTrustedContact();
    _loadTodayCount();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future<void>.delayed(
        const Duration(milliseconds: 800),
        _maybeShowCallButtonTooltip,
      );
    });
  }

  Future<void> _maybeShowCallButtonTooltip() async {
    if (!mounted) return;
    if (await _settings.isCallButtonTooltipShown()) return;
    if (!mounted) return;
    final hasTrusted = _trustedContactNumber != null &&
        _trustedContactNumber!.trim().isNotEmpty;
    if (!hasTrusted) return;
    if (!mounted) return;
    setState(() => _showCallButtonTooltip = true);
  }

  Future<void> _dismissCallButtonTooltip() async {
    if (!_showCallButtonTooltip) return;
    await _settings.setCallButtonTooltipShown(true);
    if (mounted) setState(() => _showCallButtonTooltip = false);
  }

  Future<void> _maybeShowPostOnboardingDialog() async {
    if (await _settings.isPostOnboardingDialogShown()) return;
    if (!_permissionsGranted) return;
    if (!mounted) return;
    await _loadTrustedContact();
    if (!mounted) return;
    final l10n = AppLocalizations.of(context)!;
    final name = _trustedContactName?.isNotEmpty == true
        ? _trustedContactName!
        : l10n.homeTrustedContactFallbackName;
    if (!mounted) return;
    await showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.homePostOnboardingTitle),
        content: Text(
          l10n.homePostOnboardingBody(name),
        ),
        actions: [
          FilledButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: Text(l10n.commonGotIt),
          ),
        ],
      ),
    );
    await _settings.setPostOnboardingDialogShown(true);
  }

  Future<void> _loadTrustedContact() async {
    final list = await _settings.getTrustedContacts();
    if (!mounted) return;
    setState(() {
      _trustedContacts = list;
      if (list.isNotEmpty) {
        if (_selectedTrustedIndex >= list.length) {
          _selectedTrustedIndex = 0;
        }
        final selected = list[_selectedTrustedIndex];
        _trustedContactName = selected.name;
        _trustedContactNumber = selected.number;
      } else {
        _selectedTrustedIndex = 0;
        _trustedContactName = null;
        _trustedContactNumber = null;
      }
    });
  }

  Future<void> _loadTodayCount() async {
    final repo = ref.read(messageRepositoryProvider);
    final count = await repo.fetchTodayRiskCount();
    if (mounted) setState(() => _todayRiskCount = count);
  }

  Future<void> _ensurePermissionsAndStart() async {
    if (_requestedOnce) return;
    _requestedOnce = true;

    final smsStatus = await Permission.sms.status;
    final phoneStatus = await Permission.phone.status;
    final notificationStatus = await Permission.notification.status;

    if (!smsStatus.isGranted ||
        !phoneStatus.isGranted ||
        !notificationStatus.isGranted) {
      final result = await [
        Permission.sms,
        Permission.phone,
        Permission.notification,
      ].request();

      final smsGranted = result[Permission.sms]?.isGranted ?? false;
      final phoneGranted = result[Permission.phone]?.isGranted ?? false;
      final notificationGranted =
          result[Permission.notification]?.isGranted ?? true;

      if (!smsGranted || !phoneGranted || !notificationGranted) {
        if (mounted) setState(() => _permissionsGranted = false);
        final smsPerm = await Permission.sms.status;
        final phonePerm = await Permission.phone.status;
        if (smsPerm.isPermanentlyDenied || phonePerm.isPermanentlyDenied) {
          if (!mounted) return;
          await showDialog<void>(
            context: context,
            builder: (ctx) => AlertDialog(
              title:
                  Text(AppLocalizations.of(context)!.permissionsDialogTitle),
              content: Text(
                AppLocalizations.of(context)!.permissionsDialogBody,
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(ctx).pop(),
                  child:
                      Text(AppLocalizations.of(context)!.commonCancel),
                ),
                FilledButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                    openAppSettings();
                  },
                  child: Text(
                    AppLocalizations.of(context)!
                        .permissionsDialogOpenSettings,
                  ),
                ),
              ],
            ),
          );
        }
        return;
      }
    }

    if (!mounted) return;
    setState(() => _permissionsGranted = true);
    _securityController.start();
    await _maybeShowPostOnboardingDialog();
  }

  Future<void> _callTrustedContact() async {
    final number = _trustedContactNumber?.trim();
    if (number == null || number.isEmpty) return;
    final uri =
        Uri.parse('tel:${number.replaceAll(RegExp(r'\s'), '')}');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }

  @override
  void dispose() {
    _shellTabSub.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasTrusted = _trustedContacts.isNotEmpty;
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;
    final isDark = theme.brightness == Brightness.dark;
    final riskCardColor = _todayRiskCount > 0
        ? (isDark
            ? Colors.orange.shade900.withValues(alpha: 0.3)
            : Colors.orange.shade50)
        : (isDark
            ? theme.colorScheme.surfaceContainerHighest
            : Colors.grey.shade100);

    return Scaffold(
      appBar: ElderShieldAppBar(titleText: 'Elder Shield'),
      body: RefreshIndicator(
        onRefresh: () async {
          lightImpact();
          await _loadTodayCount();
          await _loadTrustedContact();
          if (!mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            elderSnackBar(l10n.snackbarUpdated),
          );
        },
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: AppSpacing.xl),

                // Protection status card
                Semantics(
                  container: true,
                  label: _permissionsGranted
                      ? '${l10n.homeProtectionStatusLabel}: ${l10n.homeProtectionStatusProtected}'
                      : '${l10n.homeProtectionStatusLabel}: ${l10n.homeProtectionStatusPermissionsNeeded}',
                  readOnly: true,
                  child: ExcludeSemantics(
                    child: AnimatedContainer(
                      duration: DesignTokens.animationNormal,
                      curve: DesignTokens.animationEaseInOut,
                      transformAlignment: Alignment.center,
                      padding: EdgeInsets.zero,
                      child: AppCard(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xl,
                          vertical: AppSpacing.xl,
                        ),
                        child: Column(
                          children: [
                            Text(
                              l10n.homeProtectionStatusLabel,
                              style: theme.textTheme.titleMedium
                                  ?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: theme
                                    .colorScheme.onSurfaceVariant,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: AppSpacing.md),
                            AnimatedSwitcher(
                              duration:
                                  DesignTokens.animationNormal,
                              switchInCurve:
                                  DesignTokens.animationEaseInOut,
                              switchOutCurve:
                                  DesignTokens.animationEaseInOut,
                              child: Row(
                                key: ValueKey<bool>(
                                  _permissionsGranted,
                                ),
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    _permissionsGranted
                                        ? Icons.shield_rounded
                                        : Icons.shield_outlined,
                                    size: 52,
                                    color: _permissionsGranted
                                        ? Colors.green
                                        : Colors.amber.shade700,
                                  ),
                                  const SizedBox(
                                    width: DesignTokens.s12,
                                  ),
                                  Flexible(
                                    child: Text(
                                      _permissionsGranted
                                          ? l10n
                                              .homeProtectionStatusProtected
                                          : l10n
                                              .homeProtectionStatusPermissionsNeeded,
                                      style: theme
                                          .textTheme.titleLarge
                                          ?.copyWith(
                                        fontWeight:
                                            FontWeight.bold,
                                        letterSpacing: -0.2,
                                      ),
                                      overflow:
                                          TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                AnimatedSwitcher(
                  duration: DesignTokens.animationNormal,
                  switchInCurve: DesignTokens.animationEaseInOut,
                  switchOutCurve: DesignTokens.animationEaseInOut,
                  child: !_permissionsGranted
                      ? Column(
                          key: const ValueKey('enable-permissions'),
                          children: [
                            const SizedBox(height: AppSpacing.md),
                            AppButton(
                              label:
                                  l10n.homeEnableProtectionButton,
                              onPressed: () {
                                lightImpact();
                                _ensurePermissionsAndStart();
                              },
                            ),
                          ],
                        )
                      : const SizedBox.shrink(),
                ),

                const SizedBox(height: AppSpacing.xxl),

                // Today's risk summary
                Semantics(
                  container: true,
                  button: true,
                  label: _todayRiskCount > 0
                      ? l10n.homeTodayRiskSummaryWithCount(
                          _todayRiskCount,
                        )
                      : l10n.homeTodayRiskSummaryNoRisk,
                  hint:
                      'Double tap to open the Messages tab.',
                  child: ExcludeSemantics(
                    child: Material(
                      color: riskCardColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            DesignTokens.radiusLarge),
                        side: BorderSide(
                          color: theme
                              .colorScheme.outlineVariant
                              .withValues(alpha: 0.6),
                        ),
                      ),
                      child: InkWell(
                        onTap: () {
                          selectionClick();
                          ref
                              .read(
                                  shellTabIndexProvider.notifier)
                              .state = 1;
                        },
                        borderRadius: BorderRadius.circular(
                            DesignTokens.radiusLarge),
                        child: Padding(
                          padding: const EdgeInsets.all(
                              AppSpacing.lg),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  mainAxisSize:
                                      MainAxisSize.min,
                                  children: [
                                    Text(
                                      _todayRiskCount > 0
                                          ? l10n.homeTodayRiskSummaryWithCount(
                                              _todayRiskCount,
                                            )
                                          : l10n.homeTodayRiskSummaryNoRisk,
                                      style: theme.textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                        fontSize:
                                            _todayRiskCount > 0
                                                ? 20
                                                : null,
                                        fontWeight:
                                            _todayRiskCount > 0
                                                ? FontWeight
                                                    .w700
                                                : null,
                                      ),
                                    ),
                                    const SizedBox(
                                        height: 4),
                                    Text(
                                      l10n.homeTodayRiskTapToSeeMessages,
                                      style: theme
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                        color: theme
                                            .colorScheme
                                            .onSurfaceVariant,
                                        fontStyle:
                                            FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.chevron_right_rounded,
                                size: 26,
                                color: theme.colorScheme
                                    .onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                l10n.commonView,
                                style: theme
                                    .textTheme.labelLarge
                                    ?.copyWith(
                                  color: theme
                                      .colorScheme.primary,
                                  fontWeight:
                                      FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: AppSpacing.sm),
                Text(
                  l10n.homeAutoCheckInfo,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme
                        .colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: AppSpacing.xxl),

                // Call trusted contact
                if (hasTrusted)
                  Semantics(
                    container: true,
                    button: true,
                    label:
                        'Call ${_trustedContactName?.isNotEmpty == true ? _trustedContactName! : 'trusted contact'}',
                    hint:
                        'Double tap to start a phone call.',
                    child: ExcludeSemantics(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          AppButton(
                            label:
                                l10n.homeCallTrustedButtonLabel(
                              _trustedContactName
                                          ?.isNotEmpty ==
                                      true
                                  ? _trustedContactName!
                                  : l10n
                                      .homeTrustedContactFallbackName,
                            ),
                            icon: Icons.phone_rounded,
                            onPressed: () {
                              if (_showCallButtonTooltip) {
                                _dismissCallButtonTooltip();
                              }
                              selectionClick();
                              _callTrustedContact();
                            },
                          ),
                          Positioned(
                            left: 0,
                            right: 0,
                            bottom: 72,
                            child: AnimatedOpacity(
                              duration:
                                  DesignTokens.animationNormal,
                              curve: DesignTokens.animationEaseOutCubic,
                              opacity:
                                  _showCallButtonTooltip ? 1 : 0,
                              child: IgnorePointer(
                                ignoring: !_showCallButtonTooltip,
                                child: Material(
                                  elevation: 2,
                                  shadowColor: Colors.black26,
                                  borderRadius:
                                      BorderRadius.circular(
                                          DesignTokens
                                              .radiusLarge),
                                  color: theme
                                      .colorScheme
                                      .surfaceContainerHighest,
                                  child: InkWell(
                                    onTap: () {
                                      selectionClick();
                                      _dismissCallButtonTooltip();
                                    },
                                    borderRadius:
                                        BorderRadius.circular(
                                            DesignTokens
                                                .radiusLarge),
                                    child: Padding(
                                      padding:
                                          const EdgeInsets
                                              .symmetric(
                                        horizontal: 20,
                                        vertical: 14,
                                      ),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons
                                                .lightbulb_outline,
                                            color: theme
                                                .colorScheme
                                                .primary,
                                            size: 24,
                                          ),
                                          const SizedBox(
                                              width: 12),
                                          Expanded(
                                            child: Text(
                                              l10n
                                                  .homeCallTooltipText,
                                              style: theme
                                                  .textTheme
                                                  .bodyMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                else
                  AppCard(
                    child: Column(
                      children: [
                        Text(
                          l10n.homeAddTrustedIntro,
                          style: theme.textTheme.bodyLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                            height: AppSpacing.md),
                        TextButton.icon(
                          onPressed: () {
                            selectionClick();
                            ref
                                .read(shellTabIndexProvider
                                    .notifier)
                                .state = 2;
                          },
                          icon:
                              const Icon(Icons.person_add),
                          label: Text(
                              l10n.homeAddTrustedButton),
                        ),
                        const SizedBox(
                            height: AppSpacing.sm),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextButton(
                            onPressed: () {
                              selectionClick();
                              setState(() {
                                _showWhyTrustedContact =
                                    !_showWhyTrustedContact;
                              });
                            },
                            child: Text(
                              _showWhyTrustedContact
                                  ? l10n.homeWhyAddTrustedHide
                                  : l10n.homeWhyAddTrustedShow,
                              style: theme
                                  .textTheme.bodySmall
                                  ?.copyWith(
                                color: theme
                                    .colorScheme
                                    .onSurfaceVariant,
                                decoration:
                                    TextDecoration
                                        .underline,
                              ),
                            ),
                          ),
                        ),
                        if (_showWhyTrustedContact) ...[
                          const SizedBox(
                              height: AppSpacing.sm),
                          Text(
                            l10n
                                .homeWhyAddTrustedExplanation,
                            style: theme
                                .textTheme.bodySmall
                                ?.copyWith(
                              color: theme
                                  .colorScheme
                                  .onSurfaceVariant,
                              height: 1.4,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ],
                    ),
                  ),

                if (_trustedContacts.isNotEmpty) ...[
                  const SizedBox(height: AppSpacing.xl),
                  Text(
                    l10n.homeTrustedContactsHeader,
                    style: theme.textTheme.titleMedium
                        ?.copyWith(
                            fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(
                      height: DesignTokens.s8),
                  Column(
                    children: _trustedContacts
                        .asMap()
                        .entries
                        .map((entry) {
                      final index = entry.key;
                      final contact = entry.value;
                      final isSelected =
                          index == _selectedTrustedIndex;
                      final title = contact.name.isNotEmpty
                          ? contact.name
                          : contact.number;
                      final subtitle =
                          contact.name.isNotEmpty
                              ? contact.number
                              : null;
                      return Card(
                        margin:
                            const EdgeInsets.symmetric(
                          vertical: 5,
                        ),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                  DesignTokens
                                      .radiusMedium),
                          side: BorderSide(
                            color: isSelected
                                ? theme
                                    .colorScheme.primary
                                : theme.colorScheme
                                    .outlineVariant
                                    .withValues(
                                        alpha: 0.7),
                            width: isSelected ? 2 : 1,
                          ),
                        ),
                        child: ListTile(
                          contentPadding:
                              const EdgeInsets
                                  .symmetric(
                            horizontal:
                                DesignTokens.s16,
                            vertical: 10,
                          ),
                          leading: Icon(
                            Icons
                                .person_outline_rounded,
                            color: isSelected
                                ? theme
                                    .colorScheme.primary
                                : theme.colorScheme
                                    .onSurfaceVariant,
                          ),
                          title: Text(
                            title,
                            style: TextStyle(
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                          ),
                          subtitle: subtitle != null
                              ? Text(
                                  subtitle,
                                  style: theme
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                    color: theme
                                        .colorScheme
                                        .onSurfaceVariant,
                                  ),
                                )
                              : null,
                          trailing: isSelected
                              ? Icon(
                                  Icons
                                      .check_circle_rounded,
                                  color: theme
                                      .colorScheme.primary,
                                  size: 24,
                                )
                              : null,
                          onTap: () {
                            setState(() {
                              _selectedTrustedIndex =
                                  index;
                              _trustedContactName =
                                  contact.name;
                              _trustedContactNumber =
                                  contact.number;
                            });
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}