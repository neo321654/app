// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_info_request_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BasketInfoRequestEntity {
  int get id => throw _privateConstructorUsedError;
  int get qnt => throw _privateConstructorUsedError;
  List<BasketModifireEntity> get modifiers =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BasketInfoRequestEntityCopyWith<BasketInfoRequestEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasketInfoRequestEntityCopyWith<$Res> {
  factory $BasketInfoRequestEntityCopyWith(BasketInfoRequestEntity value,
          $Res Function(BasketInfoRequestEntity) then) =
      _$BasketInfoRequestEntityCopyWithImpl<$Res, BasketInfoRequestEntity>;
  @useResult
  $Res call({int id, int qnt, List<BasketModifireEntity> modifiers});
}

/// @nodoc
class _$BasketInfoRequestEntityCopyWithImpl<$Res,
        $Val extends BasketInfoRequestEntity>
    implements $BasketInfoRequestEntityCopyWith<$Res> {
  _$BasketInfoRequestEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? qnt = null,
    Object? modifiers = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      qnt: null == qnt
          ? _value.qnt
          : qnt // ignore: cast_nullable_to_non_nullable
              as int,
      modifiers: null == modifiers
          ? _value.modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<BasketModifireEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BasketInfoRequestEntityImplCopyWith<$Res>
    implements $BasketInfoRequestEntityCopyWith<$Res> {
  factory _$$BasketInfoRequestEntityImplCopyWith(
          _$BasketInfoRequestEntityImpl value,
          $Res Function(_$BasketInfoRequestEntityImpl) then) =
      __$$BasketInfoRequestEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int qnt, List<BasketModifireEntity> modifiers});
}

/// @nodoc
class __$$BasketInfoRequestEntityImplCopyWithImpl<$Res>
    extends _$BasketInfoRequestEntityCopyWithImpl<$Res,
        _$BasketInfoRequestEntityImpl>
    implements _$$BasketInfoRequestEntityImplCopyWith<$Res> {
  __$$BasketInfoRequestEntityImplCopyWithImpl(
      _$BasketInfoRequestEntityImpl _value,
      $Res Function(_$BasketInfoRequestEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? qnt = null,
    Object? modifiers = null,
  }) {
    return _then(_$BasketInfoRequestEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      qnt: null == qnt
          ? _value.qnt
          : qnt // ignore: cast_nullable_to_non_nullable
              as int,
      modifiers: null == modifiers
          ? _value._modifiers
          : modifiers // ignore: cast_nullable_to_non_nullable
              as List<BasketModifireEntity>,
    ));
  }
}

/// @nodoc

class _$BasketInfoRequestEntityImpl implements _BasketInfoRequestEntity {
  const _$BasketInfoRequestEntityImpl(
      {required this.id,
      required this.qnt,
      final List<BasketModifireEntity> modifiers = const []})
      : _modifiers = modifiers;

  @override
  final int id;
  @override
  final int qnt;
  final List<BasketModifireEntity> _modifiers;
  @override
  @JsonKey()
  List<BasketModifireEntity> get modifiers {
    if (_modifiers is EqualUnmodifiableListView) return _modifiers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_modifiers);
  }

  @override
  String toString() {
    return 'BasketInfoRequestEntity(id: $id, qnt: $qnt, modifiers: $modifiers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasketInfoRequestEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.qnt, qnt) || other.qnt == qnt) &&
            const DeepCollectionEquality()
                .equals(other._modifiers, _modifiers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, qnt, const DeepCollectionEquality().hash(_modifiers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasketInfoRequestEntityImplCopyWith<_$BasketInfoRequestEntityImpl>
      get copyWith => __$$BasketInfoRequestEntityImplCopyWithImpl<
          _$BasketInfoRequestEntityImpl>(this, _$identity);
}

abstract class _BasketInfoRequestEntity implements BasketInfoRequestEntity {
  const factory _BasketInfoRequestEntity(
          {required final int id,
          required final int qnt,
          final List<BasketModifireEntity> modifiers}) =
      _$BasketInfoRequestEntityImpl;

  @override
  int get id;
  @override
  int get qnt;
  @override
  List<BasketModifireEntity> get modifiers;
  @override
  @JsonKey(ignore: true)
  _$$BasketInfoRequestEntityImplCopyWith<_$BasketInfoRequestEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
