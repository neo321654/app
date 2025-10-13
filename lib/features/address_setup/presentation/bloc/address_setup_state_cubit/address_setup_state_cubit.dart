import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/city_entity.dart';
import '../../models/address_setup_state.dart';
import '../../models/user_address.dart';

class AddressSetupStateCubit extends Cubit<AddressSetupState> {
  AddressSetupStateCubit()
      : super(
          const AddressSetupState(
            address: UserAddress(),
            streetConfirm: false,
          ),
        );

  void setStreet(String streetName,
      {double? lat, double? lon, String? street2}) {
    emit(
      state.copyWith(
        address: state.address!.copyWith(
          street: streetName,
          street2: street2,
          lat: lat,
          lon: lon,
        ),
      ),
    );
  }

  void streetConfirm() {
    emit(
      state.copyWith(
        streetConfirm: true,
      ),
    );
  }

  void streetNotConfirm() {
    emit(
      state.copyWith(
        streetConfirm: false,
      ),
    );
  }

  void setCity(CityEntity city) {
    emit(
      state.copyWith(
        address: state.address!.copyWith(city: city),
      ),
    );
  }

  void setHouse(String house) {
    if (house != state.address!.house) {
      emit(
        state.copyWith(
          address: state.address!.copyWith(house: house),
        ),
      );
    }
  }

  void setFlat(String flat) {
    if (flat != state.address!.flat) {
      emit(
        state.copyWith(
          address: state.address!.copyWith(flat: flat),
        ),
      );
    }
  }

  void setFloor(String floor) {
    if (floor != state.address!.floor) {
      emit(
        state.copyWith(
          address: state.address!.copyWith(floor: floor),
        ),
      );
    }
  }

  void setEntry(String entry) {
    if (entry != state.address!.entry) {
      emit(
        state.copyWith(
          address: state.address!.copyWith(entry: entry),
        ),
      );
    }
  }

  void setDomofon(String domofon) {
    if (domofon != state.address!.domofon) {
      emit(
        state.copyWith(
          address: state.address!.copyWith(domofon: domofon),
        ),
      );
    }
  }

  void setComment(String comment) {
    if (comment != state.address!.comment) {
      emit(
        state.copyWith(
          address: state.address!.copyWith(comment: comment),
        ),
      );
    }
  }

  void clear() {
    emit(state.copyWith(
      address: const UserAddress(
        street: '',
      ),
      streetConfirm: false,
    ));
  }

  bool allowToSave() {
    return state.address?.street?.isNotEmpty == true &&
        state.address?.house?.isNotEmpty == true;
  }
}
