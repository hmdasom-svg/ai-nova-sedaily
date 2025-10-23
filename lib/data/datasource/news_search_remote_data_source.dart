import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

import '../model/news_search_dto.dart';
import '../model/news_search_request_dto.dart';
import 'news_search_api.dart';

class NewsSearchRemoteDataSource {
  const NewsSearchRemoteDataSource({required NewsSearchApi api}) : _api = api;
  final NewsSearchApi _api;
  Future<NewsSearchDto> fetchNews({
    required String keyword,
    required String date,
  }) async {
    try {
      final NewsSearchRequestDto requestDto = NewsSearchRequestDto(
        keyword: keyword,
        date: date,
      );
      final NewsSearchDto dto = await _api.fetchNews(requestDto);
      return dto;
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
