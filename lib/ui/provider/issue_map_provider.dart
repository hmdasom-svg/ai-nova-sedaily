import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../core/di/service_locator.dart';
import '../../domain/usecase/fetch_issue_map_use_case.dart';
import '../../domain/usecase/fetch_news_search_use_case.dart';
import '../../domain/usecase/fetch_today_keyword_use_case.dart';
import '../issue_map/issue_map_controller.dart';

/// IssueMapController를 위한 Provider 생성
ChangeNotifierProvider<IssueMapController> createIssueMapProvider({
  required Widget child,
}) {
  return ChangeNotifierProvider<IssueMapController>(
    create: (_) => IssueMapController(
      fetchTodayKeywordUseCase: locator<FetchTodayKeywordUseCase>(),
      fetchIssueMapUseCase: locator<FetchIssueMapUseCase>(),
      fetchNewsSearchUseCase: locator<FetchNewsSearchUseCase>(),
    ),
    child: child,
  );
}
