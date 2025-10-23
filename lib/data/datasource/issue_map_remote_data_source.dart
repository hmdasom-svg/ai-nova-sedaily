import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

import '../model/issue_map_dto.dart';
import '../model/issue_map_graph_dto.dart';
import '../model/issue_map_index_dto.dart';
import '../model/issue_map_request_dto.dart';
import 'issue_map_api.dart';

class IssueMapRemoteDataSource {
  const IssueMapRemoteDataSource({required Dio dio, required IssueMapApi api})
    : _dio = dio,
      _api = api;
  final Dio _dio;
  final IssueMapApi _api;
  Future<IssueMapDto> fetchIssueMap({required String keyword}) async {
    try {
      final IssueMapRequestDto requestDto = IssueMapRequestDto(
        keyword: keyword,
      );
      final IssueMapIndexDto indexDto = await _api.fetchIssueMapIndex(
        requestDto,
      );
      final Response<dynamic> mapResponse = await _dio.get<dynamic>(
        indexDto.mapUrl,
        options: Options(responseType: ResponseType.json),
      );
      final Map<String, dynamic> mapJson = _ensureMapJson(mapResponse.data);
      final IssueMapGraphDto graphDto = IssueMapGraphDto.fromJson(mapJson);
      final Response<dynamic> summaryResponse = await _dio.get<dynamic>(
        indexDto.summaryUrl,
        options: Options(responseType: ResponseType.json),
      );
      final String summary = _parseSummary(summaryResponse.data);
      return IssueMapDto(graph: graphDto, summary: summary, keyword: keyword);
    } on DioException catch (exception) {
      throw (_mapDioError(exception));
    } on CheckedFromJsonException catch (exception) {
      throw (exception.message ?? 'Failed to parse response.');
    } on FormatException catch (exception) {
      throw (exception.message);
    } on TypeError catch (error) {
      throw (error.toString());
    }
  }

  Map<String, dynamic> _ensureMapJson(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data;
    }
    if (data is Map) {
      return Map<String, dynamic>.from(data as Map<dynamic, dynamic>);
    }
    throw const FormatException('Response body is not a JSON object.');
  }

  String _parseSummary(dynamic data) {
    if (data is String) {
      return data;
    }
    if (data is Map<String, dynamic>) {
      final Object? summaryValue = data['summary'];
      if (summaryValue is String) {
        return summaryValue;
      }
    }
    throw const FormatException('Summary response is not a string.');
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
