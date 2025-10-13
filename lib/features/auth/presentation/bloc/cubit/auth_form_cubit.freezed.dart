// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_form_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AuthFormState {
  bool get phoneValid => throw _privateConstructorUsedError;
  bool get acceptLoyality => throw _privateConstructorUsedError;
  bool get acceptUserAgreement => throw _privateConstructorUsedError;
  bool get codeSent => throw _privateConstructorUsedError;
  String? get userPhone => throw _privateConstructorUsedError;
  int get timeCount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthFormStateCopyWith<AuthFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthFormStateCopyWith<$Res> {
  factory $AuthFormStateCopyWith(
          AuthFormState value, $Res Function(AuthFormState) then) =
      _$AuthFormStateCopyWithImpl<$Res, AuthFormState>;
  @useResult
  $Res call(
      {bool phoneValid,
      bool acceptLoyality,
      bool acceptUserAgreement,
      bool codeSent,
      String? userPhone,
      int timeCount});
}

/// @nodoc
class _$AuthFormStateCopyWithImpl<$Res, $Val extends AuthFormState>
    implements $AuthFormStateCopyWith<$Res> {
  _$AuthFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneValid = null,
    Object? acceptLoyality = null,
    Object? acceptUserAgreement = null,
    Object? codeSent = null,
    Object? userPhone = freezed,
    Object? timeCount = null,
  }) {
    return _then(_value.copyWith(
      phoneValid: null == phoneValid
          ? _value.phoneValid
          : phoneValid // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptLoyality: null == acceptLoyality
          ? _value.acceptLoyality
          : acceptLoyality // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptUserAgreement: null == acceptUserAgreement
          ? _value.acceptUserAgreement
          : acceptUserAgreement // ignore: cast_nullable_to_non_nullable
              as bool,
      codeSent: null == codeSent
          ? _value.codeSent
          : codeSent // ignore: cast_nullable_to_non_nullable
              as bool,
      userPhone: freezed == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      timeCount: null == timeCount
          ? _value.timeCount
          : timeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthFormStateImplCopyWith<$Res>
    implements $AuthFormStateCopyWith<$Res> {
  factory _$$AuthFormStateImplCopyWith(
          _$AuthFormStateImpl value, $Res Function(_$AuthFormStateImpl) then) =
      __$$AuthFormStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool phoneValid,
      bool acceptLoyality,
      bool acceptUserAgreement,
      bool codeSent,
      String? userPhone,
      int timeCount});
}

/// @nodoc
class __$$AuthFormStateImplCopyWithImpl<$Res>
    extends _$AuthFormStateCopyWithImpl<$Res, _$AuthFormStateImpl>
    implements _$$AuthFormStateImplCopyWith<$Res> {
  __$$AuthFormStateImplCopyWithImpl(
      _$AuthFormStateImpl _value, $Res Function(_$AuthFormStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? phoneValid = null,
    Object? acceptLoyality = null,
    Object? acceptUserAgreement = null,
    Object? codeSent = null,
    Object? userPhone = freezed,
    Object? timeCount = null,
  }) {
    return _then(_$AuthFormStateImpl(
      phoneValid: null == phoneValid
          ? _value.phoneValid
          : phoneValid // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptLoyality: null == acceptLoyality
          ? _value.acceptLoyality
          : acceptLoyality // ignore: cast_nullable_to_non_nullable
              as bool,
      acceptUserAgreement: null == acceptUserAgreement
          ? _value.acceptUserAgreement
          : acceptUserAgreement // ignore: cast_nullable_to_non_nullable
              as bool,
      codeSent: null == codeSent
          ? _value.codeSent
          : codeSent // ignore: cast_nullable_to_non_nullable
              as bool,
      userPhone: freezed == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      timeCount: null == timeCount
          ? _value.timeCount
          : timeCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AuthFormStateImpl implements _AuthFormState {
  const _$AuthFormStateImpl(
      {this.phoneValid = false,
      this.acceptLoyality = true,
      this.acceptUserAgreement = true,
      this.codeSent = false,
      this.userPhone,
      this.timeCount = 59});

  @override
  @JsonKey()
  final bool phoneValid;
  @override
  @JsonKey()
  final bool acceptLoyality;
  @override
  @JsonKey()
  final bool acceptUserAgreement;
  @override
  @JsonKey()
  final bool codeSent;
  @override
  final String? userPhone;
  @override
  @JsonKey()
  final int timeCount;

  @override
  String toString() {
    return 'AuthFormState(phoneValid: $phoneValid, acceptLoyality: $acceptLoyality, acceptUserAgreement: $acceptUserAgreement, codeSent: $codeSent, userPhone: $userPhone, timeCount: $timeCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthFormStateImpl &&
            (identical(other.phoneValid, phoneValid) ||
                other.phoneValid == phoneValid) &&
            (identical(other.acceptLoyality, acceptLoyality) ||
                other.acceptLoyality == acceptLoyality) &&
            (identical(other.acceptUserAgreement, acceptUserAgreement) ||
                other.acceptUserAgreement == acceptUserAgreement) &&
            (identical(other.codeSent, codeSent) ||
                other.codeSent == codeSent) &&
            (identical(other.userPhone, userPhone) ||
                other.userPhone == userPhone) &&
            (identical(other.timeCount, timeCount) ||
                other.timeCount == timeCount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, phoneValid, acceptLoyality,
      acceptUserAgreement, codeSent, userPhone, timeCount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthFormStateImplCopyWith<_$AuthFormStateImpl> get copyWith =>
      __$$AuthFormStateImplCopyWithImpl<_$AuthFormStateImpl>(this, _$identity);
}

abstract class _AuthFormState implements AuthFormState {
  const factory _AuthFormState(
      {final bool phoneValid,
      final bool acceptLoyality,
      final bool acceptUserAgreement,
      final bool codeSent,
      final String? userPhone,
      final int timeCount}) = _$AuthFormStateImpl;

  @override
  bool get phoneValid;
  @override
  bool get acceptLoyality;
  @override
  bool get acceptUserAgreement;
  @override
  bool get codeSent;
  @override
  String? get userPhone;
  @override
  int get timeCount;
  @override
  @JsonKey(ignore: true)
  _$$AuthFormStateImplCopyWith<_$AuthFormStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
