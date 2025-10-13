// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_address_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MyAddressState {
  AddressEntity? get cuttentAddress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MyAddressStateCopyWith<MyAddressState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyAddressStateCopyWith<$Res> {
  factory $MyAddressStateCopyWith(
          MyAddressState value, $Res Function(MyAddressState) then) =
      _$MyAddressStateCopyWithImpl<$Res, MyAddressState>;
  @useResult
  $Res call({AddressEntity? cuttentAddress});

  $AddressEntityCopyWith<$Res>? get cuttentAddress;
}

/// @nodoc
class _$MyAddressStateCopyWithImpl<$Res, $Val extends MyAddressState>
    implements $MyAddressStateCopyWith<$Res> {
  _$MyAddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cuttentAddress = freezed,
  }) {
    return _then(_value.copyWith(
      cuttentAddress: freezed == cuttentAddress
          ? _value.cuttentAddress
          : cuttentAddress // ignore: cast_nullable_to_non_nullable
              as AddressEntity?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressEntityCopyWith<$Res>? get cuttentAddress {
    if (_value.cuttentAddress == null) {
      return null;
    }

    return $AddressEntityCopyWith<$Res>(_value.cuttentAddress!, (value) {
      return _then(_value.copyWith(cuttentAddress: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MyAddressStateImplCopyWith<$Res>
    implements $MyAddressStateCopyWith<$Res> {
  factory _$$MyAddressStateImplCopyWith(_$MyAddressStateImpl value,
          $Res Function(_$MyAddressStateImpl) then) =
      __$$MyAddressStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({AddressEntity? cuttentAddress});

  @override
  $AddressEntityCopyWith<$Res>? get cuttentAddress;
}

/// @nodoc
class __$$MyAddressStateImplCopyWithImpl<$Res>
    extends _$MyAddressStateCopyWithImpl<$Res, _$MyAddressStateImpl>
    implements _$$MyAddressStateImplCopyWith<$Res> {
  __$$MyAddressStateImplCopyWithImpl(
      _$MyAddressStateImpl _value, $Res Function(_$MyAddressStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cuttentAddress = freezed,
  }) {
    return _then(_$MyAddressStateImpl(
      cuttentAddress: freezed == cuttentAddress
          ? _value.cuttentAddress
          : cuttentAddress // ignore: cast_nullable_to_non_nullable
              as AddressEntity?,
    ));
  }
}

/// @nodoc

class _$MyAddressStateImpl implements _MyAddressState {
  const _$MyAddressStateImpl({this.cuttentAddress});

  @override
  final AddressEntity? cuttentAddress;

  @override
  String toString() {
    return 'MyAddressState(cuttentAddress: $cuttentAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MyAddressStateImpl &&
            (identical(other.cuttentAddress, cuttentAddress) ||
                other.cuttentAddress == cuttentAddress));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cuttentAddress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MyAddressStateImplCopyWith<_$MyAddressStateImpl> get copyWith =>
      __$$MyAddressStateImplCopyWithImpl<_$MyAddressStateImpl>(
          this, _$identity);
}

abstract class _MyAddressState implements MyAddressState {
  const factory _MyAddressState({final AddressEntity? cuttentAddress}) =
      _$MyAddressStateImpl;

  @override
  AddressEntity? get cuttentAddress;
  @override
  @JsonKey(ignore: true)
  _$$MyAddressStateImplCopyWith<_$MyAddressStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
