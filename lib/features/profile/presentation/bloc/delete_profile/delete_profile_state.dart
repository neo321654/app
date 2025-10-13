part of 'delete_profile_bloc.dart';

@freezed
class DeleteProfileState with _$DeleteProfileState {
  const factory DeleteProfileState.initial() = _Initial;
  const factory DeleteProfileState.deleting() = _Deleting;
  const factory DeleteProfileState.success(DeleteProfileEntity status) =
      _Success;
  const factory DeleteProfileState.error(Error error) = _ErrorState;
}
