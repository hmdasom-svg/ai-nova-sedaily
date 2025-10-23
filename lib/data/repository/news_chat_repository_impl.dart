import '../../domain/model/news_chat_request.dart';
import '../../domain/model/news_chat_result.dart';
import '../../domain/repository/news_chat_repository.dart';
import '../datasource/news_chat_remote_data_source.dart';
import '../model/news_chat_dto.dart';

class NewsChatRepositoryImpl implements NewsChatRepository {
  const NewsChatRepositoryImpl({
    required NewsChatRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;
  final NewsChatRemoteDataSource _remoteDataSource;
  @override
  Future<NewsChatResult> requestChat(NewsChatRequest request) async {
    final NewsChatDto dto = await _remoteDataSource.requestChat(
      content: request.content,
    );
    return dto.toDomain();
  }
}
