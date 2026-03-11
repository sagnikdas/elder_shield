import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elder_shield/l10n/app_localizations.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/core/design_tokens.dart';
import 'package:elder_shield/presentation/launch_gate.dart';
import 'package:elder_shield/presentation/onboarding/onboarding_flow.dart';

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

  static ThemeData _buildLightTheme() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: DesignTokens.primary,
      brightness: Brightness.light,
      primary: DesignTokens.primary,
    );
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignTokens.radiusMedium)),
      ),
      cardTheme: CardThemeData(
        elevation: DesignTokens.elevationCard,
        shadowColor: Colors.black26,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignTokens.radiusLarge)),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignTokens.radiusLarge)),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignTokens.radiusLarge)),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(DesignTokens.radiusMedium)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignTokens.radiusMedium)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignTokens.radiusMedium)),
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      dividerTheme: DividerThemeData(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: DesignTokens.fontBody),
        bodyLarge: TextStyle(fontSize: DesignTokens.fontBodyLarge),
      ),
    );
  }

  static ThemeData _buildDarkTheme() {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: DesignTokens.primary,
      brightness: Brightness.dark,
      primary: DesignTokens.primaryLight,
    );
    return ThemeData(
      colorScheme: colorScheme,
      useMaterial3: true,
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        showCloseIcon: false,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignTokens.radiusMedium)),
      ),
      cardTheme: CardThemeData(
        elevation: DesignTokens.elevationCard,
        shadowColor: Colors.black45,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignTokens.radiusLarge)),
        margin: EdgeInsets.zero,
        clipBehavior: Clip.antiAlias,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignTokens.radiusLarge)),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignTokens.radiusLarge)),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(DesignTokens.radiusMedium)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignTokens.radiusMedium)),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      expansionTileTheme: ExpansionTileThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(DesignTokens.radiusMedium)),
        tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
      dividerTheme: DividerThemeData(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: DesignTokens.fontBody),
        bodyLarge: TextStyle(fontSize: DesignTokens.fontBodyLarge),
      ),
    );
  }

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
      onGenerateTitle: (ctx) => AppLocalizations.of(ctx)!.appTitle,
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
      home: _buildHome(),
    );
  }

  Widget _buildHome() {
    if (_onboardingComplete == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    if (_onboardingComplete == false) {
      return OnboardingFlow(onComplete: () {
        setState(() => _onboardingComplete = true);
      });
    }
    return const LaunchGate();
  }
}
