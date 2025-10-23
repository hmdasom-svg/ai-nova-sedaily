// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_chat_reference_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsChatReferenceDto _$NewsChatReferenceDtoFromJson(
  Map<String, dynamic> json,
) => _NewsChatReferenceDto(
  id: json['id'] as String,
  attributes: NewsChatReferenceAttributesDto.fromJson(
    json['attributes'] as Map<String, dynamic>,
  ),
);

Map<String, dynamic> _$NewsChatReferenceDtoToJson(
  _NewsChatReferenceDto instance,
) => <String, dynamic>{'id': instance.id, 'attributes': instance.attributes};

_NewsChatReferenceAttributesDto _$NewsChatReferenceAttributesDtoFromJson(
  Map<String, dynamic> json,
) => _NewsChatReferenceAttributesDto(
  newsId: json['news_id'] as String,
  title: json['title'] as String,
  publishedAt: DateTime.parse(json['published_at'] as String),
  provider: json['provider'] as String,
  byline: json['byline'] as String?,
);

Map<String, dynamic> _$NewsChatReferenceAttributesDtoToJson(
  _NewsChatReferenceAttributesDto instance,
) => <String, dynamic>{
  'news_id': instance.newsId,
  'title': instance.title,
  'published_at': instance.publishedAt.toIso8601String(),
  'provider': instance.provider,
  'byline': instance.byline,
};
