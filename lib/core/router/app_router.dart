import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

import '../../ui/big_kinds/big_kinds_page.dart';
import '../../ui/common/app_scaffold.dart';
import '../../ui/home/home_page.dart';
import '../../ui/issue_flow/issue_flow_page.dart';
import '../../ui/issue_map/issue_map_page.dart';
import '../../ui/provider/big_kinds_provider.dart';
import '../../ui/provider/home_page_provider.dart';
import '../../ui/provider/issue_map_provider.dart';

class AppRoutePaths {
  const AppRoutePaths._();
  static const String home = '/';
  static const String issueMap = '/issuemap';
  static const String bigKinds = '/bigkinds';
  static const String issueFlow = '/issueflow';
}

class AppRouteNames {
  const AppRouteNames._();
  static const String home = 'home';
  static const String issueMap = 'issueMap';
  static const String bigKinds = 'bigKinds';
  static const String issueFlow = 'issueFlow';
}

GoRouter createAppRouter() {
  return GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: AppRoutePaths.home,
        name: AppRouteNames.home,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage<void>(
            child: createHomePageProvider(
              child: const AppScaffold(body: HomePage()),
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutePaths.issueMap,
        name: AppRouteNames.issueMap,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return NoTransitionPage<void>(
            child: createIssueMapProvider(
              child: const AppScaffold(body: IssueMapPage()),
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutePaths.bigKinds,
        name: AppRouteNames.bigKinds,
        pageBuilder: (BuildContext context, GoRouterState state) {
          final String? initialPrompt = state.extra as String?;
          return NoTransitionPage<void>(
            child: createBigKindsProvider(
              initialPrompt: initialPrompt,
              child: const AppScaffold(body: BigKindsPage()),
            ),
          );
        },
      ),
      GoRoute(
        path: AppRoutePaths.issueFlow,
        name: AppRouteNames.issueFlow,
        pageBuilder: (BuildContext context, GoRouterState state) {
          return const NoTransitionPage<void>(
            child: AppScaffold(body: IssueFlowPage()),
          );
        },
      ),
    ],
  );
}
