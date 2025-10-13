// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_code_status_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GetCodeStatusEntity {
  String get message => throw _privateConstructorUsedError;
  int? get expired => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GetCodeStatusEntityCopyWith<GetCodeStatusEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetCodeStatusEntityCopyWith<$Res> {
  factory $GetCodeStatusEntityCopyWith(
          GetCodeStatusEntity value, $Res Function(GetCodeStatusEntity) then) =
      _$GetCodeStatusEntityCopyWithImpl<$Res, GetCodeStatusEntity>;
  @useResult
  $Res call({String message, int? expired});
}

/// @nodoc
class _$GetCodeStatusEntityCopyWithImpl<$Res, $Val extends GetCodeStatusEntity>
    implements $GetCodeStatusEntityCopyWith<$Res> {
  _$GetCodeStatusEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? expired = freezed,
  }) {
    return _then(_value.copyWith(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      expired: freezed == expired
          ? _value.expired
          : expired // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetCodeStatusEntityImplCopyWith<$Res>
    implements $GetCodeStatusEntityCopyWith<$Res> {
  factory _$$GetCodeStatusEntityImplCopyWith(_$GetCodeStatusEntityImpl value,
          $Res Function(_$GetCodeStatusEntityImpl) then) =
      __$$GetCodeStatusEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, int? expired});
}

/// @nodoc
class __$$GetCodeStatusEntityImplCopyWithImpl<$Res>
    extends _$GetCodeStatusEntityCopyWithImpl<$Res, _$GetCodeStatusEntityImpl>
    implements _$$GetCodeStatusEntityImplCopyWith<$Res> {
  __$$GetCodeStatusEntityImplCopyWithImpl(_$GetCodeStatusEntityImpl _value,
      $Res Function(_$GetCodeStatusEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? expired = freezed,
  }) {
    return _then(_$GetCodeStatusEntityImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      expired: freezed == expired
          ? _value.expired
          : expired // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$GetCodeStatusEntityImpl implements _GetCodeStatusEntity {
  const _$GetCodeStatusEntityImpl({required this.message, this.expired});

  @override
  final String message;
  @override
  final int? expired;

  @override
  String toString() {
    return 'GetCodeStatusEntity(message: $message, expired: $expired)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetCodeStatusEntityImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.expired, expired) || other.expired == expired));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, expired);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetCodeStatusEntityImplCopyWith<_$GetCodeStatusEntityImpl> get copyWith =>
      __$$GetCodeStatusEntityImplCopyWithImpl<_$GetCodeStatusEntityImpl>(
          this, _$identity);
}

abstract class _GetCodeStatusEntity implements GetCodeStatusEntity {
  const factory _GetCodeStatusEntity(
      {required final String message,
      final int? expired}) = _$GetCodeStatusEntityImpl;

  @override
  String get message;
  @override
  int? get expired;
  @override
  @JsonKey(ignore: true)
  _$$GetCodeStatusEntityImplCopyWith<_$GetCodeStatusEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
