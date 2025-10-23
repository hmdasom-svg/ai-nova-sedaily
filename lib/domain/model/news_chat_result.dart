import 'news_chat_reference.dart';

class NewsChatResult {
  const NewsChatResult({required this.content, required this.references});
  final String content;
  final List<NewsChatReference> references;
}
