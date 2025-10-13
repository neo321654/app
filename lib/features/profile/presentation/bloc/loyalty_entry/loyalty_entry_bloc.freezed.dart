// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'loyalty_entry_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoyaltyEntryEvent {
  LoyaltyEntryRequestEntity get request => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoyaltyEntryRequestEntity request)
        postLoyaltyRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoyaltyEntryRequestEntity request)? postLoyaltyRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoyaltyEntryRequestEntity request)? postLoyaltyRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PostLoyaltyRequest value) postLoyaltyRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostLoyaltyRequest value)? postLoyaltyRequest,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostLoyaltyRequest value)? postLoyaltyRequest,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoyaltyEntryEventCopyWith<LoyaltyEntryEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyEntryEventCopyWith<$Res> {
  factory $LoyaltyEntryEventCopyWith(
          LoyaltyEntryEvent value, $Res Function(LoyaltyEntryEvent) then) =
      _$LoyaltyEntryEventCopyWithImpl<$Res, LoyaltyEntryEvent>;
  @useResult
  $Res call({LoyaltyEntryRequestEntity request});
}

/// @nodoc
class _$LoyaltyEntryEventCopyWithImpl<$Res, $Val extends LoyaltyEntryEvent>
    implements $LoyaltyEntryEventCopyWith<$Res> {
  _$LoyaltyEntryEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_value.copyWith(
      request: null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as LoyaltyEntryRequestEntity,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostLoyaltyRequestImplCopyWith<$Res>
    implements $LoyaltyEntryEventCopyWith<$Res> {
  factory _$$PostLoyaltyRequestImplCopyWith(_$PostLoyaltyRequestImpl value,
          $Res Function(_$PostLoyaltyRequestImpl) then) =
      __$$PostLoyaltyRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LoyaltyEntryRequestEntity request});
}

/// @nodoc
class __$$PostLoyaltyRequestImplCopyWithImpl<$Res>
    extends _$LoyaltyEntryEventCopyWithImpl<$Res, _$PostLoyaltyRequestImpl>
    implements _$$PostLoyaltyRequestImplCopyWith<$Res> {
  __$$PostLoyaltyRequestImplCopyWithImpl(_$PostLoyaltyRequestImpl _value,
      $Res Function(_$PostLoyaltyRequestImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? request = null,
  }) {
    return _then(_$PostLoyaltyRequestImpl(
      null == request
          ? _value.request
          : request // ignore: cast_nullable_to_non_nullable
              as LoyaltyEntryRequestEntity,
    ));
  }
}

/// @nodoc

class _$PostLoyaltyRequestImpl implements _PostLoyaltyRequest {
  const _$PostLoyaltyRequestImpl(this.request);

  @override
  final LoyaltyEntryRequestEntity request;

  @override
  String toString() {
    return 'LoyaltyEntryEvent.postLoyaltyRequest(request: $request)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostLoyaltyRequestImpl &&
            (identical(other.request, request) || other.request == request));
  }

  @override
  int get hashCode => Object.hash(runtimeType, request);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PostLoyaltyRequestImplCopyWith<_$PostLoyaltyRequestImpl> get copyWith =>
      __$$PostLoyaltyRequestImplCopyWithImpl<_$PostLoyaltyRequestImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(LoyaltyEntryRequestEntity request)
        postLoyaltyRequest,
  }) {
    return postLoyaltyRequest(request);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(LoyaltyEntryRequestEntity request)? postLoyaltyRequest,
  }) {
    return postLoyaltyRequest?.call(request);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(LoyaltyEntryRequestEntity request)? postLoyaltyRequest,
    required TResult orElse(),
  }) {
    if (postLoyaltyRequest != null) {
      return postLoyaltyRequest(request);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PostLoyaltyRequest value) postLoyaltyRequest,
  }) {
    return postLoyaltyRequest(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PostLoyaltyRequest value)? postLoyaltyRequest,
  }) {
    return postLoyaltyRequest?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PostLoyaltyRequest value)? postLoyaltyRequest,
    required TResult orElse(),
  }) {
    if (postLoyaltyRequest != null) {
      return postLoyaltyRequest(this);
    }
    return orElse();
  }
}

abstract class _PostLoyaltyRequest implements LoyaltyEntryEvent {
  const factory _PostLoyaltyRequest(final LoyaltyEntryRequestEntity request) =
      _$PostLoyaltyRequestImpl;

  @override
  LoyaltyEntryRequestEntity get request;
  @override
  @JsonKey(ignore: true)
  _$$PostLoyaltyRequestImplCopyWith<_$PostLoyaltyRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LoyaltyEntryState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(LoyaltyEntryResponseEntity response) success,
    required TResult Function(Error error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function(LoyaltyEntryResponseEntity response)? success,
    TResult? Function(Error error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(LoyaltyEntryResponseEntity response)? success,
    TResult Function(Error error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoyaltyEntryStateCopyWith<$Res> {
  factory $LoyaltyEntryStateCopyWith(
          LoyaltyEntryState value, $Res Function(LoyaltyEntryState) then) =
      _$LoyaltyEntryStateCopyWithImpl<$Res, LoyaltyEntryState>;
}

/// @nodoc
class _$LoyaltyEntryStateCopyWithImpl<$Res, $Val extends LoyaltyEntryState>
    implements $LoyaltyEntryStateCopyWith<$Res> {
  _$LoyaltyEntryStateCopyWithImpl(this._value, this._then);

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
    extends _$LoyaltyEntryStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'LoyaltyEntryState.initial()';
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
    required TResult Function(LoyaltyEntryResponseEntity response) success,
    required TResult Function(Error error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function(LoyaltyEntryResponseEntity response)? success,
    TResult? Function(Error error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(LoyaltyEntryResponseEntity response)? success,
    TResult Function(Error error)? error,
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
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LoyaltyEntryState {
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
    extends _$LoyaltyEntryStateCopyWithImpl<$Res, _$SavingImpl>
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
    return 'LoyaltyEntryState.saving()';
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
    required TResult Function(LoyaltyEntryResponseEntity response) success,
    required TResult Function(Error error) error,
  }) {
    return saving();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function(LoyaltyEntryResponseEntity response)? success,
    TResult? Function(Error error)? error,
  }) {
    return saving?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(LoyaltyEntryResponseEntity response)? success,
    TResult Function(Error error)? error,
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
    required TResult Function(_Error value) error,
  }) {
    return saving(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return saving?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (saving != null) {
      return saving(this);
    }
    return orElse();
  }
}

abstract class _Saving implements LoyaltyEntryState {
  const factory _Saving() = _$SavingImpl;
}

/// @nodoc
abstract class _$$SuccessImplCopyWith<$Res> {
  factory _$$SuccessImplCopyWith(
          _$SuccessImpl value, $Res Function(_$SuccessImpl) then) =
      __$$SuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({LoyaltyEntryResponseEntity response});
}

/// @nodoc
class __$$SuccessImplCopyWithImpl<$Res>
    extends _$LoyaltyEntryStateCopyWithImpl<$Res, _$SuccessImpl>
    implements _$$SuccessImplCopyWith<$Res> {
  __$$SuccessImplCopyWithImpl(
      _$SuccessImpl _value, $Res Function(_$SuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? response = null,
  }) {
    return _then(_$SuccessImpl(
      null == response
          ? _value.response
          : response // ignore: cast_nullable_to_non_nullable
              as LoyaltyEntryResponseEntity,
    ));
  }
}

/// @nodoc

class _$SuccessImpl implements _Success {
  const _$SuccessImpl(this.response);

  @override
  final LoyaltyEntryResponseEntity response;

  @override
  String toString() {
    return 'LoyaltyEntryState.success(response: $response)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuccessImpl &&
            (identical(other.response, response) ||
                other.response == response));
  }

  @override
  int get hashCode => Object.hash(runtimeType, response);

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
    required TResult Function(LoyaltyEntryResponseEntity response) success,
    required TResult Function(Error error) error,
  }) {
    return success(response);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function(LoyaltyEntryResponseEntity response)? success,
    TResult? Function(Error error)? error,
  }) {
    return success?.call(response);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(LoyaltyEntryResponseEntity response)? success,
    TResult Function(Error error)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(response);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements LoyaltyEntryState {
  const factory _Success(final LoyaltyEntryResponseEntity response) =
      _$SuccessImpl;

  LoyaltyEntryResponseEntity get response;
  @JsonKey(ignore: true)
  _$$SuccessImplCopyWith<_$SuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Error error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$LoyaltyEntryStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Error,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final Error error;

  @override
  String toString() {
    return 'LoyaltyEntryState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() saving,
    required TResult Function(LoyaltyEntryResponseEntity response) success,
    required TResult Function(Error error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? saving,
    TResult? Function(LoyaltyEntryResponseEntity response)? success,
    TResult? Function(Error error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? saving,
    TResult Function(LoyaltyEntryResponseEntity response)? success,
    TResult Function(Error error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Saving value) saving,
    required TResult Function(_Success value) success,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Saving value)? saving,
    TResult? Function(_Success value)? success,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Saving value)? saving,
    TResult Function(_Success value)? success,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements LoyaltyEntryState {
  const factory _Error(final Error error) = _$ErrorImpl;

  Error get error;
  @JsonKey(ignore: true)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
