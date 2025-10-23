import '../model/news_search_request.dart';
import '../model/news_search_result.dart';

abstract class NewsSearchRepository {
  Future<NewsSearchResult> fetchNews(NewsSearchRequest request);
}
