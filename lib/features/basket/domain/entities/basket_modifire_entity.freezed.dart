// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_modifire_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BasketModifireEntity {
  int get id => throw _privateConstructorUsedError;
  int get qnt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BasketModifireEntityCopyWith<BasketModifireEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasketModifireEntityCopyWith<$Res> {
  factory $BasketModifireEntityCopyWith(BasketModifireEntity value,
          $Res Function(BasketModifireEntity) then) =
      _$BasketModifireEntityCopyWithImpl<$Res, BasketModifireEntity>;
  @useResult
  $Res call({int id, int qnt});
}

/// @nodoc
class _$BasketModifireEntityCopyWithImpl<$Res,
        $Val extends BasketModifireEntity>
    implements $BasketModifireEntityCopyWith<$Res> {
  _$BasketModifireEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? qnt = null,
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
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BasketModifireEntityImplCopyWith<$Res>
    implements $BasketModifireEntityCopyWith<$Res> {
  factory _$$BasketModifireEntityImplCopyWith(_$BasketModifireEntityImpl value,
          $Res Function(_$BasketModifireEntityImpl) then) =
      __$$BasketModifireEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, int qnt});
}

/// @nodoc
class __$$BasketModifireEntityImplCopyWithImpl<$Res>
    extends _$BasketModifireEntityCopyWithImpl<$Res, _$BasketModifireEntityImpl>
    implements _$$BasketModifireEntityImplCopyWith<$Res> {
  __$$BasketModifireEntityImplCopyWithImpl(_$BasketModifireEntityImpl _value,
      $Res Function(_$BasketModifireEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? qnt = null,
  }) {
    return _then(_$BasketModifireEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      qnt: null == qnt
          ? _value.qnt
          : qnt // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$BasketModifireEntityImpl implements _BasketModifireEntity {
  const _$BasketModifireEntityImpl({required this.id, required this.qnt});

  @override
  final int id;
  @override
  final int qnt;

  @override
  String toString() {
    return 'BasketModifireEntity(id: $id, qnt: $qnt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasketModifireEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.qnt, qnt) || other.qnt == qnt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, qnt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasketModifireEntityImplCopyWith<_$BasketModifireEntityImpl>
      get copyWith =>
          __$$BasketModifireEntityImplCopyWithImpl<_$BasketModifireEntityImpl>(
              this, _$identity);
}

abstract class _BasketModifireEntity implements BasketModifireEntity {
  const factory _BasketModifireEntity(
      {required final int id,
      required final int qnt}) = _$BasketModifireEntityImpl;

  @override
  int get id;
  @override
  int get qnt;
  @override
  @JsonKey(ignore: true)
  _$$BasketModifireEntityImplCopyWith<_$BasketModifireEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
