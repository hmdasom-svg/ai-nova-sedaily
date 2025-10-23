import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants/api_constants.dart';
import '../model/issue_map_index_dto.dart';
import '../model/issue_map_request_dto.dart';

part 'issue_map_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class IssueMapApi {
  factory IssueMapApi(Dio dio, {String baseUrl}) = _IssueMapApi;
  @POST(ApiConstants.issueMapPath)
  Future<IssueMapIndexDto> fetchIssueMapIndex(
    @Body() IssueMapRequestDto request,
  );
}
