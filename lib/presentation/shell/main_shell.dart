import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:elder_shield/application/app_providers.dart';
import 'package:elder_shield/presentation/home/home_screen.dart';
import 'package:elder_shield/presentation/messages/messages_screen.dart';
import 'package:elder_shield/presentation/settings/settings_screen.dart';
import 'package:elder_shield/utils/haptic.dart';

/// Bottom nav: Home, Messages, Settings.
class MainShell extends ConsumerWidget {
  const MainShell({super.key, this.initialIndex = 0});

  final int initialIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(shellTabIndexProvider);

    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: const [
          HomeScreen(),
          MessagesScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (i) {
          selectionClick();
          ref.read(shellTabIndexProvider.notifier).state = i;
        },
        items: _tabs
            .map((t) => BottomNavigationBarItem(
                  icon: Icon(t.icon),
                  label: t.label,
                ))
            .toList(),
      ),
    );
  }

  static const _tabs = [
    _Tab(label: 'Home', icon: Icons.home),
    _Tab(label: 'Messages', icon: Icons.message),
    _Tab(label: 'Settings', icon: Icons.settings),
  ];
}

class _Tab {
  const _Tab({required this.label, required this.icon});
  final String label;
  final IconData icon;
}
