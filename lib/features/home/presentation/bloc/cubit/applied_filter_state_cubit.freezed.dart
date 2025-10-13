// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'applied_filter_state_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppliedFilterStateState {
  List<TagEntity> get selectedTags => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppliedFilterStateStateCopyWith<AppliedFilterStateState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppliedFilterStateStateCopyWith<$Res> {
  factory $AppliedFilterStateStateCopyWith(AppliedFilterStateState value,
          $Res Function(AppliedFilterStateState) then) =
      _$AppliedFilterStateStateCopyWithImpl<$Res, AppliedFilterStateState>;
  @useResult
  $Res call({List<TagEntity> selectedTags});
}

/// @nodoc
class _$AppliedFilterStateStateCopyWithImpl<$Res,
        $Val extends AppliedFilterStateState>
    implements $AppliedFilterStateStateCopyWith<$Res> {
  _$AppliedFilterStateStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTags = null,
  }) {
    return _then(_value.copyWith(
      selectedTags: null == selectedTags
          ? _value.selectedTags
          : selectedTags // ignore: cast_nullable_to_non_nullable
              as List<TagEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppliedFilterStateStateImplCopyWith<$Res>
    implements $AppliedFilterStateStateCopyWith<$Res> {
  factory _$$AppliedFilterStateStateImplCopyWith(
          _$AppliedFilterStateStateImpl value,
          $Res Function(_$AppliedFilterStateStateImpl) then) =
      __$$AppliedFilterStateStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TagEntity> selectedTags});
}

/// @nodoc
class __$$AppliedFilterStateStateImplCopyWithImpl<$Res>
    extends _$AppliedFilterStateStateCopyWithImpl<$Res,
        _$AppliedFilterStateStateImpl>
    implements _$$AppliedFilterStateStateImplCopyWith<$Res> {
  __$$AppliedFilterStateStateImplCopyWithImpl(
      _$AppliedFilterStateStateImpl _value,
      $Res Function(_$AppliedFilterStateStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTags = null,
  }) {
    return _then(_$AppliedFilterStateStateImpl(
      selectedTags: null == selectedTags
          ? _value._selectedTags
          : selectedTags // ignore: cast_nullable_to_non_nullable
              as List<TagEntity>,
    ));
  }
}

/// @nodoc

class _$AppliedFilterStateStateImpl implements _AppliedFilterStateState {
  const _$AppliedFilterStateStateImpl(
      {final List<TagEntity> selectedTags = const []})
      : _selectedTags = selectedTags;

  final List<TagEntity> _selectedTags;
  @override
  @JsonKey()
  List<TagEntity> get selectedTags {
    if (_selectedTags is EqualUnmodifiableListView) return _selectedTags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedTags);
  }

  @override
  String toString() {
    return 'AppliedFilterStateState(selectedTags: $selectedTags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppliedFilterStateStateImpl &&
            const DeepCollectionEquality()
                .equals(other._selectedTags, _selectedTags));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_selectedTags));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AppliedFilterStateStateImplCopyWith<_$AppliedFilterStateStateImpl>
      get copyWith => __$$AppliedFilterStateStateImplCopyWithImpl<
          _$AppliedFilterStateStateImpl>(this, _$identity);
}

abstract class _AppliedFilterStateState implements AppliedFilterStateState {
  const factory _AppliedFilterStateState({final List<TagEntity> selectedTags}) =
      _$AppliedFilterStateStateImpl;

  @override
  List<TagEntity> get selectedTags;
  @override
  @JsonKey(ignore: true)
  _$$AppliedFilterStateStateImplCopyWith<_$AppliedFilterStateStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
