part of 'geo_available_bloc.dart';

@freezed
class GeoAvailableState with _$GeoAvailableState {
  const factory GeoAvailableState.initial() = Initial;
  const factory GeoAvailableState.loading() = Loading;
  const factory GeoAvailableState.success(GeoAvailableEntity geoAvailable) =
      Success;
  const factory GeoAvailableState.error(String message) = ErrorState;
}
