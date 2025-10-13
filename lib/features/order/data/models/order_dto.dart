import 'package:json_annotation/json_annotation.dart';

import 'order_product_dto.dart';

part 'order_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class OrderDto {
  OrderDto({
    required this.id,
    this.number,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    required this.needReview,
    required this.products,
  });

  final int id;
  @JsonKey(fromJson: _numberFromJson)
  final String? number;
  final String status;
  final double totalPrice;
  final String createdAt;
  final bool needReview;
  final List<OrderProductDto> products;

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);
}

String? _numberFromJson(dynamic value) {
  if (value is int) {
    return value.toString();
  } else if (value is String) {
    return value;
  }
  return null;
}
