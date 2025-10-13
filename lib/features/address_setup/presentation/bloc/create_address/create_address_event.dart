part of 'create_address_bloc.dart';

@freezed
class CreateAddressEvent with _$CreateAddressEvent {
  const factory CreateAddressEvent.addAddress(AddressCreateEntity address) =
      _AddAddress;
  const factory CreateAddressEvent.deleteAddress(int addressId) =
      _DeleteAddress;
  const factory CreateAddressEvent.editAddress(AddressEntity address) =
      _EditAddress;
}
