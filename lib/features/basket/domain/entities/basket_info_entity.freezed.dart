// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BasketInfoEntity {
  List<ProductEntity> get products => throw _privateConstructorUsedError;
  BasketTotalInfoEntity get totalInfo => throw _privateConstructorUsedError;
  List<BasketPretotalnfoEntity> get pretotalInfo =>
      throw _privateConstructorUsedError;
  BasketPretotalnfoEntity get bonusInfo => throw _privateConstructorUsedError;
  List<String> get warnings => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BasketInfoEntityCopyWith<BasketInfoEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasketInfoEntityCopyWith<$Res> {
  factory $BasketInfoEntityCopyWith(
          BasketInfoEntity value, $Res Function(BasketInfoEntity) then) =
      _$BasketInfoEntityCopyWithImpl<$Res, BasketInfoEntity>;
  @useResult
  $Res call(
      {List<ProductEntity> products,
      BasketTotalInfoEntity totalInfo,
      List<BasketPretotalnfoEntity> pretotalInfo,
      BasketPretotalnfoEntity bonusInfo,
      List<String> warnings});

  $BasketTotalInfoEntityCopyWith<$Res> get totalInfo;
  $BasketPretotalnfoEntityCopyWith<$Res> get bonusInfo;
}

/// @nodoc
class _$BasketInfoEntityCopyWithImpl<$Res, $Val extends BasketInfoEntity>
    implements $BasketInfoEntityCopyWith<$Res> {
  _$BasketInfoEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? totalInfo = null,
    Object? pretotalInfo = null,
    Object? bonusInfo = null,
    Object? warnings = null,
  }) {
    return _then(_value.copyWith(
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      totalInfo: null == totalInfo
          ? _value.totalInfo
          : totalInfo // ignore: cast_nullable_to_non_nullable
              as BasketTotalInfoEntity,
      pretotalInfo: null == pretotalInfo
          ? _value.pretotalInfo
          : pretotalInfo // ignore: cast_nullable_to_non_nullable
              as List<BasketPretotalnfoEntity>,
      bonusInfo: null == bonusInfo
          ? _value.bonusInfo
          : bonusInfo // ignore: cast_nullable_to_non_nullable
              as BasketPretotalnfoEntity,
      warnings: null == warnings
          ? _value.warnings
          : warnings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BasketTotalInfoEntityCopyWith<$Res> get totalInfo {
    return $BasketTotalInfoEntityCopyWith<$Res>(_value.totalInfo, (value) {
      return _then(_value.copyWith(totalInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BasketPretotalnfoEntityCopyWith<$Res> get bonusInfo {
    return $BasketPretotalnfoEntityCopyWith<$Res>(_value.bonusInfo, (value) {
      return _then(_value.copyWith(bonusInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BasketInfoEntityImplCopyWith<$Res>
    implements $BasketInfoEntityCopyWith<$Res> {
  factory _$$BasketInfoEntityImplCopyWith(_$BasketInfoEntityImpl value,
          $Res Function(_$BasketInfoEntityImpl) then) =
      __$$BasketInfoEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ProductEntity> products,
      BasketTotalInfoEntity totalInfo,
      List<BasketPretotalnfoEntity> pretotalInfo,
      BasketPretotalnfoEntity bonusInfo,
      List<String> warnings});

  @override
  $BasketTotalInfoEntityCopyWith<$Res> get totalInfo;
  @override
  $BasketPretotalnfoEntityCopyWith<$Res> get bonusInfo;
}

/// @nodoc
class __$$BasketInfoEntityImplCopyWithImpl<$Res>
    extends _$BasketInfoEntityCopyWithImpl<$Res, _$BasketInfoEntityImpl>
    implements _$$BasketInfoEntityImplCopyWith<$Res> {
  __$$BasketInfoEntityImplCopyWithImpl(_$BasketInfoEntityImpl _value,
      $Res Function(_$BasketInfoEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? products = null,
    Object? totalInfo = null,
    Object? pretotalInfo = null,
    Object? bonusInfo = null,
    Object? warnings = null,
  }) {
    return _then(_$BasketInfoEntityImpl(
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>,
      totalInfo: null == totalInfo
          ? _value.totalInfo
          : totalInfo // ignore: cast_nullable_to_non_nullable
              as BasketTotalInfoEntity,
      pretotalInfo: null == pretotalInfo
          ? _value._pretotalInfo
          : pretotalInfo // ignore: cast_nullable_to_non_nullable
              as List<BasketPretotalnfoEntity>,
      bonusInfo: null == bonusInfo
          ? _value.bonusInfo
          : bonusInfo // ignore: cast_nullable_to_non_nullable
              as BasketPretotalnfoEntity,
      warnings: null == warnings
          ? _value._warnings
          : warnings // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$BasketInfoEntityImpl implements _BasketInfoEntity {
  const _$BasketInfoEntityImpl(
      {required final List<ProductEntity> products,
      required this.totalInfo,
      required final List<BasketPretotalnfoEntity> pretotalInfo,
      required this.bonusInfo,
      required final List<String> warnings})
      : _products = products,
        _pretotalInfo = pretotalInfo,
        _warnings = warnings;

  final List<ProductEntity> _products;
  @override
  List<ProductEntity> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  final BasketTotalInfoEntity totalInfo;
  final List<BasketPretotalnfoEntity> _pretotalInfo;
  @override
  List<BasketPretotalnfoEntity> get pretotalInfo {
    if (_pretotalInfo is EqualUnmodifiableListView) return _pretotalInfo;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pretotalInfo);
  }

  @override
  final BasketPretotalnfoEntity bonusInfo;
  final List<String> _warnings;
  @override
  List<String> get warnings {
    if (_warnings is EqualUnmodifiableListView) return _warnings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_warnings);
  }

  @override
  String toString() {
    return 'BasketInfoEntity(products: $products, totalInfo: $totalInfo, pretotalInfo: $pretotalInfo, bonusInfo: $bonusInfo, warnings: $warnings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasketInfoEntityImpl &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.totalInfo, totalInfo) ||
                other.totalInfo == totalInfo) &&
            const DeepCollectionEquality()
                .equals(other._pretotalInfo, _pretotalInfo) &&
            (identical(other.bonusInfo, bonusInfo) ||
                other.bonusInfo == bonusInfo) &&
            const DeepCollectionEquality().equals(other._warnings, _warnings));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_products),
      totalInfo,
      const DeepCollectionEquality().hash(_pretotalInfo),
      bonusInfo,
      const DeepCollectionEquality().hash(_warnings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasketInfoEntityImplCopyWith<_$BasketInfoEntityImpl> get copyWith =>
      __$$BasketInfoEntityImplCopyWithImpl<_$BasketInfoEntityImpl>(
          this, _$identity);
}

abstract class _BasketInfoEntity implements BasketInfoEntity {
  const factory _BasketInfoEntity(
      {required final List<ProductEntity> products,
      required final BasketTotalInfoEntity totalInfo,
      required final List<BasketPretotalnfoEntity> pretotalInfo,
      required final BasketPretotalnfoEntity bonusInfo,
      required final List<String> warnings}) = _$BasketInfoEntityImpl;

  @override
  List<ProductEntity> get products;
  @override
  BasketTotalInfoEntity get totalInfo;
  @override
  List<BasketPretotalnfoEntity> get pretotalInfo;
  @override
  BasketPretotalnfoEntity get bonusInfo;
  @override
  List<String> get warnings;
  @override
  @JsonKey(ignore: true)
  _$$BasketInfoEntityImplCopyWith<_$BasketInfoEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
