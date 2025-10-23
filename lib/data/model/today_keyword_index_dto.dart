// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'today_keyword_index_dto.freezed.dart';
part 'today_keyword_index_dto.g.dart';

@freezed
abstract class TodayKeywordIndexDto with _$TodayKeywordIndexDto {
  const factory TodayKeywordIndexDto({
    @JsonKey(name: 'keywordURL') required String keywordUrl,
  }) = _TodayKeywordIndexDto;
  factory TodayKeywordIndexDto.fromJson(Map<String, dynamic> json) =>
      _$TodayKeywordIndexDtoFromJson(json);
}
