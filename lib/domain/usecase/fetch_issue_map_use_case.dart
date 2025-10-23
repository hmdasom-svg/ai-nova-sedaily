import '../model/issue_map.dart';
import '../model/issue_map_request.dart';
import '../repository/issue_map_repository.dart';

class FetchIssueMapUseCase {
  const FetchIssueMapUseCase({required IssueMapRepository repository})
    : _repository = repository;
  final IssueMapRepository _repository;
  Future<IssueMap> execute(IssueMapRequest request) {
    return _repository.fetchIssueMap(request);
  }
}
