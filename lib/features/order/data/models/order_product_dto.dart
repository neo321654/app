import 'package:json_annotation/json_annotation.dart';

part 'order_product_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class OrderProductDto {
  OrderProductDto({
    required this.id,
    required this.qnt,
    required this.title,
    required this.image,
    required this.price,
    required this.total,
    this.isCombo = false,
    this.isHalfPizza = false,
  });

  final int id;
  final int qnt;
  final String title;
  final String? image;
  final double price;
  final double total;
  final bool isCombo;
  final bool isHalfPizza;

  factory OrderProductDto.fromJson(Map<String, dynamic> json) =>
      _$OrderProductDtoFromJson(json);
}
