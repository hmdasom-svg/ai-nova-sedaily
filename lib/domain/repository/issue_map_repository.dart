import '../model/issue_map.dart';
import '../model/issue_map_request.dart';

abstract class IssueMapRepository {
  Future<IssueMap> fetchIssueMap(IssueMapRequest request);
}
