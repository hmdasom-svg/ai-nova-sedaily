import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../domain/exception/no_more_issue_flow_data_exception.dart';
import '../model/issue_flow_request_dto.dart';
import '../model/issue_flow_response_dto.dart';
import 'issue_flow_api.dart';

class IssueFlowRemoteDataSource {
  const IssueFlowRemoteDataSource({required IssueFlowApi api}) : _api = api;

  final IssueFlowApi _api;

  Future<IssueFlowResponseDto> fetchIssueFlow(
    IssueFlowRequestDto request,
  ) async {
    try {
      final IssueFlowResponseDto response = await _api.fetchIssueFlow(request);
      return response;
    } on DioException catch (exception) {
      ///마지막 페이지 구분하기 위해 500 에러 처리
      if (exception.response?.statusCode == 500) {
        throw const NoMoreIssueFlowDataException();
      }
      throw _mapDioError(exception);
    } on CheckedFromJsonException catch (exception) {
      throw exception.message ?? 'Failed to parse response.';
    } on TypeError catch (error) {
      throw error.toString();
    }
  }

  String _mapDioError(DioException exception) {
    if (exception.type == DioExceptionType.connectionTimeout) {
      return 'Connection timeout. Please retry.';
    }
    if (exception.type == DioExceptionType.receiveTimeout) {
      return 'Receive timeout. Please retry.';
    }
    if (exception.type == DioExceptionType.sendTimeout) {
      return 'Send timeout. Please retry.';
    }
    final Response<dynamic>? response = exception.response;
    final int? statusCode = response?.statusCode;
    if (statusCode != null) {
      return 'Request failed with status $statusCode.';
    }
    return 'Network error occurred.';
  }
}
