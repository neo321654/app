import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_profile_form_state.dart';
part 'edit_profile_form_cubit.freezed.dart';

class EditProfileFormCubit extends Cubit<EditProfileFormState> {
  EditProfileFormCubit() : super(const EditProfileFormState());

  void validName(bool valid) {
    emit(state.copyWith(
      nameValid: valid,
    ));
  }

  void validEmail(bool valid) {
    emit(state.copyWith(
      emailValid: valid,
    ));
  }

  void validBirtday(bool valid) {
    emit(state.copyWith(
      birthDateValid: valid,
    ));
  }

  bool isValidForm() {
    if (state.emailValid) {
      return true;
    }
    return false;
  }

  void formValid(
      {String? email, String? name, String? birthday, bool? acceptLoyality}) {
    bool isValidForm = false;
    if (email?.isNotEmpty == true ||
        name?.isNotEmpty == true ||
        birthday?.isNotEmpty == true) {
      if ((email?.isNotEmpty == true && !state.emailValid)) {
        isValidForm = false;
      } else {
        isValidForm = true;
      }
    }

    if (isValidForm && acceptLoyality != null && !acceptLoyality) {
      isValidForm = false;
    }

    emit(state.copyWith(
      validForm: isValidForm,
    ));
  }

  void formValid2(
      {String? email, String? name, String? birthday, bool? acceptLoyality}) {
    bool isValidForm = false;
    if (email?.isNotEmpty == true &&
        name?.isNotEmpty == true &&
        birthday?.isNotEmpty == true) {
      isValidForm = true;
    }

    if (isValidForm && acceptLoyality != null && !acceptLoyality) {
      isValidForm = false;
    }

    emit(state.copyWith(
      validForm: isValidForm,
    ));
  }

  void acceptLoyality(bool accept) {
    emit(state.copyWith(
      acceptLoyality: accept,
    ));
  }
}
