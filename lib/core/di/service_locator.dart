import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../data/datasource/issue_flow_api.dart';
import '../../data/datasource/issue_flow_remote_data_source.dart';
import '../../data/datasource/issue_map_api.dart';
import '../../data/datasource/issue_map_remote_data_source.dart';
import '../../data/datasource/news_chat_api.dart';
import '../../data/datasource/news_chat_remote_data_source.dart';
import '../../data/datasource/news_search_api.dart';
import '../../data/datasource/news_search_remote_data_source.dart';
import '../../data/datasource/today_keyword_api.dart';
import '../../data/datasource/today_keyword_remote_data_source.dart';
import '../../data/repository/issue_flow_repository_impl.dart';
import '../../data/repository/issue_map_repository_impl.dart';
import '../../data/repository/news_chat_repository_impl.dart';
import '../../data/repository/news_search_repository_impl.dart';
import '../../data/repository/today_keyword_repository_impl.dart';
import '../../domain/repository/issue_flow_repository.dart';
import '../../domain/repository/issue_map_repository.dart';
import '../../domain/repository/news_chat_repository.dart';
import '../../domain/repository/news_search_repository.dart';
import '../../domain/repository/today_keyword_repository.dart';
import '../../domain/usecase/fetch_issue_flow_use_case.dart';
import '../../domain/usecase/fetch_issue_map_use_case.dart';
import '../../domain/usecase/fetch_news_search_use_case.dart';
import '../../domain/usecase/request_news_chat_use_case.dart';
import '../../domain/usecase/fetch_today_keyword_use_case.dart';
import '../network/app_dio_factory.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<AppDioFactory>(() => const AppDioFactory());
  locator.registerLazySingleton<Dio>(() => locator<AppDioFactory>().create());
  locator.registerLazySingleton<TodayKeywordApi>(
    () => TodayKeywordApi(locator<Dio>()),
  );
  locator.registerLazySingleton<IssueMapApi>(() => IssueMapApi(locator<Dio>()));
  locator.registerLazySingleton<IssueFlowApi>(
    () => IssueFlowApi(locator<Dio>()),
  );
  locator.registerLazySingleton<NewsSearchApi>(
    () => NewsSearchApi(locator<Dio>()),
  );
  locator.registerLazySingleton<NewsChatApi>(() => NewsChatApi(locator<Dio>()));
  locator.registerLazySingleton<TodayKeywordRemoteDataSource>(
    () => TodayKeywordRemoteDataSource(
      dio: locator<Dio>(),
      api: locator<TodayKeywordApi>(),
    ),
  );
  locator.registerLazySingleton<IssueMapRemoteDataSource>(
    () => IssueMapRemoteDataSource(
      dio: locator<Dio>(),
      api: locator<IssueMapApi>(),
    ),
  );
  locator.registerLazySingleton<IssueFlowRemoteDataSource>(
    () => IssueFlowRemoteDataSource(api: locator<IssueFlowApi>()),
  );
  locator.registerLazySingleton<NewsSearchRemoteDataSource>(
    () => NewsSearchRemoteDataSource(api: locator<NewsSearchApi>()),
  );
  locator.registerLazySingleton<NewsChatRemoteDataSource>(
    () => NewsChatRemoteDataSource(api: locator<NewsChatApi>()),
  );
  locator.registerLazySingleton<TodayKeywordRepository>(
    () => TodayKeywordRepositoryImpl(
      remoteDataSource: locator<TodayKeywordRemoteDataSource>(),
    ),
  );
  locator.registerLazySingleton<IssueMapRepository>(
    () => IssueMapRepositoryImpl(
      remoteDataSource: locator<IssueMapRemoteDataSource>(),
    ),
  );
  locator.registerLazySingleton<IssueFlowRepository>(
    () => IssueFlowRepositoryImpl(
      remoteDataSource: locator<IssueFlowRemoteDataSource>(),
    ),
  );
  locator.registerLazySingleton<NewsSearchRepository>(
    () => NewsSearchRepositoryImpl(
      remoteDataSource: locator<NewsSearchRemoteDataSource>(),
    ),
  );
  locator.registerLazySingleton<NewsChatRepository>(
    () => NewsChatRepositoryImpl(
      remoteDataSource: locator<NewsChatRemoteDataSource>(),
    ),
  );
  locator.registerFactory<FetchTodayKeywordUseCase>(
    () =>
        FetchTodayKeywordUseCase(repository: locator<TodayKeywordRepository>()),
  );
  locator.registerFactory<FetchIssueMapUseCase>(
    () => FetchIssueMapUseCase(repository: locator<IssueMapRepository>()),
  );
  locator.registerFactory<FetchIssueFlowUseCase>(
    () => FetchIssueFlowUseCase(repository: locator<IssueFlowRepository>()),
  );
  locator.registerFactory<FetchNewsSearchUseCase>(
    () => FetchNewsSearchUseCase(repository: locator<NewsSearchRepository>()),
  );
  locator.registerFactory<RequestNewsChatUseCase>(
    () => RequestNewsChatUseCase(repository: locator<NewsChatRepository>()),
  );
}
