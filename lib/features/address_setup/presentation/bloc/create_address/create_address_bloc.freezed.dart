// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_address_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CreateAddressEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddressCreateEntity address) addAddress,
    required TResult Function(int addressId) deleteAddress,
    required TResult Function(AddressEntity address) editAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddressCreateEntity address)? addAddress,
    TResult? Function(int addressId)? deleteAddress,
    TResult? Function(AddressEntity address)? editAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddressCreateEntity address)? addAddress,
    TResult Function(int addressId)? deleteAddress,
    TResult Function(AddressEntity address)? editAddress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAddress value) addAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_EditAddress value) editAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAddress value)? addAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_EditAddress value)? editAddress,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAddress value)? addAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_EditAddress value)? editAddress,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAddressEventCopyWith<$Res> {
  factory $CreateAddressEventCopyWith(
          CreateAddressEvent value, $Res Function(CreateAddressEvent) then) =
      _$CreateAddressEventCopyWithImpl<$Res, CreateAddressEvent>;
}

/// @nodoc
class _$CreateAddressEventCopyWithImpl<$Res, $Val extends CreateAddressEvent>
    implements $CreateAddressEventCopyWith<$Res> {
  _$CreateAddressEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddAddressImplCopyWith<$Res> {
  factory _$$AddAddressImplCopyWith(
          _$AddAddressImpl value, $Res Function(_$AddAddressImpl) then) =
      __$$AddAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddressCreateEntity address});
}

/// @nodoc
class __$$AddAddressImplCopyWithImpl<$Res>
    extends _$CreateAddressEventCopyWithImpl<$Res, _$AddAddressImpl>
    implements _$$AddAddressImplCopyWith<$Res> {
  __$$AddAddressImplCopyWithImpl(
      _$AddAddressImpl _value, $Res Function(_$AddAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
  }) {
    return _then(_$AddAddressImpl(
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressCreateEntity,
    ));
  }
}

/// @nodoc

class _$AddAddressImpl implements _AddAddress {
  const _$AddAddressImpl(this.address);

  @override
  final AddressCreateEntity address;

  @override
  String toString() {
    return 'CreateAddressEvent.addAddress(address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAddressImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAddressImplCopyWith<_$AddAddressImpl> get copyWith =>
      __$$AddAddressImplCopyWithImpl<_$AddAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddressCreateEntity address) addAddress,
    required TResult Function(int addressId) deleteAddress,
    required TResult Function(AddressEntity address) editAddress,
  }) {
    return addAddress(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddressCreateEntity address)? addAddress,
    TResult? Function(int addressId)? deleteAddress,
    TResult? Function(AddressEntity address)? editAddress,
  }) {
    return addAddress?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddressCreateEntity address)? addAddress,
    TResult Function(int addressId)? deleteAddress,
    TResult Function(AddressEntity address)? editAddress,
    required TResult orElse(),
  }) {
    if (addAddress != null) {
      return addAddress(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAddress value) addAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_EditAddress value) editAddress,
  }) {
    return addAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAddress value)? addAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_EditAddress value)? editAddress,
  }) {
    return addAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAddress value)? addAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_EditAddress value)? editAddress,
    required TResult orElse(),
  }) {
    if (addAddress != null) {
      return addAddress(this);
    }
    return orElse();
  }
}

abstract class _AddAddress implements CreateAddressEvent {
  const factory _AddAddress(final AddressCreateEntity address) =
      _$AddAddressImpl;

  AddressCreateEntity get address;
  @JsonKey(ignore: true)
  _$$AddAddressImplCopyWith<_$AddAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeleteAddressImplCopyWith<$Res> {
  factory _$$DeleteAddressImplCopyWith(
          _$DeleteAddressImpl value, $Res Function(_$DeleteAddressImpl) then) =
      __$$DeleteAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int addressId});
}

/// @nodoc
class __$$DeleteAddressImplCopyWithImpl<$Res>
    extends _$CreateAddressEventCopyWithImpl<$Res, _$DeleteAddressImpl>
    implements _$$DeleteAddressImplCopyWith<$Res> {
  __$$DeleteAddressImplCopyWithImpl(
      _$DeleteAddressImpl _value, $Res Function(_$DeleteAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? addressId = null,
  }) {
    return _then(_$DeleteAddressImpl(
      null == addressId
          ? _value.addressId
          : addressId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DeleteAddressImpl implements _DeleteAddress {
  const _$DeleteAddressImpl(this.addressId);

  @override
  final int addressId;

  @override
  String toString() {
    return 'CreateAddressEvent.deleteAddress(addressId: $addressId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeleteAddressImpl &&
            (identical(other.addressId, addressId) ||
                other.addressId == addressId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, addressId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeleteAddressImplCopyWith<_$DeleteAddressImpl> get copyWith =>
      __$$DeleteAddressImplCopyWithImpl<_$DeleteAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddressCreateEntity address) addAddress,
    required TResult Function(int addressId) deleteAddress,
    required TResult Function(AddressEntity address) editAddress,
  }) {
    return deleteAddress(addressId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddressCreateEntity address)? addAddress,
    TResult? Function(int addressId)? deleteAddress,
    TResult? Function(AddressEntity address)? editAddress,
  }) {
    return deleteAddress?.call(addressId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddressCreateEntity address)? addAddress,
    TResult Function(int addressId)? deleteAddress,
    TResult Function(AddressEntity address)? editAddress,
    required TResult orElse(),
  }) {
    if (deleteAddress != null) {
      return deleteAddress(addressId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAddress value) addAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_EditAddress value) editAddress,
  }) {
    return deleteAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAddress value)? addAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_EditAddress value)? editAddress,
  }) {
    return deleteAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAddress value)? addAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_EditAddress value)? editAddress,
    required TResult orElse(),
  }) {
    if (deleteAddress != null) {
      return deleteAddress(this);
    }
    return orElse();
  }
}

abstract class _DeleteAddress implements CreateAddressEvent {
  const factory _DeleteAddress(final int addressId) = _$DeleteAddressImpl;

  int get addressId;
  @JsonKey(ignore: true)
  _$$DeleteAddressImplCopyWith<_$DeleteAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditAddressImplCopyWith<$Res> {
  factory _$$EditAddressImplCopyWith(
          _$EditAddressImpl value, $Res Function(_$EditAddressImpl) then) =
      __$$EditAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddressEntity address});

  $AddressEntityCopyWith<$Res> get address;
}

/// @nodoc
class __$$EditAddressImplCopyWithImpl<$Res>
    extends _$CreateAddressEventCopyWithImpl<$Res, _$EditAddressImpl>
    implements _$$EditAddressImplCopyWith<$Res> {
  __$$EditAddressImplCopyWithImpl(
      _$EditAddressImpl _value, $Res Function(_$EditAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
  }) {
    return _then(_$EditAddressImpl(
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressEntityCopyWith<$Res> get address {
    return $AddressEntityCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value));
    });
  }
}

/// @nodoc

class _$EditAddressImpl implements _EditAddress {
  const _$EditAddressImpl(this.address);

  @override
  final AddressEntity address;

  @override
  String toString() {
    return 'CreateAddressEvent.editAddress(address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditAddressImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditAddressImplCopyWith<_$EditAddressImpl> get copyWith =>
      __$$EditAddressImplCopyWithImpl<_$EditAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AddressCreateEntity address) addAddress,
    required TResult Function(int addressId) deleteAddress,
    required TResult Function(AddressEntity address) editAddress,
  }) {
    return editAddress(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AddressCreateEntity address)? addAddress,
    TResult? Function(int addressId)? deleteAddress,
    TResult? Function(AddressEntity address)? editAddress,
  }) {
    return editAddress?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AddressCreateEntity address)? addAddress,
    TResult Function(int addressId)? deleteAddress,
    TResult Function(AddressEntity address)? editAddress,
    required TResult orElse(),
  }) {
    if (editAddress != null) {
      return editAddress(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAddress value) addAddress,
    required TResult Function(_DeleteAddress value) deleteAddress,
    required TResult Function(_EditAddress value) editAddress,
  }) {
    return editAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAddress value)? addAddress,
    TResult? Function(_DeleteAddress value)? deleteAddress,
    TResult? Function(_EditAddress value)? editAddress,
  }) {
    return editAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAddress value)? addAddress,
    TResult Function(_DeleteAddress value)? deleteAddress,
    TResult Function(_EditAddress value)? editAddress,
    required TResult orElse(),
  }) {
    if (editAddress != null) {
      return editAddress(this);
    }
    return orElse();
  }
}

abstract class _EditAddress implements CreateAddressEvent {
  const factory _EditAddress(final AddressEntity address) = _$EditAddressImpl;

  AddressEntity get address;
  @JsonKey(ignore: true)
  _$$EditAddressImplCopyWith<_$EditAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateAddressState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(AddressEntity address) success,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function(AddressEntity address)? success,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(AddressEntity address)? success,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Success value) success,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_ErrorState value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Success value)? success,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_ErrorState value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Success value)? success,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateAddressStateCopyWith<$Res> {
  factory $CreateAddressStateCopyWith(
          CreateAddressState value, $Res Function(CreateAddressState) then) =
      _$CreateAddressStateCopyWithImpl<$Res, CreateAddressState>;
}

/// @nodoc
class _$CreateAddressStateCopyWithImpl<$Res, $Val extends CreateAddressState>
    implements $CreateAddressStateCopyWith<$Res> {
  _$CreateAddressStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$CreateAddressStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'CreateAddressState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(AddressEntity address) success,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function(AddressEntity address)? success,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(AddressEntity address)? success,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Success value) success,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_ErrorState value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Success value)? success,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_ErrorState value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Success value)? success,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CreateAddressState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SavingImplCopyWith<$Res> {
  factory _$$SavingImplCopyWith(
          _$SavingImpl value, $Res Function(_$SavingImpl) then) =
      __$$SavingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SavingImplCopyWithImpl<$Res>
    extends _$CreateAddressStateCopyWithImpl<$Res, _$SavingImpl>
    implements _$$SavingImplCopyWith<$Res> {
  __$$SavingImplCopyWithImpl(
      _$SavingImpl _value, $Res Function(_$SavingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SavingImpl implements _Saving {
  const _$SavingImpl();

  @override
  String toString() {
    return 'CreateAddressState.saving()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SavingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(AddressEntity address) success,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return saving();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function(AddressEntity address)? success,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) {
    return saving?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(AddressEntity address)? success,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Success value) success,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_ErrorState value) error,
  }) {
    return saving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Success value)? success,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_ErrorState value)? error,
  }) {
    return saving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Success value)? success,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(this);
    }
    return orElse();
  }
}

abstract class _Saving implements CreateAddressState {
  const factory _Saving() = _$SavingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AddressEntity address});

  $AddressEntityCopyWith<$Res> get address;
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$CreateAddressStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
  }) {
    return _then(_$SuccessImpl(
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as AddressEntity,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressEntityCopyWith<$Res> get address {
    return $AddressEntityCopyWith<$Res>(_value.address, (value) {
      return _then(_value.copyWith(address: value));
    });
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.address);

  @override
  final AddressEntity address;

  @override
  String toString() {
    return 'CreateAddressState.success(address: $address)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      __$$SuccessImplCopyWithImpl<_$SuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(AddressEntity address) success,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return success(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function(AddressEntity address)? success,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) {
    return success?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(AddressEntity address)? success,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Success value) success,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_ErrorState value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Success value)? success,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_ErrorState value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Success value)? success,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements CreateAddressState {
  const factory _Success(final AddressEntity address) = _$SuccessImpl;

  AddressEntity get address;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletedImplCopyWith<$Res> {
  factory _$$DeletedImplCopyWith(
          _$DeletedImpl value, $Res Function(_$DeletedImpl) then) =
      __$$DeletedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeletedImplCopyWithImpl<$Res>
    extends _$CreateAddressStateCopyWithImpl<$Res, _$DeletedImpl>
    implements _$$DeletedImplCopyWith<$Res> {
  __$$DeletedImplCopyWithImpl(
      _$DeletedImpl _value, $Res Function(_$DeletedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeletedImpl implements _Deleted {
  const _$DeletedImpl();

  @override
  String toString() {
    return 'CreateAddressState.deleted()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeletedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(AddressEntity address) success,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function(AddressEntity address)? success,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(AddressEntity address)? success,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Success value) success,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_ErrorState value) error,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Success value)? success,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_ErrorState value)? error,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Success value)? success,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class _Deleted implements CreateAddressState {
  const factory _Deleted() = _$DeletedImpl;
}

/// @nodoc
abstract class _$$ErrorStateImplCopyWith<$Res> {
  factory _$$ErrorStateImplCopyWith(
          _$ErrorStateImpl value, $Res Function(_$ErrorStateImpl) then) =
      __$$ErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorStateImplCopyWithImpl<$Res>
    extends _$CreateAddressStateCopyWithImpl<$Res, _$ErrorStateImpl>
    implements _$$ErrorStateImplCopyWith<$Res> {
  __$$ErrorStateImplCopyWithImpl(
      _$ErrorStateImpl _value, $Res Function(_$ErrorStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorStateImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorStateImpl implements _ErrorState {
  const _$ErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'CreateAddressState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      __$$ErrorStateImplCopyWithImpl<_$ErrorStateImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(AddressEntity address) success,
    required TResult Function() deleted,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function(AddressEntity address)? success,
    TResult? Function()? deleted,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(AddressEntity address)? success,
    TResult Function()? deleted,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Success value) success,
    required TResult Function(_Deleted value) deleted,
    required TResult Function(_ErrorState value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Success value)? success,
    TResult? Function(_Deleted value)? deleted,
    TResult? Function(_ErrorState value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Success value)? success,
    TResult Function(_Deleted value)? deleted,
    TResult Function(_ErrorState value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _ErrorState implements CreateAddressState {
  const factory _ErrorState(final String message) = _$ErrorStateImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$ErrorStateImplCopyWith<_$ErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
