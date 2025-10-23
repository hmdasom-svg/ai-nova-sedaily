import '../../domain/model/issue_flow_request.dart';
import '../../domain/model/issue_flow_response.dart';
import '../../domain/repository/issue_flow_repository.dart';
import '../datasource/issue_flow_remote_data_source.dart';
import '../model/issue_flow_request_dto.dart';
import '../model/issue_flow_response_dto.dart';

class IssueFlowRepositoryImpl implements IssueFlowRepository {
  const IssueFlowRepositoryImpl({
    required IssueFlowRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  final IssueFlowRemoteDataSource _remoteDataSource;

  @override
  Future<IssueFlowResponse> fetchIssueFlow(IssueFlowRequest request) async {
    final IssueFlowRequestDto requestDto = IssueFlowRequestDto(
      keyword: request.keyword,
      interval: request.interval,
      offset: request.offset,
    );

    final IssueFlowResponseDto responseDto = await _remoteDataSource
        .fetchIssueFlow(requestDto);
    return responseDto.toDomain();
  }
}
