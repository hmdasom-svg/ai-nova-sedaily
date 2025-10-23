import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:go_router/go_router.dart';

import 'core/di/service_locator.dart';
import 'core/router/app_router.dart';
import 'ui/common/no_bounce_scroll_behavior.dart';

void main() {
  usePathUrlStrategy();
  setupLocator();
  final GoRouter router = createAppRouter();
  runApp(SedailyApp(router: router));
}

class SedailyApp extends StatelessWidget {
  const SedailyApp({super.key, required this.router});

  final GoRouter router;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: '서울경제 AI',
      theme: buildAppTheme(),
      routerConfig: router,
      scrollBehavior: const NoBounceScrollBehavior(),
    );
  }
}

ThemeData buildAppTheme() {
  final ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.indigo,
  );
  return ThemeData(
    colorScheme: colorScheme,
    useMaterial3: true,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
  );
}
