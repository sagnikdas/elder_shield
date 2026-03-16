import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elder_shield/app.dart';
import 'package:elder_shield/core/navigation/app_routes.dart';

void main() {
  testWidgets('App renders without crashing', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: ElderShieldApp()));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 800));
    expect(
      find.byType(ProviderScope),
      findsOneWidget,
      reason: 'App root is mounted',
    );
  });

  testWidgets('Initial route is root', (WidgetTester tester) async {
    await tester.pumpWidget(const ProviderScope(child: ElderShieldApp()));
    await tester.pump();

    final navigator = find.byType(Navigator);
    expect(navigator, findsOneWidget);

    final element = tester.element(navigator);
    final navState = Navigator.of(element);
    expect(navState.widget.initialRoute ?? AppRoutes.root, AppRoutes.root);
  });
}
