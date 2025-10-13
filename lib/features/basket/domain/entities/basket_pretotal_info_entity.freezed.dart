// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_pretotal_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BasketPretotalnfoEntity {
  String get title => throw _privateConstructorUsedError;
  String get value => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BasketPretotalnfoEntityCopyWith<BasketPretotalnfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasketPretotalnfoEntityCopyWith<$Res> {
  factory $BasketPretotalnfoEntityCopyWith(BasketPretotalnfoEntity value,
          $Res Function(BasketPretotalnfoEntity) then) =
      _$BasketPretotalnfoEntityCopyWithImpl<$Res, BasketPretotalnfoEntity>;
  @useResult
  $Res call({String title, String value});
}

/// @nodoc
class _$BasketPretotalnfoEntityCopyWithImpl<$Res,
        $Val extends BasketPretotalnfoEntity>
    implements $BasketPretotalnfoEntityCopyWith<$Res> {
  _$BasketPretotalnfoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BasketPretotalnfoEntityImplCopyWith<$Res>
    implements $BasketPretotalnfoEntityCopyWith<$Res> {
  factory _$$BasketPretotalnfoEntityImplCopyWith(
          _$BasketPretotalnfoEntityImpl value,
          $Res Function(_$BasketPretotalnfoEntityImpl) then) =
      __$$BasketPretotalnfoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String value});
}

/// @nodoc
class __$$BasketPretotalnfoEntityImplCopyWithImpl<$Res>
    extends _$BasketPretotalnfoEntityCopyWithImpl<$Res,
        _$BasketPretotalnfoEntityImpl>
    implements _$$BasketPretotalnfoEntityImplCopyWith<$Res> {
  __$$BasketPretotalnfoEntityImplCopyWithImpl(
      _$BasketPretotalnfoEntityImpl _value,
      $Res Function(_$BasketPretotalnfoEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? value = null,
  }) {
    return _then(_$BasketPretotalnfoEntityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BasketPretotalnfoEntityImpl implements _BasketPretotalnfoEntity {
  const _$BasketPretotalnfoEntityImpl(
      {required this.title, required this.value});

  @override
  final String title;
  @override
  final String value;

  @override
  String toString() {
    return 'BasketPretotalnfoEntity(title: $title, value: $value)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasketPretotalnfoEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasketPretotalnfoEntityImplCopyWith<_$BasketPretotalnfoEntityImpl>
      get copyWith => __$$BasketPretotalnfoEntityImplCopyWithImpl<
          _$BasketPretotalnfoEntityImpl>(this, _$identity);
}

abstract class _BasketPretotalnfoEntity implements BasketPretotalnfoEntity {
  const factory _BasketPretotalnfoEntity(
      {required final String title,
      required final String value}) = _$BasketPretotalnfoEntityImpl;

  @override
  String get title;
  @override
  String get value;
  @override
  @JsonKey(ignore: true)
  _$$BasketPretotalnfoEntityImplCopyWith<_$BasketPretotalnfoEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
