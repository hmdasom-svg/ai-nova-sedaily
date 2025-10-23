import 'package:json_annotation/json_annotation.dart';

part 'issue_flow_request_dto.g.dart';

@JsonSerializable()
class IssueFlowRequestDto {
  const IssueFlowRequestDto({
    required this.keyword,
    required this.interval,

    /// 페이지 번호 (0부터 시작, 0은 최신 데이터, 1은 이전 데이터, 2는 더 이전 데이터, 더이상 이전 데이터가 없으면 error 필드 반환)
    required this.offset,
  });

  final String keyword;
  final String interval;
  final int offset;

  Map<String, dynamic> toJson() => _$IssueFlowRequestDtoToJson(this);
}
