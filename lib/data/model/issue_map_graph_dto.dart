// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'issue_map_graph_dto.freezed.dart';
part 'issue_map_graph_dto.g.dart';

@freezed
abstract class IssueMapGraphDto with _$IssueMapGraphDto {
  const factory IssueMapGraphDto({
    required List<IssueMapNodeDto> nodes,
    required List<IssueMapLinkDto> links,
    required List<IssueMapCategoryDto> categories,
  }) = _IssueMapGraphDto;
  factory IssueMapGraphDto.fromJson(Map<String, dynamic> json) =>
      _$IssueMapGraphDtoFromJson(json);
}

@freezed
abstract class IssueMapNodeDto with _$IssueMapNodeDto {
  const factory IssueMapNodeDto({
    required String id,
    required String name,
    required int value,
    @JsonKey(fromJson: IssueMapDtoConverter.toDouble)
    required double symbolSize,
    @JsonKey(name: 'category') required String categoryName,
  }) = _IssueMapNodeDto;
  factory IssueMapNodeDto.fromJson(Map<String, dynamic> json) =>
      _$IssueMapNodeDtoFromJson(json);
}

@freezed
abstract class IssueMapLinkDto with _$IssueMapLinkDto {
  const factory IssueMapLinkDto({
    required String source,
    required String target,
    @JsonKey(name: 'lineStyle') required IssueMapLinkStyleDto lineStyle,
  }) = _IssueMapLinkDto;
  factory IssueMapLinkDto.fromJson(Map<String, dynamic> json) =>
      _$IssueMapLinkDtoFromJson(json);
}

@freezed
abstract class IssueMapLinkStyleDto with _$IssueMapLinkStyleDto {
  const factory IssueMapLinkStyleDto({
    @JsonKey(fromJson: IssueMapDtoConverter.toDouble) required double width,
  }) = _IssueMapLinkStyleDto;
  factory IssueMapLinkStyleDto.fromJson(Map<String, dynamic> json) =>
      _$IssueMapLinkStyleDtoFromJson(json);
}

@freezed
abstract class IssueMapCategoryDto with _$IssueMapCategoryDto {
  const factory IssueMapCategoryDto({required String name}) =
      _IssueMapCategoryDto;
  factory IssueMapCategoryDto.fromJson(Map<String, dynamic> json) =>
      _$IssueMapCategoryDtoFromJson(json);
}

class IssueMapDtoConverter {
  const IssueMapDtoConverter();
  static double toDouble(Object? value) {
    if (value is num) {
      return value.toDouble();
    }
    if (value is String) {
      return double.parse(value);
    }
    throw const FormatException('Failed to convert value to double.');
  }
}
