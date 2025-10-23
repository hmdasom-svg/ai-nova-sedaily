// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/model/keyword_entry.dart';

part 'keyword_entry_dto.freezed.dart';
part 'keyword_entry_dto.g.dart';

@freezed
abstract class KeywordEntryDto with _$KeywordEntryDto {
  const factory KeywordEntryDto({
    @JsonKey(name: 'keyword_name') required String keywordName,
    @JsonKey(name: 'mention_count') required int mentionCount,
    @JsonKey(name: 'named_entity_type')
    required NamedEntityType namedEntityType,
  }) = _KeywordEntryDto;
  factory KeywordEntryDto.fromJson(Map<String, dynamic> json) =>
      _$KeywordEntryDtoFromJson(json);
}

extension KeywordEntryDtoX on KeywordEntryDto {
  KeywordEntry toDomain() {
    return KeywordEntry(
      keywordName: keywordName,
      mentionCount: mentionCount,
      namedEntityType: namedEntityType,
    );
  }
}
