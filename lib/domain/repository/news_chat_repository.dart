import '../model/news_chat_request.dart';
import '../model/news_chat_result.dart';

abstract class NewsChatRepository {
  Future<NewsChatResult> requestChat(NewsChatRequest request);
}
