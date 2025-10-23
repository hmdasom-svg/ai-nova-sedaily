import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../core/constants/api_constants.dart';
import '../model/news_chat_dto.dart';
import '../model/news_chat_request_dto.dart';

part 'news_chat_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class NewsChatApi {
  factory NewsChatApi(Dio dio, {String baseUrl}) = _NewsChatApi;
  @POST(ApiConstants.newsChatPath)
  Future<NewsChatDto> requestChat(@Body() NewsChatRequestDto request);
}
