import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:flutter/foundation.dart';
import '../constants/network_constants.dart';

class AppDioFactory {
  const AppDioFactory();
  Dio create() {
    final BaseOptions options = BaseOptions(
      headers: NetworkConstants.defaultHeaders,
      responseType: ResponseType.json,
    );
    final Dio dio = Dio(options);
    if (kDebugMode) {
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
    }
    return dio;
  }
}
