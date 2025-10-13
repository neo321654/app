// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address_setup_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddressSetupState {
  UserAddress? get address => throw _privateConstructorUsedError;
  bool get streetConfirm => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressSetupStateCopyWith<AddressSetupState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressSetupStateCopyWith<$Res> {
  factory $AddressSetupStateCopyWith(
          AddressSetupState value, $Res Function(AddressSetupState) then) =
      _$AddressSetupStateCopyWithImpl<$Res, AddressSetupState>;
  @useResult
  $Res call({UserAddress? address, bool streetConfirm});

  $UserAddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$AddressSetupStateCopyWithImpl<$Res, $Val extends AddressSetupState>
    implements $AddressSetupStateCopyWith<$Res> {
  _$AddressSetupStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? streetConfirm = null,
  }) {
    return _then(_value.copyWith(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as UserAddress?,
      streetConfirm: null == streetConfirm
          ? _value.streetConfirm
          : streetConfirm // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserAddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $UserAddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AddressSetupStateImplCopyWith<$Res>
    implements $AddressSetupStateCopyWith<$Res> {
  factory _$$AddressSetupStateImplCopyWith(_$AddressSetupStateImpl value,
          $Res Function(_$AddressSetupStateImpl) then) =
      __$$AddressSetupStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserAddress? address, bool streetConfirm});

  @override
  $UserAddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$AddressSetupStateImplCopyWithImpl<$Res>
    extends _$AddressSetupStateCopyWithImpl<$Res, _$AddressSetupStateImpl>
    implements _$$AddressSetupStateImplCopyWith<$Res> {
  __$$AddressSetupStateImplCopyWithImpl(_$AddressSetupStateImpl _value,
      $Res Function(_$AddressSetupStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = freezed,
    Object? streetConfirm = null,
  }) {
    return _then(_$AddressSetupStateImpl(
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as UserAddress?,
      streetConfirm: null == streetConfirm
          ? _value.streetConfirm
          : streetConfirm // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AddressSetupStateImpl implements _AddressSetupState {
  const _$AddressSetupStateImpl({this.address, required this.streetConfirm});

  @override
  final UserAddress? address;
  @override
  final bool streetConfirm;

  @override
  String toString() {
    return 'AddressSetupState(address: $address, streetConfirm: $streetConfirm)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressSetupStateImpl &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.streetConfirm, streetConfirm) ||
                other.streetConfirm == streetConfirm));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address, streetConfirm);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressSetupStateImplCopyWith<_$AddressSetupStateImpl> get copyWith =>
      __$$AddressSetupStateImplCopyWithImpl<_$AddressSetupStateImpl>(
          this, _$identity);
}

abstract class _AddressSetupState implements AddressSetupState {
  const factory _AddressSetupState(
      {final UserAddress? address,
      required final bool streetConfirm}) = _$AddressSetupStateImpl;

  @override
  UserAddress? get address;
  @override
  bool get streetConfirm;
  @override
  @JsonKey(ignore: true)
  _$$AddressSetupStateImplCopyWith<_$AddressSetupStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
