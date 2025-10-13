// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'geo_suggestion_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$GeoSuggestionState {
  List<GeoSuggestionEntity> get suggestions =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GeoSuggestionStateCopyWith<GeoSuggestionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeoSuggestionStateCopyWith<$Res> {
  factory $GeoSuggestionStateCopyWith(
          GeoSuggestionState value, $Res Function(GeoSuggestionState) then) =
      _$GeoSuggestionStateCopyWithImpl<$Res, GeoSuggestionState>;
  @useResult
  $Res call({List<GeoSuggestionEntity> suggestions});
}

/// @nodoc
class _$GeoSuggestionStateCopyWithImpl<$Res, $Val extends GeoSuggestionState>
    implements $GeoSuggestionStateCopyWith<$Res> {
  _$GeoSuggestionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestions = null,
  }) {
    return _then(_value.copyWith(
      suggestions: null == suggestions
          ? _value.suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<GeoSuggestionEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GeoSuggestionStateImplCopyWith<$Res>
    implements $GeoSuggestionStateCopyWith<$Res> {
  factory _$$GeoSuggestionStateImplCopyWith(_$GeoSuggestionStateImpl value,
          $Res Function(_$GeoSuggestionStateImpl) then) =
      __$$GeoSuggestionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<GeoSuggestionEntity> suggestions});
}

/// @nodoc
class __$$GeoSuggestionStateImplCopyWithImpl<$Res>
    extends _$GeoSuggestionStateCopyWithImpl<$Res, _$GeoSuggestionStateImpl>
    implements _$$GeoSuggestionStateImplCopyWith<$Res> {
  __$$GeoSuggestionStateImplCopyWithImpl(_$GeoSuggestionStateImpl _value,
      $Res Function(_$GeoSuggestionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? suggestions = null,
  }) {
    return _then(_$GeoSuggestionStateImpl(
      suggestions: null == suggestions
          ? _value._suggestions
          : suggestions // ignore: cast_nullable_to_non_nullable
              as List<GeoSuggestionEntity>,
    ));
  }
}

/// @nodoc

class _$GeoSuggestionStateImpl implements _GeoSuggestionState {
  const _$GeoSuggestionStateImpl(
      {final List<GeoSuggestionEntity> suggestions = const []})
      : _suggestions = suggestions;

  final List<GeoSuggestionEntity> _suggestions;
  @override
  @JsonKey()
  List<GeoSuggestionEntity> get suggestions {
    if (_suggestions is EqualUnmodifiableListView) return _suggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_suggestions);
  }

  @override
  String toString() {
    return 'GeoSuggestionState(suggestions: $suggestions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GeoSuggestionStateImpl &&
            const DeepCollectionEquality()
                .equals(other._suggestions, _suggestions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_suggestions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GeoSuggestionStateImplCopyWith<_$GeoSuggestionStateImpl> get copyWith =>
      __$$GeoSuggestionStateImplCopyWithImpl<_$GeoSuggestionStateImpl>(
          this, _$identity);
}

abstract class _GeoSuggestionState implements GeoSuggestionState {
  const factory _GeoSuggestionState(
      {final List<GeoSuggestionEntity> suggestions}) = _$GeoSuggestionStateImpl;

  @override
  List<GeoSuggestionEntity> get suggestions;
  @override
  @JsonKey(ignore: true)
  _$$GeoSuggestionStateImplCopyWith<_$GeoSuggestionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
