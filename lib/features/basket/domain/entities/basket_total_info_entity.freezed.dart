// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_total_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BasketTotalInfoEntity {
  int get total => throw _privateConstructorUsedError;
  int get discountPrice => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BasketTotalInfoEntityCopyWith<BasketTotalInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasketTotalInfoEntityCopyWith<$Res> {
  factory $BasketTotalInfoEntityCopyWith(BasketTotalInfoEntity value,
          $Res Function(BasketTotalInfoEntity) then) =
      _$BasketTotalInfoEntityCopyWithImpl<$Res, BasketTotalInfoEntity>;
  @useResult
  $Res call({int total, int discountPrice});
}

/// @nodoc
class _$BasketTotalInfoEntityCopyWithImpl<$Res,
        $Val extends BasketTotalInfoEntity>
    implements $BasketTotalInfoEntityCopyWith<$Res> {
  _$BasketTotalInfoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? discountPrice = null,
  }) {
    return _then(_value.copyWith(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BasketTotalInfoEntityImplCopyWith<$Res>
    implements $BasketTotalInfoEntityCopyWith<$Res> {
  factory _$$BasketTotalInfoEntityImplCopyWith(
          _$BasketTotalInfoEntityImpl value,
          $Res Function(_$BasketTotalInfoEntityImpl) then) =
      __$$BasketTotalInfoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int total, int discountPrice});
}

/// @nodoc
class __$$BasketTotalInfoEntityImplCopyWithImpl<$Res>
    extends _$BasketTotalInfoEntityCopyWithImpl<$Res,
        _$BasketTotalInfoEntityImpl>
    implements _$$BasketTotalInfoEntityImplCopyWith<$Res> {
  __$$BasketTotalInfoEntityImplCopyWithImpl(_$BasketTotalInfoEntityImpl _value,
      $Res Function(_$BasketTotalInfoEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? discountPrice = null,
  }) {
    return _then(_$BasketTotalInfoEntityImpl(
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BasketTotalInfoEntityImpl implements _BasketTotalInfoEntity {
  const _$BasketTotalInfoEntityImpl(
      {required this.total, required this.discountPrice});

  @override
  final int total;
  @override
  final int discountPrice;

  @override
  String toString() {
    return 'BasketTotalInfoEntity(total: $total, discountPrice: $discountPrice)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasketTotalInfoEntityImpl &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice));
  }

  @override
  int get hashCode => Object.hash(runtimeType, total, discountPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasketTotalInfoEntityImplCopyWith<_$BasketTotalInfoEntityImpl>
      get copyWith => __$$BasketTotalInfoEntityImplCopyWithImpl<
          _$BasketTotalInfoEntityImpl>(this, _$identity);
}

abstract class _BasketTotalInfoEntity implements BasketTotalInfoEntity {
  const factory _BasketTotalInfoEntity(
      {required final int total,
      required final int discountPrice}) = _$BasketTotalInfoEntityImpl;

  @override
  int get total;
  @override
  int get discountPrice;
  @override
  @JsonKey(ignore: true)
  _$$BasketTotalInfoEntityImplCopyWith<_$BasketTotalInfoEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
