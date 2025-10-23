// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/issue_flow_response.dart';

part 'issue_flow_response_dto.freezed.dart';
part 'issue_flow_response_dto.g.dart';

@freezed
abstract class IssueFlowResponseDto with _$IssueFlowResponseDto {
  @JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
  const factory IssueFlowResponseDto({
    required String interval,
    @SafeIntConverter() required int totalHists,
    @Default(<IssueFlowTimeLineDto>[]) List<IssueFlowTimeLineDto> timeLine,
  }) = _IssueFlowResponseDto;

  factory IssueFlowResponseDto.fromJson(Map<String, dynamic> json) =>
      _$IssueFlowResponseDtoFromJson(json);
}

extension IssueFlowResponseDtoX on IssueFlowResponseDto {
  IssueFlowResponse toDomain() {
    return IssueFlowResponse(
      interval: interval,
      totalHists: totalHists,
      timeLine: timeLine
          .map(
            (IssueFlowTimeLineDto dto) =>
                IssueFlowTimeLine(label: dto.label, hits: dto.hits),
          )
          .toList(growable: false),
    );
  }
}

@freezed
abstract class IssueFlowTimeLineDto with _$IssueFlowTimeLineDto {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory IssueFlowTimeLineDto({
    @LabelConverter() required String label,
    @SafeIntConverter() required int hits,
  }) = _IssueFlowTimeLineDto;

  factory IssueFlowTimeLineDto.fromJson(Map<String, dynamic> json) =>
      _$IssueFlowTimeLineDtoFromJson(json);
}

class SafeIntConverter implements JsonConverter<int, Object?> {
  const SafeIntConverter();

  @override
  int fromJson(Object? json) {
    if (json is num) {
      return json.toInt();
    }
    if (json is String) {
      final int? parsedValue = int.tryParse(json);
      if (parsedValue != null) {
        return parsedValue;
      }
    }
    return 0;
  }

  @override
  Object toJson(int object) {
    return object;
  }
}

class LabelConverter implements JsonConverter<String, Object?> {
  const LabelConverter();

  @override
  String fromJson(Object? json) {
    if (json == null) {
      return '';
    }
    return json.toString();
  }

  @override
  Object toJson(String object) {
    return object;
  }
}
