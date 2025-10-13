import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import 'kbzhu_dto.dart';
import 'modifier_dto.dart';
import 'tag_dto.dart';

part 'product_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
@HiveType(typeId: 4)
class ProductDto {
  ProductDto({
    required this.id,
    required this.name,
    this.picture,
    this.description,
    this.price,
    this.tags = const [],
    this.modifiers = const [],
    this.kbzhu = const [],
    this.weight,
    this.weightText,
    this.isCombo = false,
    this.isHalfPizza = false,
  });
  @HiveField(0)
  final int id;

  @JsonKey(name: 'title')
  @HiveField(1)
  final String name;

  @JsonKey(name: 'image')
  @HiveField(2)
  final String? picture;

  @HiveField(3)
  final String? description;

  @HiveField(4)
  final int? price;

  final List<TagDto> tags;

  final List<ModifierDto> modifiers;

  final List<KbzhuDto> kbzhu;

  final int? weight;

  final String? weightText;

  final bool isCombo;

  final bool isHalfPizza;

  factory ProductDto.fromJson(Map<String, dynamic> json) =>
      _$ProductDtoFromJson(json);

  Map<String, dynamic> toJson() {
    return _$ProductDtoToJson(this);
  }
}
