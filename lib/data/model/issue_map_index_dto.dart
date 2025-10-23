// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'issue_map_index_dto.freezed.dart';
part 'issue_map_index_dto.g.dart';

@freezed
abstract class IssueMapIndexDto with _$IssueMapIndexDto {
  const factory IssueMapIndexDto({
    @JsonKey(name: 'mapURL') required String mapUrl,
    @JsonKey(name: 'summaryURL') required String summaryUrl,
  }) = _IssueMapIndexDto;
  factory IssueMapIndexDto.fromJson(Map<String, dynamic> json) =>
      _$IssueMapIndexDtoFromJson(json);
}
