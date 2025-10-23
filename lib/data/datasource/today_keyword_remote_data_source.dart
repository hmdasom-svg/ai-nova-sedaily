import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

import '../model/today_keyword_dto.dart';
import '../model/today_keyword_index_dto.dart';
import 'today_keyword_api.dart';
import 'today_keyword_detail_api.dart';

class TodayKeywordRemoteDataSource {
  const TodayKeywordRemoteDataSource({
    required Dio dio,
    required TodayKeywordApi api,
  }) : _dio = dio,
       _api = api;
  final Dio _dio;
  final TodayKeywordApi _api;
  Future<TodayKeywordDto> fetchTodayKeyword() async {
    try {
      final TodayKeywordIndexDto indexDto = await _api.fetchTodayKeywordIndex();
      final TodayKeywordDetailApi detailApi = TodayKeywordDetailApi(
        _dio,
        baseUrl: indexDto.keywordUrl,
      );
      final TodayKeywordDto dto = await detailApi.fetchTodayKeyword();
      return dto;
    } on DioException catch (exception) {
      throw (_mapDioError(exception));
    } on CheckedFromJsonException catch (exception) {
      throw (exception.message ?? 'Failed to parse response.');
    } on TypeError catch (error) {
      throw (error.toString());
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
