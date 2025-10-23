// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_flow_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IssueFlowRequestDto _$IssueFlowRequestDtoFromJson(Map<String, dynamic> json) =>
    IssueFlowRequestDto(
      keyword: json['keyword'] as String,
      interval: json['interval'] as String,
      offset: (json['offset'] as num).toInt(),
    );

Map<String, dynamic> _$IssueFlowRequestDtoToJson(
  IssueFlowRequestDto instance,
) => <String, dynamic>{
  'keyword': instance.keyword,
  'interval': instance.interval,
  'offset': instance.offset,
};
