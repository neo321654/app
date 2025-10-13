// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_address_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EditAddressState {
  AddressEntity get address => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditAddressStateCopyWith<EditAddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditAddressStateCopyWith<$Res> {
  factory $EditAddressStateCopyWith(
          EditAddressState value, $Res Function(EditAddressState) then) =
      _$EditAddressStateCopyWithImpl<$Res, EditAddressState>;
  @useResult
  $Res call({AddressEntity address});

  $AddressEntityCopyWith<$Res> get address;
}

/// @nodoc
class _$EditAddressStateCopyWithImpl<$Res, $Val extends EditAddressState>
    implements $EditAddressStateCopyWith<$Res> {
  _$EditAddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
  }) {
    return _then(_value.copyWith(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressEntity,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressEntityCopyWith<$Res> get address {
    return $AddressEntityCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EditAddressStateImplCopyWith<$Res>
    implements $EditAddressStateCopyWith<$Res> {
  factory _$$EditAddressStateImplCopyWith(_$EditAddressStateImpl value,
          $Res Function(_$EditAddressStateImpl) then) =
      __$$EditAddressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AddressEntity address});

  @override
  $AddressEntityCopyWith<$Res> get address;
}

/// @nodoc
class __$$EditAddressStateImplCopyWithImpl<$Res>
    extends _$EditAddressStateCopyWithImpl<$Res, _$EditAddressStateImpl>
    implements _$$EditAddressStateImplCopyWith<$Res> {
  __$$EditAddressStateImplCopyWithImpl(_$EditAddressStateImpl _value,
      $Res Function(_$EditAddressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
  }) {
    return _then(_$EditAddressStateImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressEntity,
    ));
  }
}

/// @nodoc

class _$EditAddressStateImpl implements _EditAddressState {
  const _$EditAddressStateImpl({required this.address});

  @override
  final AddressEntity address;

  @override
  String toString() {
    return 'EditAddressState(address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditAddressStateImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditAddressStateImplCopyWith<_$EditAddressStateImpl> get copyWith =>
      __$$EditAddressStateImplCopyWithImpl<_$EditAddressStateImpl>(
          this, _$identity);
}

abstract class _EditAddressState implements EditAddressState {
  const factory _EditAddressState({required final AddressEntity address}) =
      _$EditAddressStateImpl;

  @override
  AddressEntity get address;
  @override
  @JsonKey(ignore: true)
  _$$EditAddressStateImplCopyWith<_$EditAddressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
