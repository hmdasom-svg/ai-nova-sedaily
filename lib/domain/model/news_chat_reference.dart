class NewsChatReference {
  const NewsChatReference({
    required this.id,
    required this.newsId,
    required this.title,
    required this.publishedAt,
    required this.provider,
    this.byline,
  });
  final String id;
  final String newsId;
  final String title;
  final DateTime publishedAt;
  final String provider;
  final String? byline;
}
