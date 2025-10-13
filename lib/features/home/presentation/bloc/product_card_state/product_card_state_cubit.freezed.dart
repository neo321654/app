// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_card_state_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProductCardStateState {
  ProductEntity get product => throw _privateConstructorUsedError;
  Map<int, int> get selectedQuantities => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductCardStateStateCopyWith<ProductCardStateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductCardStateStateCopyWith<$Res> {
  factory $ProductCardStateStateCopyWith(ProductCardStateState value,
          $Res Function(ProductCardStateState) then) =
      _$ProductCardStateStateCopyWithImpl<$Res, ProductCardStateState>;
  @useResult
  $Res call({ProductEntity product, Map<int, int> selectedQuantities});
}

/// @nodoc
class _$ProductCardStateStateCopyWithImpl<$Res,
        $Val extends ProductCardStateState>
    implements $ProductCardStateStateCopyWith<$Res> {
  _$ProductCardStateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? selectedQuantities = null,
  }) {
    return _then(_value.copyWith(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductEntity,
      selectedQuantities: null == selectedQuantities
          ? _value.selectedQuantities
          : selectedQuantities // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductCardStateStateImplCopyWith<$Res>
    implements $ProductCardStateStateCopyWith<$Res> {
  factory _$$ProductCardStateStateImplCopyWith(
          _$ProductCardStateStateImpl value,
          $Res Function(_$ProductCardStateStateImpl) then) =
      __$$ProductCardStateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProductEntity product, Map<int, int> selectedQuantities});
}

/// @nodoc
class __$$ProductCardStateStateImplCopyWithImpl<$Res>
    extends _$ProductCardStateStateCopyWithImpl<$Res,
        _$ProductCardStateStateImpl>
    implements _$$ProductCardStateStateImplCopyWith<$Res> {
  __$$ProductCardStateStateImplCopyWithImpl(_$ProductCardStateStateImpl _value,
      $Res Function(_$ProductCardStateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? product = null,
    Object? selectedQuantities = null,
  }) {
    return _then(_$ProductCardStateStateImpl(
      product: null == product
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductEntity,
      selectedQuantities: null == selectedQuantities
          ? _value._selectedQuantities
          : selectedQuantities // ignore: cast_nullable_to_non_nullable
              as Map<int, int>,
    ));
  }
}

/// @nodoc

class _$ProductCardStateStateImpl implements _ProductCardStateState {
  const _$ProductCardStateStateImpl(
      {required this.product,
      final Map<int, int> selectedQuantities = const {}})
      : _selectedQuantities = selectedQuantities;

  @override
  final ProductEntity product;
  final Map<int, int> _selectedQuantities;
  @override
  @JsonKey()
  Map<int, int> get selectedQuantities {
    if (_selectedQuantities is EqualUnmodifiableMapView)
      return _selectedQuantities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_selectedQuantities);
  }

  @override
  String toString() {
    return 'ProductCardStateState(product: $product, selectedQuantities: $selectedQuantities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductCardStateStateImpl &&
            (identical(other.product, product) || other.product == product) &&
            const DeepCollectionEquality()
                .equals(other._selectedQuantities, _selectedQuantities));
  }

  @override
  int get hashCode => Object.hash(runtimeType, product,
      const DeepCollectionEquality().hash(_selectedQuantities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductCardStateStateImplCopyWith<_$ProductCardStateStateImpl>
      get copyWith => __$$ProductCardStateStateImplCopyWithImpl<
          _$ProductCardStateStateImpl>(this, _$identity);
}

abstract class _ProductCardStateState implements ProductCardStateState {
  const factory _ProductCardStateState(
      {required final ProductEntity product,
      final Map<int, int> selectedQuantities}) = _$ProductCardStateStateImpl;

  @override
  ProductEntity get product;
  @override
  Map<int, int> get selectedQuantities;
  @override
  @JsonKey(ignore: true)
  _$$ProductCardStateStateImplCopyWith<_$ProductCardStateStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
