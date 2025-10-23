import 'issue_map_category.dart';
import 'issue_map_link.dart';
import 'issue_map_node.dart';

class IssueMap {
  const IssueMap({
    required this.keyword,
    required this.nodes,
    required this.links,
    required this.categories,
    required this.summary,
  });
  final String keyword;
  final List<IssueMapNode> nodes;
  final List<IssueMapLink> links;
  final List<IssueMapCategory> categories;
  final String summary;
}
