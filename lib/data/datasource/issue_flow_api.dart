import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants/api_constants.dart';
import '../model/issue_flow_request_dto.dart';
import '../model/issue_flow_response_dto.dart';

part 'issue_flow_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class IssueFlowApi {
  factory IssueFlowApi(Dio dio, {String baseUrl}) = _IssueFlowApi;

  @POST(ApiConstants.issueFlowPath)
  Future<IssueFlowResponseDto> fetchIssueFlow(
    @Body() IssueFlowRequestDto request,
  );
}
