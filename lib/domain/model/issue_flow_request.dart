class IssueFlowRequest {
  const IssueFlowRequest({
    required this.keyword,
    required this.interval,
    required this.offset,
  });

  /// 키워드
  final String keyword;
  /// 기간
  final String interval;
  /// 페이지
  final int offset;
}
