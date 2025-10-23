import '../model/today_keyword.dart';
import '../repository/today_keyword_repository.dart';

class FetchTodayKeywordParams {
  const FetchTodayKeywordParams({
    this.shouldForceRefresh = false,
  });

  final bool shouldForceRefresh;
}

class FetchTodayKeywordUseCase {
  const FetchTodayKeywordUseCase({required TodayKeywordRepository repository})
    : _repository = repository;
  final TodayKeywordRepository _repository;
  Future<TodayKeyword> execute(FetchTodayKeywordParams params) {
    return _repository.fetchTodayKeyword(
      shouldForceRefresh: params.shouldForceRefresh,
    );
  }
}
