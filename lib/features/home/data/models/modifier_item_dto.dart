import 'package:json_annotation/json_annotation.dart';

part 'modifier_item_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class ModifierItemDto {
  ModifierItemDto({
    required this.id,
    required this.title,
    this.price,
    required this.minQuantity,
    required this.maxQuantity,
    this.picture,
    this.weight,
  });

  final int id;
  final String title;
  final int? price;
  final int? minQuantity;
  final int? maxQuantity;
  final String? picture;
  final String? weight;

  factory ModifierItemDto.fromJson(Map<String, dynamic> json) =>
      _$ModifierItemDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ModifierItemDtoToJson(this);
  }
}
