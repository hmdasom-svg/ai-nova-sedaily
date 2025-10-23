// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/news_search_result.dart';
import 'news_document_dto.dart';

part 'news_search_dto.freezed.dart';
part 'news_search_dto.g.dart';

@freezed
abstract class NewsSearchDto with _$NewsSearchDto {
  const factory NewsSearchDto({
    @JsonKey(name: 'total_hits') @Default(0) int totalHits,
    @Default([]) List<NewsDocumentDto> documents,
  }) = _NewsSearchDto;
  factory NewsSearchDto.fromJson(Map<String, dynamic> json) =>
      _$NewsSearchDtoFromJson(json);
}

extension NewsSearchDtoX on NewsSearchDto {
  NewsSearchResult toDomain() {
    return NewsSearchResult(
      totalHits: totalHits,
      documents: documents
          .map((NewsDocumentDto dto) => dto.toDomain())
          .toList(growable: false),
    );
  }
}
