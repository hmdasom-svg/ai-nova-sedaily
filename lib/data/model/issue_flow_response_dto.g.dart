// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'issue_flow_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IssueFlowResponseDto _$IssueFlowResponseDtoFromJson(
  Map<String, dynamic> json,
) => _IssueFlowResponseDto(
  interval: json['interval'] as String,
  totalHists: const SafeIntConverter().fromJson(json['total_hists']),
  timeLine:
      (json['time_line'] as List<dynamic>?)
          ?.map((e) => IssueFlowTimeLineDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <IssueFlowTimeLineDto>[],
);

Map<String, dynamic> _$IssueFlowResponseDtoToJson(
  _IssueFlowResponseDto instance,
) => <String, dynamic>{
  'interval': instance.interval,
  'total_hists': const SafeIntConverter().toJson(instance.totalHists),
  'time_line': instance.timeLine.map((e) => e.toJson()).toList(),
};

_IssueFlowTimeLineDto _$IssueFlowTimeLineDtoFromJson(
  Map<String, dynamic> json,
) => _IssueFlowTimeLineDto(
  label: const LabelConverter().fromJson(json['label']),
  hits: const SafeIntConverter().fromJson(json['hits']),
);

Map<String, dynamic> _$IssueFlowTimeLineDtoToJson(
  _IssueFlowTimeLineDto instance,
) => <String, dynamic>{
  'label': const LabelConverter().toJson(instance.label),
  'hits': const SafeIntConverter().toJson(instance.hits),
};
