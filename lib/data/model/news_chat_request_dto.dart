import 'package:json_annotation/json_annotation.dart';

part 'news_chat_request_dto.g.dart';

@JsonSerializable()
class NewsChatRequestDto {
  const NewsChatRequestDto({required this.content});
  final String content;
  Map<String, dynamic> toJson() => _$NewsChatRequestDtoToJson(this);
}
