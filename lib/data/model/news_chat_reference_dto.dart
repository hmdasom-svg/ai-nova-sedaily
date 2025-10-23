// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/news_chat_reference.dart';

part 'news_chat_reference_dto.freezed.dart';
part 'news_chat_reference_dto.g.dart';

@freezed
abstract class NewsChatReferenceDto with _$NewsChatReferenceDto {
  const factory NewsChatReferenceDto({
    required String id,
    required NewsChatReferenceAttributesDto attributes,
  }) = _NewsChatReferenceDto;
  factory NewsChatReferenceDto.fromJson(Map<String, dynamic> json) =>
      _$NewsChatReferenceDtoFromJson(json);
}

@freezed
abstract class NewsChatReferenceAttributesDto
    with _$NewsChatReferenceAttributesDto {
  const factory NewsChatReferenceAttributesDto({
    @JsonKey(name: 'news_id') required String newsId,
    required String title,
    @JsonKey(name: 'published_at') required DateTime publishedAt,
    required String provider,
    String? byline,
  }) = _NewsChatReferenceAttributesDto;
  factory NewsChatReferenceAttributesDto.fromJson(Map<String, dynamic> json) =>
      _$NewsChatReferenceAttributesDtoFromJson(json);
}

extension NewsChatReferenceDtoX on NewsChatReferenceDto {
  NewsChatReference toDomain() {
    return NewsChatReference(
      id: id,
      newsId: attributes.newsId,
      title: attributes.title,
      publishedAt: attributes.publishedAt,
      provider: attributes.provider,
      byline: attributes.byline,
    );
  }
}
