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
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkOnboarding());
  }

  Future<void> _checkOnboarding() async {
    final settings = ref.read(settingsServiceProvider);
    final complete = await settings.isOnboardingComplete();
    if (mounted) setState(() => _onboardingComplete = complete);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elder Shield',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1565C0)),
        useMaterial3: true,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 16),
          bodyLarge: TextStyle(fontSize: 18),
        ),
      ),
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
