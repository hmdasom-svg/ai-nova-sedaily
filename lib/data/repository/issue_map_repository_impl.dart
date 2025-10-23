import '../../domain/model/issue_map.dart';
import '../../domain/model/issue_map_request.dart';
import '../../domain/repository/issue_map_repository.dart';
import '../datasource/issue_map_remote_data_source.dart';
import '../model/issue_map_dto.dart';

class IssueMapRepositoryImpl implements IssueMapRepository {
  const IssueMapRepositoryImpl({
    required IssueMapRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;
  final IssueMapRemoteDataSource _remoteDataSource;
  @override
  Future<IssueMap> fetchIssueMap(IssueMapRequest request) async {
    final IssueMapDto dto = await _remoteDataSource.fetchIssueMap(
      keyword: request.keyword,
    );
    return dto.toDomain();
  }
}
