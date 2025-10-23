import '../../domain/model/news_search_request.dart';
import '../../domain/model/news_search_result.dart';
import '../../domain/repository/news_search_repository.dart';
import '../datasource/news_search_remote_data_source.dart';
import '../model/news_search_dto.dart';

class NewsSearchRepositoryImpl implements NewsSearchRepository {
  const NewsSearchRepositoryImpl({
    required NewsSearchRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;
  final NewsSearchRemoteDataSource _remoteDataSource;
  @override
  Future<NewsSearchResult> fetchNews(NewsSearchRequest request) async {
    final NewsSearchDto dto = await _remoteDataSource.fetchNews(
      keyword: request.keyword,
      date: request.date,
    );
    return dto.toDomain();
  }
}
