import '../model/news_chat_request.dart';
import '../model/news_chat_result.dart';
import '../repository/news_chat_repository.dart';

class RequestNewsChatUseCase {
  const RequestNewsChatUseCase({required NewsChatRepository repository})
    : _repository = repository;
  final NewsChatRepository _repository;
  Future<NewsChatResult> execute(NewsChatRequest request) {
    return _repository.requestChat(request);
  }
}
