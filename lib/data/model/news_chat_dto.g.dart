// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_chat_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsChatDto _$NewsChatDtoFromJson(Map<String, dynamic> json) => _NewsChatDto(
  content: json['content'] as String,
  references: json['references'] == null
      ? const <NewsChatReferenceDto>[]
      : NewsChatDto._refsFromJson(json['references']),
);

Map<String, dynamic> _$NewsChatDtoToJson(_NewsChatDto instance) =>
    <String, dynamic>{
      'content': instance.content,
      'references': instance.references,
    };
