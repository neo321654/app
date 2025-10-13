part of 'basket_info_bloc.dart';

@freezed
class BasketInfoState with _$BasketInfoState {
  const factory BasketInfoState.initial() = _Initial;
  const factory BasketInfoState.loading() = _Loading;
  const factory BasketInfoState.success(BasketInfoEntity basketInfo) = _Success;
  const factory BasketInfoState.error(
    String message,
  ) = _Error;
}
