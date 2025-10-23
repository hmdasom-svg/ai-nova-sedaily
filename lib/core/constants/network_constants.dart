class NetworkConstants {
  const NetworkConstants._();
  static const int httpStatusOk = 200;
  static const String contentTypeJson = 'application/json';
  static const Map<String, String> defaultHeaders = <String, String>{
    'Accept': contentTypeJson,
  };
}
