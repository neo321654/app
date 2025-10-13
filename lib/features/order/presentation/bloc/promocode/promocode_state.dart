part of 'promocode_bloc.dart';

@freezed
class PromocodeState with _$PromocodeState {
  const factory PromocodeState.initial() = _Initial;
  const factory PromocodeState.loading() = _Loading;
  const factory PromocodeState.success(PromocodeEntity promocodeInfo) =
      _Success;
  const factory PromocodeState.error(StateError error) = _Error;
}
