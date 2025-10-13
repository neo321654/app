import 'package:json_annotation/json_annotation.dart';

import 'delivery_dto.dart';
import 'order_details_address_dto.dart';
import 'order_details_status_dto.dart';
import 'order_product_dto.dart';
import 'payment_method_dto.dart';

part 'order_details_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class OrderDetailsDto {
  OrderDetailsDto({
    required this.id,
    this.number,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    this.comment,
    required this.delivery,
    required this.payment,
    required this.products,
    required this.paymentStatus,
    required this.needReview,
    this.address,
    this.statuses = const [],
  });

  final int id;
  final int? number;
  final String status;
  final double totalPrice;
  final String createdAt;
  final String? comment;
  final DeliveryDto delivery;
  final PaymentMethodDto payment;
  final List<OrderProductDto> products;
  final bool paymentStatus;
  final bool needReview;
  final OrderDetailsAddressDto? address;
  @JsonKey(name: 'order_statuses')
  final List<OrderDetailsStatusDto> statuses;

  factory OrderDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsDtoFromJson(json);
}
