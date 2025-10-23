import 'package:freezed_annotation/freezed_annotation.dart';
import '../../domain/model/news_chat_result.dart';
import 'news_chat_reference_dto.dart';

part 'news_chat_dto.freezed.dart';
part 'news_chat_dto.g.dart';

@freezed
abstract class NewsChatDto with _$NewsChatDto {
  const factory NewsChatDto({
    required String content,

    @JsonKey(fromJson: NewsChatDto._refsFromJson)
    @Default(<NewsChatReferenceDto>[])
    List<NewsChatReferenceDto> references,
  }) = _NewsChatDto;

  factory NewsChatDto.fromJson(Map<String, dynamic> json) =>
      _$NewsChatDtoFromJson(json);

  // ---- 정적 헬퍼: references 관대 파서 ----
  static List<NewsChatReferenceDto> _refsFromJson(dynamic raw) {
    if (raw is! List) return const <NewsChatReferenceDto>[];

    return raw
        .whereType<Map<String, dynamic>>()
        .map((e) => NewsChatReferenceDto.fromJson(Map<String, dynamic>.from(e)))
        .toList(growable: false);
  }
}

/// 도메인 변환 확장 (UI에서 참조 섹션 미표시)
extension NewsChatDtoX on NewsChatDto {
  NewsChatResult toDomain() {
    return NewsChatResult(
      content: content,
      references: references
          .map((dto) => dto.toDomain())
          .toList(growable: false),
    );
  }
}
