// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/today_keyword.dart';
import 'keyword_entry_dto.dart';

part 'today_keyword_dto.freezed.dart';
part 'today_keyword_dto.g.dart';

@freezed
abstract class TodayKeywordDto with _$TodayKeywordDto {
  const factory TodayKeywordDto({
    @JsonKey(name: 'search_date') required String searchDate,
    @JsonKey(name: 'keywords') required List<KeywordEntryDto> keywords,
  }) = _TodayKeywordDto;
  factory TodayKeywordDto.fromJson(Map<String, dynamic> json) =>
      _$TodayKeywordDtoFromJson(json);
}

extension TodayKeywordDtoX on TodayKeywordDto {
  TodayKeyword toDomain() {
    return TodayKeyword(
      searchDate: searchDate,
      keywords: keywords
          .map((KeywordEntryDto dto) => dto.toDomain())
          .toList(growable: false),
    );
  }
}
