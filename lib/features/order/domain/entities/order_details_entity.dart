import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

import 'delivery_entity.dart';
import 'order_details_address_entity.dart';
import 'order_details_status_entity.dart';
import 'order_product_entity.dart';
import 'payment_method_entity.dart';

class OrderDetailsEntity extends Equatable {
  const OrderDetailsEntity({
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
    this.cancelled,
  });

  final int id;
  final String? number;
  final String status;
  final Decimal totalPrice;
  final DateTime createdAt;
  final String? comment;
  final DeliveryEntity delivery;
  final PaymentMethodEntity payment;
  final List<OrderProductEntity> products;
  final bool paymentStatus;
  final bool needReview;
  final OrderDetailsAddressEntity? address;
  final List<OrderDetailsStatusEntity> statuses;
  final bool? cancelled;

  @override
  List<Object?> get props => [
        id,
        number,
        status,
        totalPrice,
        createdAt,
        comment,
        delivery,
        payment,
        products,
        paymentStatus,
        address,
        cancelled,
      ];

  OrderDetailsEntity copyWith({
    int? id,
    String? number,
    String? status,
    Decimal? totalPrice,
    DateTime? createdAt,
    String? comment,
    DeliveryEntity? delivery,
    PaymentMethodEntity? payment,
    List<OrderProductEntity>? products,
    bool? paymentStatus,
    bool? needReview,
    OrderDetailsAddressEntity? address,
    List<OrderDetailsStatusEntity>? statuses,
    bool? cancelled,
  }) {
    return OrderDetailsEntity(
      id: id ?? this.id,
      number: number ?? this.number,
      status: status ?? this.status,
      totalPrice: totalPrice ?? this.totalPrice,
      createdAt: createdAt ?? this.createdAt,
      comment: comment ?? this.comment,
      delivery: delivery ?? this.delivery,
      payment: payment ?? this.payment,
      products: products ?? this.products,
      paymentStatus: paymentStatus ?? this.paymentStatus,
      needReview: needReview ?? this.needReview,
      address: address ?? this.address,
      statuses: statuses ?? this.statuses,
      cancelled: cancelled ?? this.cancelled,
    );
  }
}
