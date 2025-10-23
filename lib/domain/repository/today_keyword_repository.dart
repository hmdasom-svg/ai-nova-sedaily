import '../model/today_keyword.dart';

abstract class TodayKeywordRepository {
  Future<TodayKeyword> fetchTodayKeyword({
    required bool shouldForceRefresh,
  });
}
