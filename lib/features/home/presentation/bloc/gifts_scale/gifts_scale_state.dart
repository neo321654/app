part of 'gifts_scale_bloc.dart';

@freezed
class GiftsScaleState with _$GiftsScaleState {
  const factory GiftsScaleState.initial() = _Initial;
  const factory GiftsScaleState.loading() = _Loading;
  const factory GiftsScaleState.success(List<GiftsScaleEntity> giftsScale) =
      _Success;
  const factory GiftsScaleState.error(String message) = _Error;
}
