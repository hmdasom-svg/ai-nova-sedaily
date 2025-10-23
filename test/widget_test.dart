// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/single_child_widget.dart';

import 'package:sedaily_ai_nova/main.dart';

void main() {
  testWidgets('SedailyApp renders root material app', (
    WidgetTester tester,
  ) async {
    final GoRouter router = GoRouter(
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const SizedBox();
          },
        ),
      ],
    );
    await tester.pumpWidget(
      SedailyApp(router: router, providers: <SingleChildWidget>[]),
    );
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
