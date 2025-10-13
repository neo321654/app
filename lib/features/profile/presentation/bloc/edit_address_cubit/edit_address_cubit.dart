import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monobox/features/address_setup/domain/entities/address_entity.dart';

part 'edit_address_state.dart';
part 'edit_address_cubit.freezed.dart';

class EditAddressCubit extends Cubit<EditAddressState> {
  final AddressEntity address;

  EditAddressCubit({
    required this.address,
  }) : super(EditAddressState(
          address: address,
        ));

  void setStreet(String streetName) {
    emit(
      state.copyWith(
        address: state.address.copyWith(
          title: streetName,
        ),
      ),
    );
  }

  void setCity(String city) {
    emit(
      state.copyWith(
        address: state.address.copyWith(
          city: city,
        ),
      ),
    );
  }

  void setHouse(String house) {
    if (house != state.address.house) {
      emit(
        state.copyWith(
          address: state.address.copyWith(
            house: house,
          ),
        ),
      );
    }
  }

  void setFlat(String flat) {
    if (flat != state.address.appartment) {
      emit(
        state.copyWith(
          address: state.address.copyWith(
            appartment: flat,
          ),
        ),
      );
    }
  }

  void setFloor(String floor) {
    if (floor != state.address.floor) {
      emit(
        state.copyWith(
          address: state.address.copyWith(
            floor: floor,
          ),
        ),
      );
    }
  }

  void setEntry(String entry) {
    if (entry != state.address.entrance) {
      emit(
        state.copyWith(
          address: state.address.copyWith(
            entrance: entry,
          ),
        ),
      );
    }
  }

  void setDomofon(String domofon) {
    if (domofon != state.address.domofon) {
      emit(
        state.copyWith(
          address: state.address.copyWith(
            domofon: domofon,
          ),
        ),
      );
    }
  }

  void setComment(String comment) {
    if (comment != state.address.comment) {
      emit(
        state.copyWith(
          address: state.address.copyWith(comment: comment),
        ),
      );
    }
  }

  bool allowToSave() {
    return state.address.title.isNotEmpty == true &&
        state.address.house?.isNotEmpty == true;
  }
}
