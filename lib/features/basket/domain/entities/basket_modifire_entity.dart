import 'package:freezed_annotation/freezed_annotation.dart';

part 'basket_modifire_entity.freezed.dart';

@freezed
class BasketModifireEntity with _$BasketModifireEntity {
  const factory BasketModifireEntity({
    required int id,
    required int qnt,
  }) = _BasketModifireEntity;
}
