import 'package:json_annotation/json_annotation.dart';

part 'geo_suggestion_request_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class GeoSuggestionRequestDto {
  GeoSuggestionRequestDto({
    required this.search,
    required this.city,
  });

  final String search;
  final String city;

  factory GeoSuggestionRequestDto.fromJson(Map<String, dynamic> json) =>
      _$GeoSuggestionRequestDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$GeoSuggestionRequestDtoToJson(this);
  }
}
