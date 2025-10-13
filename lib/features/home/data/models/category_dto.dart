import 'package:json_annotation/json_annotation.dart';
import 'package:monobox/features/home/data/models/product_dto.dart';

part 'category_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class CategoryDto {
  CategoryDto({
    required this.id,
    required this.title,
    required this.isCollection,
    this.picture,
    this.products,
    this.color,
  });
  final int id;
  final String title;
  final String? picture;
  final List<ProductDto>? products;
  final bool isCollection;
  final String? color;

  factory CategoryDto.fromJson(Map<String, dynamic> json) =>
      _$CategoryDtoFromJson(json);
}
