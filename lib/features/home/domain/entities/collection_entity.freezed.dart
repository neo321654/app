// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collection_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CollectionEntity {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get picture => throw _privateConstructorUsedError;
  List<ProductEntity>? get products => throw _privateConstructorUsedError;
  bool get isCollection => throw _privateConstructorUsedError;
  String? get color => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CollectionEntityCopyWith<CollectionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollectionEntityCopyWith<$Res> {
  factory $CollectionEntityCopyWith(
          CollectionEntity value, $Res Function(CollectionEntity) then) =
      _$CollectionEntityCopyWithImpl<$Res, CollectionEntity>;
  @useResult
  $Res call(
      {int id,
      String title,
      String picture,
      List<ProductEntity>? products,
      bool isCollection,
      String? color});
}

/// @nodoc
class _$CollectionEntityCopyWithImpl<$Res, $Val extends CollectionEntity>
    implements $CollectionEntityCopyWith<$Res> {
  _$CollectionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? picture = null,
    Object? products = freezed,
    Object? isCollection = null,
    Object? color = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      products: freezed == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>?,
      isCollection: null == isCollection
          ? _value.isCollection
          : isCollection // ignore: cast_nullable_to_non_nullable
              as bool,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollectionEntityImplCopyWith<$Res>
    implements $CollectionEntityCopyWith<$Res> {
  factory _$$CollectionEntityImplCopyWith(_$CollectionEntityImpl value,
          $Res Function(_$CollectionEntityImpl) then) =
      __$$CollectionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String picture,
      List<ProductEntity>? products,
      bool isCollection,
      String? color});
}

/// @nodoc
class __$$CollectionEntityImplCopyWithImpl<$Res>
    extends _$CollectionEntityCopyWithImpl<$Res, _$CollectionEntityImpl>
    implements _$$CollectionEntityImplCopyWith<$Res> {
  __$$CollectionEntityImplCopyWithImpl(_$CollectionEntityImpl _value,
      $Res Function(_$CollectionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? picture = null,
    Object? products = freezed,
    Object? isCollection = null,
    Object? color = freezed,
  }) {
    return _then(_$CollectionEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      picture: null == picture
          ? _value.picture
          : picture // ignore: cast_nullable_to_non_nullable
              as String,
      products: freezed == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductEntity>?,
      isCollection: null == isCollection
          ? _value.isCollection
          : isCollection // ignore: cast_nullable_to_non_nullable
              as bool,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$CollectionEntityImpl implements _CollectionEntity {
  const _$CollectionEntityImpl(
      {required this.id,
      required this.title,
      required this.picture,
      final List<ProductEntity>? products,
      required this.isCollection,
      this.color})
      : _products = products;

  @override
  final int id;
  @override
  final String title;
  @override
  final String picture;
  final List<ProductEntity>? _products;
  @override
  List<ProductEntity>? get products {
    final value = _products;
    if (value == null) return null;
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool isCollection;
  @override
  final String? color;

  @override
  String toString() {
    return 'CollectionEntity(id: $id, title: $title, picture: $picture, products: $products, isCollection: $isCollection, color: $color)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollectionEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.picture, picture) || other.picture == picture) &&
            const DeepCollectionEquality().equals(other._products, _products) &&
            (identical(other.isCollection, isCollection) ||
                other.isCollection == isCollection) &&
            (identical(other.color, color) || other.color == color));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, picture,
      const DeepCollectionEquality().hash(_products), isCollection, color);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollectionEntityImplCopyWith<_$CollectionEntityImpl> get copyWith =>
      __$$CollectionEntityImplCopyWithImpl<_$CollectionEntityImpl>(
          this, _$identity);
}

abstract class _CollectionEntity implements CollectionEntity {
  const factory _CollectionEntity(
      {required final int id,
      required final String title,
      required final String picture,
      final List<ProductEntity>? products,
      required final bool isCollection,
      final String? color}) = _$CollectionEntityImpl;

  @override
  int get id;
  @override
  String get title;
  @override
  String get picture;
  @override
  List<ProductEntity>? get products;
  @override
  bool get isCollection;
  @override
  String? get color;
  @override
  @JsonKey(ignore: true)
  _$$CollectionEntityImplCopyWith<_$CollectionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
