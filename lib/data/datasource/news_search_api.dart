import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants/api_constants.dart';
import '../model/news_search_dto.dart';
import '../model/news_search_request_dto.dart';

part 'news_search_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class NewsSearchApi {
  factory NewsSearchApi(Dio dio, {String baseUrl}) = _NewsSearchApi;
  @POST(ApiConstants.newsSearchPath)
  Future<NewsSearchDto> fetchNews(@Body() NewsSearchRequestDto request);
}
