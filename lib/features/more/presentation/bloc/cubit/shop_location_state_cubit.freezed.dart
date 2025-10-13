// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'shop_location_state_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ShopLocationStateState {
  String get showMode => throw _privateConstructorUsedError;
  ShopEntity? get showShopMap => throw _privateConstructorUsedError;
  GeoSuggestionEntity? get geoSuggestion => throw _privateConstructorUsedError;
  CityEntity? get city => throw _privateConstructorUsedError;
  List<ShopEntity> get shops => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ShopLocationStateStateCopyWith<ShopLocationStateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ShopLocationStateStateCopyWith<$Res> {
  factory $ShopLocationStateStateCopyWith(ShopLocationStateState value,
          $Res Function(ShopLocationStateState) then) =
      _$ShopLocationStateStateCopyWithImpl<$Res, ShopLocationStateState>;
  @useResult
  $Res call(
      {String showMode,
      ShopEntity? showShopMap,
      GeoSuggestionEntity? geoSuggestion,
      CityEntity? city,
      List<ShopEntity> shops});
}

/// @nodoc
class _$ShopLocationStateStateCopyWithImpl<$Res,
        $Val extends ShopLocationStateState>
    implements $ShopLocationStateStateCopyWith<$Res> {
  _$ShopLocationStateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showMode = null,
    Object? showShopMap = freezed,
    Object? geoSuggestion = freezed,
    Object? city = freezed,
    Object? shops = null,
  }) {
    return _then(_value.copyWith(
      showMode: null == showMode
          ? _value.showMode
          : showMode // ignore: cast_nullable_to_non_nullable
              as String,
      showShopMap: freezed == showShopMap
          ? _value.showShopMap
          : showShopMap // ignore: cast_nullable_to_non_nullable
              as ShopEntity?,
      geoSuggestion: freezed == geoSuggestion
          ? _value.geoSuggestion
          : geoSuggestion // ignore: cast_nullable_to_non_nullable
              as GeoSuggestionEntity?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as CityEntity?,
      shops: null == shops
          ? _value.shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<ShopEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ShopLocationStateStateImplCopyWith<$Res>
    implements $ShopLocationStateStateCopyWith<$Res> {
  factory _$$ShopLocationStateStateImplCopyWith(
          _$ShopLocationStateStateImpl value,
          $Res Function(_$ShopLocationStateStateImpl) then) =
      __$$ShopLocationStateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String showMode,
      ShopEntity? showShopMap,
      GeoSuggestionEntity? geoSuggestion,
      CityEntity? city,
      List<ShopEntity> shops});
}

/// @nodoc
class __$$ShopLocationStateStateImplCopyWithImpl<$Res>
    extends _$ShopLocationStateStateCopyWithImpl<$Res,
        _$ShopLocationStateStateImpl>
    implements _$$ShopLocationStateStateImplCopyWith<$Res> {
  __$$ShopLocationStateStateImplCopyWithImpl(
      _$ShopLocationStateStateImpl _value,
      $Res Function(_$ShopLocationStateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? showMode = null,
    Object? showShopMap = freezed,
    Object? geoSuggestion = freezed,
    Object? city = freezed,
    Object? shops = null,
  }) {
    return _then(_$ShopLocationStateStateImpl(
      showMode: null == showMode
          ? _value.showMode
          : showMode // ignore: cast_nullable_to_non_nullable
              as String,
      showShopMap: freezed == showShopMap
          ? _value.showShopMap
          : showShopMap // ignore: cast_nullable_to_non_nullable
              as ShopEntity?,
      geoSuggestion: freezed == geoSuggestion
          ? _value.geoSuggestion
          : geoSuggestion // ignore: cast_nullable_to_non_nullable
              as GeoSuggestionEntity?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as CityEntity?,
      shops: null == shops
          ? _value._shops
          : shops // ignore: cast_nullable_to_non_nullable
              as List<ShopEntity>,
    ));
  }
}

/// @nodoc

class _$ShopLocationStateStateImpl implements _ShopLocationStateState {
  const _$ShopLocationStateStateImpl(
      {this.showMode = 'list',
      this.showShopMap,
      this.geoSuggestion,
      this.city,
      final List<ShopEntity> shops = const []})
      : _shops = shops;

  @override
  @JsonKey()
  final String showMode;
  @override
  final ShopEntity? showShopMap;
  @override
  final GeoSuggestionEntity? geoSuggestion;
  @override
  final CityEntity? city;
  final List<ShopEntity> _shops;
  @override
  @JsonKey()
  List<ShopEntity> get shops {
    if (_shops is EqualUnmodifiableListView) return _shops;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shops);
  }

  @override
  String toString() {
    return 'ShopLocationStateState(showMode: $showMode, showShopMap: $showShopMap, geoSuggestion: $geoSuggestion, city: $city, shops: $shops)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ShopLocationStateStateImpl &&
            (identical(other.showMode, showMode) ||
                other.showMode == showMode) &&
            (identical(other.showShopMap, showShopMap) ||
                other.showShopMap == showShopMap) &&
            (identical(other.geoSuggestion, geoSuggestion) ||
                other.geoSuggestion == geoSuggestion) &&
            (identical(other.city, city) || other.city == city) &&
            const DeepCollectionEquality().equals(other._shops, _shops));
  }

  @override
  int get hashCode => Object.hash(runtimeType, showMode, showShopMap,
      geoSuggestion, city, const DeepCollectionEquality().hash(_shops));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ShopLocationStateStateImplCopyWith<_$ShopLocationStateStateImpl>
      get copyWith => __$$ShopLocationStateStateImplCopyWithImpl<
          _$ShopLocationStateStateImpl>(this, _$identity);
}

abstract class _ShopLocationStateState implements ShopLocationStateState {
  const factory _ShopLocationStateState(
      {final String showMode,
      final ShopEntity? showShopMap,
      final GeoSuggestionEntity? geoSuggestion,
      final CityEntity? city,
      final List<ShopEntity> shops}) = _$ShopLocationStateStateImpl;

  @override
  String get showMode;
  @override
  ShopEntity? get showShopMap;
  @override
  GeoSuggestionEntity? get geoSuggestion;
  @override
  CityEntity? get city;
  @override
  List<ShopEntity> get shops;
  @override
  @JsonKey(ignore: true)
  _$$ShopLocationStateStateImplCopyWith<_$ShopLocationStateStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
