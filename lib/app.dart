import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elder_shield/l10n/app_localizations.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/core/navigation/app_routes.dart';
import 'package:elder_shield/core/theme/app_theme.dart';
import 'package:elder_shield/platform/whitelist_channel.dart';
import 'package:elder_shield/presentation/launch_gate.dart';
import 'package:elder_shield/presentation/onboarding/onboarding_flow.dart';
import 'package:elder_shield/presentation/paywall/guardian_paywall_screen.dart';
import 'package:elder_shield/presentation/shell/main_shell.dart';

class ElderShieldApp extends ConsumerStatefulWidget {
  const ElderShieldApp({super.key});

  @override
  ConsumerState<ElderShieldApp> createState() => _ElderShieldAppState();
}

class _ElderShieldAppState extends ConsumerState<ElderShieldApp> {
  bool? _onboardingComplete;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkOnboarding();
      _loadFontScale();
      _loadThemeMode();
      _loadLanguage();
      _loadWhitelist();
      _initSubscription();
    });
  }

  Future<void> _checkOnboarding() async {
    final settings = ref.read(settingsServiceProvider);
    final complete = await settings.isOnboardingComplete();
    if (mounted) setState(() => _onboardingComplete = complete);
  }

  Future<void> _loadFontScale() async {
    final settings = ref.read(settingsServiceProvider);
    final scale = await settings.getFontScale();
    if (mounted) ref.read(fontScaleProvider.notifier).state = scale;
  }

  Future<void> _loadThemeMode() async {
    final settings = ref.read(settingsServiceProvider);
    final mode = await settings.getThemeMode();
    if (mounted) ref.read(themeModeProvider.notifier).state = mode;
  }

  Future<void> _loadLanguage() async {
    final settings = ref.read(settingsServiceProvider);
    final code = await settings.getLanguageCode();
    if (mounted) ref.read(languageCodeProvider.notifier).state = code;
  }

  Future<void> _loadWhitelist() async {
    final settings = ref.read(settingsServiceProvider);
    final senders = await settings.getWhitelistedSenders();
    if (!mounted) return;
    ref.read(whitelistedSendersProvider.notifier).state = senders.toSet();
    // Sync to Kotlin layer so background checks also respect the whitelist.
    if (senders.isNotEmpty) {
      unawaited(WhitelistChannel.setWhitelist(senders));
    }
  }

  Future<void> _initSubscription() async {
    try {
      final service = ref.read(subscriptionServiceProvider);
      await service.initialize();
    } catch (e) {
      // Non-fatal: subscription init failure should never crash the app.
      debugPrint('[App] Subscription init error: $e');
    }
  }

  static ThemeData _buildLightTheme() => AppTheme.light();

  static ThemeData _buildDarkTheme() => AppTheme.dark();

  ThemeMode _themeModeFrom(String key) {
    switch (key) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  @override
  Widget build(BuildContext context) {
    final fontScale = ref.watch(fontScaleProvider);
    final themeModeKey = ref.watch(themeModeProvider);
    final languageCode = ref.watch(languageCodeProvider);
    final systemScaler = MediaQuery.of(context).textScaler;
    final combinedScaler = TextScaler.linear(systemScaler.scale(1.0) * fontScale);

    final locale =
        languageCode == null || languageCode.isEmpty ? null : Locale(languageCode);

    return MaterialApp(
      onGenerateTitle: (_) => 'Elder Shield',
      title: 'Elder Shield',
      debugShowCheckedModeBanner: false,
      locale: locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: _buildLightTheme(),
      darkTheme: _buildDarkTheme(),
      themeMode: _themeModeFrom(themeModeKey),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: combinedScaler),
          child: child!,
        );
      },
      initialRoute: AppRoutes.root,
      onGenerateRoute: _onGenerateRoute,
    );
  }

  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    Widget builder(BuildContext context) {
      switch (settings.name) {
        case AppRoutes.root:
          if (_onboardingComplete == null) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          if (_onboardingComplete == false) {
            return OnboardingFlow(
              onComplete: () {
                setState(() => _onboardingComplete = true);
                Navigator.of(context).pushReplacementNamed(AppRoutes.shell);
              },
            );
          }
          return const LaunchGate();
        case AppRoutes.shell:
          return const MainShell();
        case AppRoutes.messages:
          return const MainShell(initialIndex: 1);
        case AppRoutes.settings:
          return const MainShell(initialIndex: 2);
        case AppRoutes.guardianPaywall:
          return const GuardianPaywallScreen();
        default:
          return const Scaffold(
            body: Center(
              child: Text('Page not found'),
            ),
          );
      }
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
