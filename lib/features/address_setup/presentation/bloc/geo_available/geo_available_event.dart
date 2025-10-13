part of 'geo_available_bloc.dart';

@freezed
class GeoAvailableEvent with _$GeoAvailableEvent {
  const factory GeoAvailableEvent.getAvailable(double lat, double lon) =
      _GetAvailable;
}
