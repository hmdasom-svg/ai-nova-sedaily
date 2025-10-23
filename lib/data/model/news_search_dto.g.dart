// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_search_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsSearchDto _$NewsSearchDtoFromJson(Map<String, dynamic> json) =>
    _NewsSearchDto(
      totalHits: (json['total_hits'] as num?)?.toInt() ?? 0,
      documents:
          (json['documents'] as List<dynamic>?)
              ?.map((e) => NewsDocumentDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$NewsSearchDtoToJson(_NewsSearchDto instance) =>
    <String, dynamic>{
      'total_hits': instance.totalHits,
      'documents': instance.documents,
    };
