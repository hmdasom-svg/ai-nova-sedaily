// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_search_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsSearchRequestDto _$NewsSearchRequestDtoFromJson(
  Map<String, dynamic> json,
) => NewsSearchRequestDto(
  keyword: json['keyword'] as String,
  date: json['date'] as String,
);

Map<String, dynamic> _$NewsSearchRequestDtoToJson(
  NewsSearchRequestDto instance,
) => <String, dynamic>{'keyword': instance.keyword, 'date': instance.date};
