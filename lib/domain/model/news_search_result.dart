import 'news_document.dart';

class NewsSearchResult {
  const NewsSearchResult({required this.totalHits, required this.documents});
  final int totalHits;
  final List<NewsDocument> documents;
}
