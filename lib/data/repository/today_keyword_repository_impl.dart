import '../../domain/model/today_keyword.dart';
import '../../domain/repository/today_keyword_repository.dart';
import '../datasource/today_keyword_remote_data_source.dart';
import '../model/today_keyword_dto.dart';

class TodayKeywordRepositoryImpl implements TodayKeywordRepository {
  TodayKeywordRepositoryImpl({
    required TodayKeywordRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final TodayKeywordRemoteDataSource _remoteDataSource;
  TodayKeyword? _cachedTodayKeyword;

  @override
  Future<TodayKeyword> fetchTodayKeyword({
    required bool shouldForceRefresh,
  }) async {
    if (!shouldForceRefresh && _cachedTodayKeyword != null) {
      return _cachedTodayKeyword!;
    }
    final TodayKeywordDto dto = await _remoteDataSource.fetchTodayKeyword();
    final TodayKeyword todayKeyword = dto.toDomain();
    _cachedTodayKeyword = todayKeyword;
    return todayKeyword;
  }
}
