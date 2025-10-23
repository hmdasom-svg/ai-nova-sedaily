class IssueMapLinkStyle {
  const IssueMapLinkStyle({required this.width});
  final double width;
}

class IssueMapLink {
  const IssueMapLink({
    required this.sourceId,
    required this.targetId,
    required this.style,
  });
  final String sourceId;
  final String targetId;
  final IssueMapLinkStyle style;
}
