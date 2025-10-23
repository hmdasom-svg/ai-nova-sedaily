// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_document_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NewsDocumentDto _$NewsDocumentDtoFromJson(Map<String, dynamic> json) =>
    _NewsDocumentDto(
      id: json['news_id'] as String,
      title: json['title'] as String,
      content: json['content'] as String,
      dateline: NewsDocumentDtoConverter.toDateTime(json['dateline'] as String),
      providerLinkPage: json['provider_link_page'] as String,
    );

Map<String, dynamic> _$NewsDocumentDtoToJson(_NewsDocumentDto instance) =>
    <String, dynamic>{
      'news_id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'dateline': instance.dateline.toIso8601String(),
      'provider_link_page': instance.providerLinkPage,
    };
