import '../model/issue_flow_request.dart';
import '../model/issue_flow_response.dart';

abstract class IssueFlowRepository {
  Future<IssueFlowResponse> fetchIssueFlow(IssueFlowRequest request);
}
