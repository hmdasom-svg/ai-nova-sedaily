import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';

import '../model/news_chat_dto.dart';
import '../model/news_chat_request_dto.dart';
import 'news_chat_api.dart';

class NewsChatRemoteDataSource {
  const NewsChatRemoteDataSource({required NewsChatApi api}) : _api = api;
  final NewsChatApi _api;
  Future<NewsChatDto> requestChat({required String content}) async {
    try {
      final NewsChatRequestDto requestDto = NewsChatRequestDto(
        content: content,
      );
      final NewsChatDto dto = await _api.requestChat(requestDto);
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
