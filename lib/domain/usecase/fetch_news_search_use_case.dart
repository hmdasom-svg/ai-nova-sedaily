import '../model/news_search_request.dart';
import '../model/news_search_result.dart';
import '../repository/news_search_repository.dart';

class FetchNewsSearchUseCase {
  const FetchNewsSearchUseCase({required NewsSearchRepository repository})
    : _repository = repository;
  final NewsSearchRepository _repository;
  Future<NewsSearchResult> execute(NewsSearchRequest request) {
    return _repository.fetchNews(request);
  }
}
