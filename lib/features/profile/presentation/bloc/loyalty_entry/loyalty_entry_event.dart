part of 'loyalty_entry_bloc.dart';

@freezed
class LoyaltyEntryEvent with _$LoyaltyEntryEvent {
  const factory LoyaltyEntryEvent.postLoyaltyRequest(
      LoyaltyEntryRequestEntity request) = _PostLoyaltyRequest;
}
