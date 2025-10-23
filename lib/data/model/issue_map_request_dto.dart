import 'package:json_annotation/json_annotation.dart';

part 'issue_map_request_dto.g.dart';

@JsonSerializable()
class IssueMapRequestDto {
  const IssueMapRequestDto({required this.keyword});
  final String keyword;
  Map<String, dynamic> toJson() => _$IssueMapRequestDtoToJson(this);
}
