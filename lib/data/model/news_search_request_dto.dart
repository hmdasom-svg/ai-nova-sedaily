import 'package:json_annotation/json_annotation.dart';

part 'news_search_request_dto.g.dart';

@JsonSerializable()
class NewsSearchRequestDto {
  const NewsSearchRequestDto({required this.keyword, required this.date});
  final String keyword;
  final String date;
  Map<String, dynamic> toJson() => _$NewsSearchRequestDtoToJson(this);
}
