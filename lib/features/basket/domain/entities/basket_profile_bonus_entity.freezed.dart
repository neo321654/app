// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'basket_profile_bonus_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BasketProfileBonusEntity {
  int get totalBonus => throw _privateConstructorUsedError;
  int? get availableBonus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BasketProfileBonusEntityCopyWith<BasketProfileBonusEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BasketProfileBonusEntityCopyWith<$Res> {
  factory $BasketProfileBonusEntityCopyWith(BasketProfileBonusEntity value,
          $Res Function(BasketProfileBonusEntity) then) =
      _$BasketProfileBonusEntityCopyWithImpl<$Res, BasketProfileBonusEntity>;
  @useResult
  $Res call({int totalBonus, int? availableBonus});
}

/// @nodoc
class _$BasketProfileBonusEntityCopyWithImpl<$Res,
        $Val extends BasketProfileBonusEntity>
    implements $BasketProfileBonusEntityCopyWith<$Res> {
  _$BasketProfileBonusEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBonus = null,
    Object? availableBonus = freezed,
  }) {
    return _then(_value.copyWith(
      totalBonus: null == totalBonus
          ? _value.totalBonus
          : totalBonus // ignore: cast_nullable_to_non_nullable
              as int,
      availableBonus: freezed == availableBonus
          ? _value.availableBonus
          : availableBonus // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BasketProfileBonusEntityImplCopyWith<$Res>
    implements $BasketProfileBonusEntityCopyWith<$Res> {
  factory _$$BasketProfileBonusEntityImplCopyWith(
          _$BasketProfileBonusEntityImpl value,
          $Res Function(_$BasketProfileBonusEntityImpl) then) =
      __$$BasketProfileBonusEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int totalBonus, int? availableBonus});
}

/// @nodoc
class __$$BasketProfileBonusEntityImplCopyWithImpl<$Res>
    extends _$BasketProfileBonusEntityCopyWithImpl<$Res,
        _$BasketProfileBonusEntityImpl>
    implements _$$BasketProfileBonusEntityImplCopyWith<$Res> {
  __$$BasketProfileBonusEntityImplCopyWithImpl(
      _$BasketProfileBonusEntityImpl _value,
      $Res Function(_$BasketProfileBonusEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalBonus = null,
    Object? availableBonus = freezed,
  }) {
    return _then(_$BasketProfileBonusEntityImpl(
      totalBonus: null == totalBonus
          ? _value.totalBonus
          : totalBonus // ignore: cast_nullable_to_non_nullable
              as int,
      availableBonus: freezed == availableBonus
          ? _value.availableBonus
          : availableBonus // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$BasketProfileBonusEntityImpl implements _BasketProfileBonusEntity {
  const _$BasketProfileBonusEntityImpl(
      {required this.totalBonus, this.availableBonus});

  @override
  final int totalBonus;
  @override
  final int? availableBonus;

  @override
  String toString() {
    return 'BasketProfileBonusEntity(totalBonus: $totalBonus, availableBonus: $availableBonus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BasketProfileBonusEntityImpl &&
            (identical(other.totalBonus, totalBonus) ||
                other.totalBonus == totalBonus) &&
            (identical(other.availableBonus, availableBonus) ||
                other.availableBonus == availableBonus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, totalBonus, availableBonus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BasketProfileBonusEntityImplCopyWith<_$BasketProfileBonusEntityImpl>
      get copyWith => __$$BasketProfileBonusEntityImplCopyWithImpl<
          _$BasketProfileBonusEntityImpl>(this, _$identity);
}

abstract class _BasketProfileBonusEntity implements BasketProfileBonusEntity {
  const factory _BasketProfileBonusEntity(
      {required final int totalBonus,
      final int? availableBonus}) = _$BasketProfileBonusEntityImpl;

  @override
  int get totalBonus;
  @override
  int? get availableBonus;
  @override
  @JsonKey(ignore: true)
  _$$BasketProfileBonusEntityImplCopyWith<_$BasketProfileBonusEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
