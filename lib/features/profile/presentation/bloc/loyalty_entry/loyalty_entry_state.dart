part of 'loyalty_entry_bloc.dart';

@freezed
class LoyaltyEntryState with _$LoyaltyEntryState {
  const factory LoyaltyEntryState.initial() = _Initial;
  const factory LoyaltyEntryState.saving() = _Saving;
  const factory LoyaltyEntryState.success(LoyaltyEntryResponseEntity response) =
      _Success;
  const factory LoyaltyEntryState.error(Error error) = _Error;
}
