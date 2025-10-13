import 'package:equatable/equatable.dart';

import '../../../home/domain/entities/option_entity.dart';

class OrderedPositionEntity extends Equatable {
  final int productId;
  final int quantity;
  final List<ProductOptionEntity>? modifiers;

  const OrderedPositionEntity({
    required this.productId,
    required this.quantity,
    this.modifiers,
  });

  @override
  List<Object?> get props => [
        productId,
        quantity,
        modifiers,
      ];
}
