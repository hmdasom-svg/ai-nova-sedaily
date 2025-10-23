import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/issue_map.dart';
import '../../domain/model/issue_map_category.dart';
import '../../domain/model/issue_map_link.dart';
import '../../domain/model/issue_map_node.dart';
import 'issue_map_graph_dto.dart';

part 'issue_map_dto.freezed.dart';

@freezed
abstract class IssueMapDto with _$IssueMapDto {
  const factory IssueMapDto({
    required IssueMapGraphDto graph,
    required String summary,
    required String keyword,
  }) = _IssueMapDto;
}

extension IssueMapDtoX on IssueMapDto {
  IssueMap toDomain() {
    return IssueMap(
      keyword: keyword,
      nodes: graph.nodes
          .map(
            (IssueMapNodeDto node) => IssueMapNode(
              id: node.id,
              name: node.name,
              value: node.value,
              symbolSize: node.symbolSize,
              categoryName: node.categoryName,
            ),
          )
          .toList(growable: false),
      links: graph.links
          .map(
            (IssueMapLinkDto link) => IssueMapLink(
              sourceId: link.source,
              targetId: link.target,
              style: IssueMapLinkStyle(width: link.lineStyle.width),
            ),
          )
          .toList(growable: false),
      categories: graph.categories
          .map(
            (IssueMapCategoryDto category) =>
                IssueMapCategory(name: category.name),
          )
          .toList(growable: false),
      summary: summary,
    );
  }
}
