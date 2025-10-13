import 'package:json_annotation/json_annotation.dart';

part 'banner_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class BannerDto {
  BannerDto({
    required this.id,
    required this.picture,
    required this.title,
    this.url,
  });

  final int id;
  final String title;
  @JsonKey(name: 'image')
  final String picture;
  @JsonKey(name: 'link')
  final String? url;

  factory BannerDto.fromJson(Map<String, dynamic> json) =>
      _$BannerDtoFromJson(json);
}
