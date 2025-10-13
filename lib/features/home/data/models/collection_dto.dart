import 'package:json_annotation/json_annotation.dart';

import 'product_dto.dart';

part 'collection_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class CollectionDto {
  CollectionDto({
    required this.id,
    required this.name,
    required this.picture,
    this.products,
    this.isCollection = true,
    this.color,
  });
  final int id;
  @JsonKey(name: 'title')
  final String name;
  final String picture;
  final List<ProductDto>? products;
  final bool isCollection;
  final String? color;

  factory CollectionDto.fromJson(Map<String, dynamic> json) =>
      _$CollectionDtoFromJson(json);
}
