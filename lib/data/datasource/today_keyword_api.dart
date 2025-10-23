import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants/api_constants.dart';
import '../model/today_keyword_index_dto.dart';

part 'today_keyword_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class TodayKeywordApi {
  factory TodayKeywordApi(Dio dio, {String baseUrl}) = _TodayKeywordApi;
  @GET(ApiConstants.todayKeywordPath)
  Future<TodayKeywordIndexDto> fetchTodayKeywordIndex();
}
