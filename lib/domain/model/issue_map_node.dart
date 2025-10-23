class IssueMapNode {
  const IssueMapNode({
    required this.id,
    required this.name,
    required this.value,
    required this.symbolSize,
    required this.categoryName,
  });
  final String id;
  final String name;
  final int value;
  final double symbolSize;
  final String categoryName;
}
