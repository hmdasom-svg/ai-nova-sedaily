import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../model/today_keyword_dto.dart';

part 'today_keyword_detail_api.g.dart';

@RestApi()
abstract class TodayKeywordDetailApi {
  factory TodayKeywordDetailApi(Dio dio, {String baseUrl}) =
      _TodayKeywordDetailApi;
  @GET('')
  Future<TodayKeywordDto> fetchTodayKeyword();
}
