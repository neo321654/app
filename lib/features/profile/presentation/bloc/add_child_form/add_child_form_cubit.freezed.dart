// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_child_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddChildFormState {
  bool get nameValid => throw _privateConstructorUsedError;
  bool get birthDateValid => throw _privateConstructorUsedError;
  bool get validForm => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddChildFormStateCopyWith<AddChildFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddChildFormStateCopyWith<$Res> {
  factory $AddChildFormStateCopyWith(
          AddChildFormState value, $Res Function(AddChildFormState) then) =
      _$AddChildFormStateCopyWithImpl<$Res, AddChildFormState>;
  @useResult
  $Res call({bool nameValid, bool birthDateValid, bool validForm});
}

/// @nodoc
class _$AddChildFormStateCopyWithImpl<$Res, $Val extends AddChildFormState>
    implements $AddChildFormStateCopyWith<$Res> {
  _$AddChildFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameValid = null,
    Object? birthDateValid = null,
    Object? validForm = null,
  }) {
    return _then(_value.copyWith(
      nameValid: null == nameValid
          ? _value.nameValid
          : nameValid // ignore: cast_nullable_to_non_nullable
              as bool,
      birthDateValid: null == birthDateValid
          ? _value.birthDateValid
          : birthDateValid // ignore: cast_nullable_to_non_nullable
              as bool,
      validForm: null == validForm
          ? _value.validForm
          : validForm // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddChildFormStateImplCopyWith<$Res>
    implements $AddChildFormStateCopyWith<$Res> {
  factory _$$AddChildFormStateImplCopyWith(_$AddChildFormStateImpl value,
          $Res Function(_$AddChildFormStateImpl) then) =
      __$$AddChildFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool nameValid, bool birthDateValid, bool validForm});
}

/// @nodoc
class __$$AddChildFormStateImplCopyWithImpl<$Res>
    extends _$AddChildFormStateCopyWithImpl<$Res, _$AddChildFormStateImpl>
    implements _$$AddChildFormStateImplCopyWith<$Res> {
  __$$AddChildFormStateImplCopyWithImpl(_$AddChildFormStateImpl _value,
      $Res Function(_$AddChildFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nameValid = null,
    Object? birthDateValid = null,
    Object? validForm = null,
  }) {
    return _then(_$AddChildFormStateImpl(
      nameValid: null == nameValid
          ? _value.nameValid
          : nameValid // ignore: cast_nullable_to_non_nullable
              as bool,
      birthDateValid: null == birthDateValid
          ? _value.birthDateValid
          : birthDateValid // ignore: cast_nullable_to_non_nullable
              as bool,
      validForm: null == validForm
          ? _value.validForm
          : validForm // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddChildFormStateImpl implements _AddChildFormState {
  const _$AddChildFormStateImpl(
      {this.nameValid = false,
      this.birthDateValid = false,
      this.validForm = false});

  @override
  @JsonKey()
  final bool nameValid;
  @override
  @JsonKey()
  final bool birthDateValid;
  @override
  @JsonKey()
  final bool validForm;

  @override
  String toString() {
    return 'AddChildFormState(nameValid: $nameValid, birthDateValid: $birthDateValid, validForm: $validForm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddChildFormStateImpl &&
            (identical(other.nameValid, nameValid) ||
                other.nameValid == nameValid) &&
            (identical(other.birthDateValid, birthDateValid) ||
                other.birthDateValid == birthDateValid) &&
            (identical(other.validForm, validForm) ||
                other.validForm == validForm));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, nameValid, birthDateValid, validForm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddChildFormStateImplCopyWith<_$AddChildFormStateImpl> get copyWith =>
      __$$AddChildFormStateImplCopyWithImpl<_$AddChildFormStateImpl>(
          this, _$identity);
}

abstract class _AddChildFormState implements AddChildFormState {
  const factory _AddChildFormState(
      {final bool nameValid,
      final bool birthDateValid,
      final bool validForm}) = _$AddChildFormStateImpl;

  @override
  bool get nameValid;
  @override
  bool get birthDateValid;
  @override
  bool get validForm;
  @override
  @JsonKey(ignore: true)
  _$$AddChildFormStateImplCopyWith<_$AddChildFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
