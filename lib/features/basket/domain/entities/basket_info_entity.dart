import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monobox/features/home/domain/entities/product_entity.dart';
import 'basket_pretotal_info_entity.dart';
import 'basket_total_info_entity.dart';

part 'basket_info_entity.freezed.dart';

@freezed
class BasketInfoEntity with _$BasketInfoEntity {
  const factory BasketInfoEntity({
    required List<ProductEntity> products,
    required BasketTotalInfoEntity totalInfo,
    required List<BasketPretotalnfoEntity> pretotalInfo,
    required BasketPretotalnfoEntity bonusInfo,
    required List<String> warnings,
    String? timeDelay,
  }) = _BasketInfoEntity;
}
