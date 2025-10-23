class NewsDocument {
  const NewsDocument({
    required this.id,
    required this.title,
    required this.content,
    required this.dateline,
    required this.providerLinkPage,
  });
  final String id;
  final String title;
  final String content;
  final DateTime dateline;
  final String providerLinkPage;
}
