import 'package:monobox/features/order/data/models/basket_modifire_dto.dart';

import '../../../domain/entities/order_create_entity.dart';
import '../../../domain/entities/order_created_entity.dart';
import '../../models/order_create_request_dto.dart';
import '../../models/order_create_response_dto.dart';

class OrderMapper {
  static OrderCreateRequestDto toModel(
    OrderCreateEntity model,
  ) {
    return OrderCreateRequestDto(
      paymentId: model.paymentId,
      deliveryId: model.deliveryId,
      addressId: model.addressId,
      filialId: model.filialId,
      products: model.orderedPositions
          .map((orderedPosition) => OrderProductDto(
                id: orderedPosition.productId,
                quantity: orderedPosition.quantity,
                modifiers: orderedPosition.modifiers
                        ?.map((modifier) => BasketModifireDto(
                              id: modifier.id!,
                              qnt: modifier.quantity ?? 1,
                            ))
                        .toList() ??
                    [],
              ))
          .toList(),
      completeBefore: model.completeBefore,
      remoteDelivery: model.remoteDelivery,
      moneyChange: model.moneyChange,
      orderComment: model.comment,
      needCall: model.needCall,
      promocode: model.promocode,
      bonusWithdraw: model.bonusWithdraw,
      gifts: model.gifts
          ?.map((gift) => OrderProductDto(
                id: gift.productId,
                quantity: gift.quantity,
                modifiers: gift.modifiers
                        ?.map((modifier) => BasketModifireDto(
                              id: modifier.id!,
                              qnt: modifier.quantity ?? 1,
                            ))
                        .toList() ??
                    [],
              ))
          .toList(),
    );
  }

  static OrderCreatedEntity toEntity(
    OrderCreateResponseDto model,
  ) {
    return OrderCreatedEntity(
      id: model.id,
      status: model.status,
      paymentUrl: model.paymentUrl,
    );
  }
}
