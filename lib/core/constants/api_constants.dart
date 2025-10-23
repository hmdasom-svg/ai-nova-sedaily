class ApiConstants {
  const ApiConstants._();
  static const String baseUrl =
      'https://aoqwisszklfj4nwvsw2crjpcta0hgjcn.lambda-url.ap-northeast-2.on.aws';
  static const String todayKeywordPath = '/v1/todayKeyword';
  static const String issueMapPath = '/v1/issueMap';
  static const String newsSearchPath = '/v1/newsSearch';
  static const String newsChatPath = '/v1/newsChat';
  static const String issueFlowPath = '/v1/issueFlow';

  /// 빅카인즈 뉴스 상세 페이지 URL
  static const String bigKindsNewsDetailPath =
      'https://www.bigkinds.or.kr/v2/news/newsDetailView.do?newsId=';
}
