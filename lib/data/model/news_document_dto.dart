// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/news_document.dart';

part 'news_document_dto.freezed.dart';
part 'news_document_dto.g.dart';

@freezed
abstract class NewsDocumentDto with _$NewsDocumentDto {
  const factory NewsDocumentDto({
    @JsonKey(name: 'news_id') required String id,
    required String title,
    required String content,
    @JsonKey(fromJson: NewsDocumentDtoConverter.toDateTime)
    required DateTime dateline,
    @JsonKey(name: 'provider_link_page') required String providerLinkPage,
  }) = _NewsDocumentDto;
  factory NewsDocumentDto.fromJson(Map<String, dynamic> json) =>
      _$NewsDocumentDtoFromJson(json);
}

extension NewsDocumentDtoX on NewsDocumentDto {
  NewsDocument toDomain() {
    return NewsDocument(
      id: id,
      title: title,
      content: content,
      dateline: dateline,
      providerLinkPage: providerLinkPage,
    );
  }
}

class NewsDocumentDtoConverter {
  const NewsDocumentDtoConverter();
  static DateTime toDateTime(String value) {
    return DateTime.parse(value);
  }
}
