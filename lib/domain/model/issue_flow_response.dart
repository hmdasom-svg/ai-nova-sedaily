class IssueFlowResponse {
  const IssueFlowResponse({
    required this.interval,
    required this.totalHists,
    required this.timeLine,
  });

  final String interval;
  final int totalHists;
  final List<IssueFlowTimeLine> timeLine;
}

class IssueFlowTimeLine {
  const IssueFlowTimeLine({
    required this.label,
    required this.hits,
  });

  final String label;
  final int hits;
}
