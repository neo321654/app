part of 'upsales_bloc.dart';

@freezed
class UpsalesEvent with _$UpsalesEvent {
  const factory UpsalesEvent.getUpsales(UpsaleRequestEntity request) =
      _GetUpsales;
}
