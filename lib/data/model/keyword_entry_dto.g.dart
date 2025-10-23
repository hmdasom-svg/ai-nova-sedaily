// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'keyword_entry_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_KeywordEntryDto _$KeywordEntryDtoFromJson(Map<String, dynamic> json) =>
    _KeywordEntryDto(
      keywordName: json['keyword_name'] as String,
      mentionCount: (json['mention_count'] as num).toInt(),
      namedEntityType: json['named_entity_type'] as String,
    );

Map<String, dynamic> _$KeywordEntryDtoToJson(_KeywordEntryDto instance) =>
    <String, dynamic>{
      'keyword_name': instance.keywordName,
      'mention_count': instance.mentionCount,
      'named_entity_type': instance.namedEntityType,
    };
