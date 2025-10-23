import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../core/di/service_locator.dart';
import '../../domain/usecase/fetch_issue_map_use_case.dart';
import '../../domain/usecase/fetch_today_keyword_use_case.dart';
import '../home/home_page_controller.dart';

/// 홈페이지 컨트롤러를 위한 Provider 생성
ChangeNotifierProvider<HomePageController> createHomePageProvider({
  required Widget child,
}) {
  return ChangeNotifierProvider<HomePageController>(
    create: (BuildContext context) {
      final FetchTodayKeywordUseCase fetchTodayKeywordUseCase =
          locator<FetchTodayKeywordUseCase>();
      final FetchIssueMapUseCase fetchIssueMapUseCase =
          locator<FetchIssueMapUseCase>();
      return HomePageController(
        fetchTodayKeywordUseCase: fetchTodayKeywordUseCase,
        fetchIssueMapUseCase: fetchIssueMapUseCase,
      )..loadTodayKeyword();
    },
    child: child,
  );
}
