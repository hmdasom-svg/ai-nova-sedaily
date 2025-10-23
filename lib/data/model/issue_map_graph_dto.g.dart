// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_map_graph_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IssueMapGraphDto _$IssueMapGraphDtoFromJson(Map<String, dynamic> json) =>
    _IssueMapGraphDto(
      nodes: (json['nodes'] as List<dynamic>)
          .map((e) => IssueMapNodeDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      links: (json['links'] as List<dynamic>)
          .map((e) => IssueMapLinkDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      categories: (json['categories'] as List<dynamic>)
          .map((e) => IssueMapCategoryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$IssueMapGraphDtoToJson(_IssueMapGraphDto instance) =>
    <String, dynamic>{
      'nodes': instance.nodes,
      'links': instance.links,
      'categories': instance.categories,
    };

_IssueMapNodeDto _$IssueMapNodeDtoFromJson(Map<String, dynamic> json) =>
    _IssueMapNodeDto(
      id: json['id'] as String,
      name: json['name'] as String,
      value: (json['value'] as num).toInt(),
      symbolSize: IssueMapDtoConverter.toDouble(json['symbolSize']),
      categoryName: json['category'] as String,
    );

Map<String, dynamic> _$IssueMapNodeDtoToJson(_IssueMapNodeDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value': instance.value,
      'symbolSize': instance.symbolSize,
      'category': instance.categoryName,
    };

_IssueMapLinkDto _$IssueMapLinkDtoFromJson(Map<String, dynamic> json) =>
    _IssueMapLinkDto(
      source: json['source'] as String,
      target: json['target'] as String,
      lineStyle: IssueMapLinkStyleDto.fromJson(
        json['lineStyle'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$IssueMapLinkDtoToJson(_IssueMapLinkDto instance) =>
    <String, dynamic>{
      'source': instance.source,
      'target': instance.target,
      'lineStyle': instance.lineStyle,
    };

_IssueMapLinkStyleDto _$IssueMapLinkStyleDtoFromJson(
  Map<String, dynamic> json,
) => _IssueMapLinkStyleDto(width: IssueMapDtoConverter.toDouble(json['width']));

Map<String, dynamic> _$IssueMapLinkStyleDtoToJson(
  _IssueMapLinkStyleDto instance,
) => <String, dynamic>{'width': instance.width};

_IssueMapCategoryDto _$IssueMapCategoryDtoFromJson(Map<String, dynamic> json) =>
    _IssueMapCategoryDto(name: json['name'] as String);

Map<String, dynamic> _$IssueMapCategoryDtoToJson(
  _IssueMapCategoryDto instance,
) => <String, dynamic>{'name': instance.name};
