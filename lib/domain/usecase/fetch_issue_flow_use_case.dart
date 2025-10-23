import '../model/issue_flow_request.dart';
import '../model/issue_flow_response.dart';
import '../repository/issue_flow_repository.dart';

class FetchIssueFlowUseCase {
  const FetchIssueFlowUseCase({
    required IssueFlowRepository repository,
  }) : _repository = repository;

  final IssueFlowRepository _repository;

  Future<IssueFlowResponse> execute(IssueFlowRequest request) {
    return _repository.fetchIssueFlow(request);
  }
}
