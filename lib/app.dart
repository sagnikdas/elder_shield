import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elder_shield/application/app_providers.dart';
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

  static ThemeData _buildLightTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0), brightness: Brightness.light),
      useMaterial3: true,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16),
        bodyLarge: TextStyle(fontSize: 18),
      ),
    );
  }

  static ThemeData _buildDarkTheme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0), brightness: Brightness.dark),
      useMaterial3: true,
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 16),
        bodyLarge: TextStyle(fontSize: 18),
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
    final systemScaler = MediaQuery.of(context).textScaler;
    final combinedScaler = TextScaler.linear(systemScaler.scale(1.0) * fontScale);

    return MaterialApp(
      title: 'Elder Shield',
      debugShowCheckedModeBanner: false,
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
        body: Center(child: CircularProgressIndicator()),
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
