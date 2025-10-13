import 'package:json_annotation/json_annotation.dart';

part 'promocode_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class PromocodeDto {
  PromocodeDto({
    required this.code,
    this.message,
  });

  final String code;
  final String? message;

  factory PromocodeDto.fromJson(Map<String, dynamic> json) =>
      _$PromocodeDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$PromocodeDtoToJson(this);
  }
}
