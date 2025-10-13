import 'package:json_annotation/json_annotation.dart';

import 'modifier_item_dto.dart';

part 'modifier_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class ModifierDto {
  ModifierDto({
    required this.id,
    required this.title,
    this.type,
    this.items = const [],
    required this.minQuantity,
    required this.maxQuantity,
    this.weight,
    this.isHalfPizza = false,
  });

  final int id;
  final String title;
  final String? type;
  final List<ModifierItemDto> items;
  final int? minQuantity;
  final int? maxQuantity;
  final int? weight;
  final bool isHalfPizza;

  factory ModifierDto.fromJson(Map<String, dynamic> json) =>
      _$ModifierDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ModifierDtoToJson(this);
  }
}
