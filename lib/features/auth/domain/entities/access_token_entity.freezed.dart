// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_token_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AccessTokenEntity {
  String get accessToken => throw _privateConstructorUsedError;
  String get tokenType => throw _privateConstructorUsedError;
  int get expiresIn => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccessTokenEntityCopyWith<AccessTokenEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessTokenEntityCopyWith<$Res> {
  factory $AccessTokenEntityCopyWith(
          AccessTokenEntity value, $Res Function(AccessTokenEntity) then) =
      _$AccessTokenEntityCopyWithImpl<$Res, AccessTokenEntity>;
  @useResult
  $Res call({String accessToken, String tokenType, int expiresIn});
}

/// @nodoc
class _$AccessTokenEntityCopyWithImpl<$Res, $Val extends AccessTokenEntity>
    implements $AccessTokenEntityCopyWith<$Res> {
  _$AccessTokenEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? expiresIn = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AccessTokenEntityImplCopyWith<$Res>
    implements $AccessTokenEntityCopyWith<$Res> {
  factory _$$AccessTokenEntityImplCopyWith(_$AccessTokenEntityImpl value,
          $Res Function(_$AccessTokenEntityImpl) then) =
      __$$AccessTokenEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String tokenType, int expiresIn});
}

/// @nodoc
class __$$AccessTokenEntityImplCopyWithImpl<$Res>
    extends _$AccessTokenEntityCopyWithImpl<$Res, _$AccessTokenEntityImpl>
    implements _$$AccessTokenEntityImplCopyWith<$Res> {
  __$$AccessTokenEntityImplCopyWithImpl(_$AccessTokenEntityImpl _value,
      $Res Function(_$AccessTokenEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? tokenType = null,
    Object? expiresIn = null,
  }) {
    return _then(_$AccessTokenEntityImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      tokenType: null == tokenType
          ? _value.tokenType
          : tokenType // ignore: cast_nullable_to_non_nullable
              as String,
      expiresIn: null == expiresIn
          ? _value.expiresIn
          : expiresIn // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AccessTokenEntityImpl implements _AccessTokenEntity {
  const _$AccessTokenEntityImpl(
      {required this.accessToken,
      required this.tokenType,
      required this.expiresIn});

  @override
  final String accessToken;
  @override
  final String tokenType;
  @override
  final int expiresIn;

  @override
  String toString() {
    return 'AccessTokenEntity(accessToken: $accessToken, tokenType: $tokenType, expiresIn: $expiresIn)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessTokenEntityImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.tokenType, tokenType) ||
                other.tokenType == tokenType) &&
            (identical(other.expiresIn, expiresIn) ||
                other.expiresIn == expiresIn));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, accessToken, tokenType, expiresIn);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessTokenEntityImplCopyWith<_$AccessTokenEntityImpl> get copyWith =>
      __$$AccessTokenEntityImplCopyWithImpl<_$AccessTokenEntityImpl>(
          this, _$identity);
}

abstract class _AccessTokenEntity implements AccessTokenEntity {
  const factory _AccessTokenEntity(
      {required final String accessToken,
      required final String tokenType,
      required final int expiresIn}) = _$AccessTokenEntityImpl;

  @override
  String get accessToken;
  @override
  String get tokenType;
  @override
  int get expiresIn;
  @override
  @JsonKey(ignore: true)
  _$$AccessTokenEntityImplCopyWith<_$AccessTokenEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
