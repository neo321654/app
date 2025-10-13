import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

import '../../../home/domain/entities/option_entity.dart';
import '../../../home/domain/entities/product_entity.dart';

class BasketOfferEntity extends Equatable {
  const BasketOfferEntity({
    required this.id,
    required this.product,
    this.quantity,
    this.addOptions,
    this.removeOptions,
  });

  final String id;
  final ProductEntity product;
  final int? quantity;
  final List<ProductOptionEntity>? addOptions;
  final List<ProductOptionEntity>? removeOptions;

  Decimal get productPrice {
    Decimal val = product.price;
    addOptions
        ?.map((e) => val = val + (e.price ?? Decimal.parse('0.0')))
        .toList();
    return val;
  }

  Map<String, dynamic> toJson() => {
        'id': product.id,
        'qnt': quantity,
        'modifiers':
            addOptions?.map((option) => option.toJson()).toList() ?? [],
      };

  BasketOfferEntity copyWith({
    String? id,
    ProductEntity? product,
    int? quantity,
    List<ProductOptionEntity>? addOptions,
    List<ProductOptionEntity>? removeOptions,
  }) {
    return BasketOfferEntity(
      id: id ?? this.id,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      addOptions: addOptions ?? this.addOptions,
      removeOptions: removeOptions ?? this.removeOptions,
    );
  }

  @override
  List<Object?> get props => [
        id,
        product,
        quantity,
        addOptions,
        removeOptions,
      ];
}
