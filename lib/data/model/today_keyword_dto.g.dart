// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'today_keyword_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodayKeywordDto _$TodayKeywordDtoFromJson(Map<String, dynamic> json) =>
    _TodayKeywordDto(
      searchDate: json['search_date'] as String,
      keywords: (json['keywords'] as List<dynamic>)
          .map((e) => KeywordEntryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TodayKeywordDtoToJson(_TodayKeywordDto instance) =>
    <String, dynamic>{
      'search_date': instance.searchDate,
      'keywords': instance.keywords,
    };
