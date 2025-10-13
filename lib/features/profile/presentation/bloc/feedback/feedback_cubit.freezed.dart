// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feedback_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FeedbackState {
  int get grade1 => throw _privateConstructorUsedError;
  int get grade2 => throw _privateConstructorUsedError;
  int get grade3 => throw _privateConstructorUsedError;
  String? get comment => throw _privateConstructorUsedError;
  List<File> get photos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FeedbackStateCopyWith<FeedbackState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedbackStateCopyWith<$Res> {
  factory $FeedbackStateCopyWith(
          FeedbackState value, $Res Function(FeedbackState) then) =
      _$FeedbackStateCopyWithImpl<$Res, FeedbackState>;
  @useResult
  $Res call(
      {int grade1, int grade2, int grade3, String? comment, List<File> photos});
}

/// @nodoc
class _$FeedbackStateCopyWithImpl<$Res, $Val extends FeedbackState>
    implements $FeedbackStateCopyWith<$Res> {
  _$FeedbackStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grade1 = null,
    Object? grade2 = null,
    Object? grade3 = null,
    Object? comment = freezed,
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      grade1: null == grade1
          ? _value.grade1
          : grade1 // ignore: cast_nullable_to_non_nullable
              as int,
      grade2: null == grade2
          ? _value.grade2
          : grade2 // ignore: cast_nullable_to_non_nullable
              as int,
      grade3: null == grade3
          ? _value.grade3
          : grade3 // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<File>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FeedbackStateImplCopyWith<$Res>
    implements $FeedbackStateCopyWith<$Res> {
  factory _$$FeedbackStateImplCopyWith(
          _$FeedbackStateImpl value, $Res Function(_$FeedbackStateImpl) then) =
      __$$FeedbackStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int grade1, int grade2, int grade3, String? comment, List<File> photos});
}

/// @nodoc
class __$$FeedbackStateImplCopyWithImpl<$Res>
    extends _$FeedbackStateCopyWithImpl<$Res, _$FeedbackStateImpl>
    implements _$$FeedbackStateImplCopyWith<$Res> {
  __$$FeedbackStateImplCopyWithImpl(
      _$FeedbackStateImpl _value, $Res Function(_$FeedbackStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grade1 = null,
    Object? grade2 = null,
    Object? grade3 = null,
    Object? comment = freezed,
    Object? photos = null,
  }) {
    return _then(_$FeedbackStateImpl(
      grade1: null == grade1
          ? _value.grade1
          : grade1 // ignore: cast_nullable_to_non_nullable
              as int,
      grade2: null == grade2
          ? _value.grade2
          : grade2 // ignore: cast_nullable_to_non_nullable
              as int,
      grade3: null == grade3
          ? _value.grade3
          : grade3 // ignore: cast_nullable_to_non_nullable
              as int,
      comment: freezed == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String?,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<File>,
    ));
  }
}

/// @nodoc

class _$FeedbackStateImpl implements _FeedbackState {
  const _$FeedbackStateImpl(
      {this.grade1 = 0,
      this.grade2 = 0,
      this.grade3 = 0,
      this.comment,
      final List<File> photos = const []})
      : _photos = photos;

  @override
  @JsonKey()
  final int grade1;
  @override
  @JsonKey()
  final int grade2;
  @override
  @JsonKey()
  final int grade3;
  @override
  final String? comment;
  final List<File> _photos;
  @override
  @JsonKey()
  List<File> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  String toString() {
    return 'FeedbackState(grade1: $grade1, grade2: $grade2, grade3: $grade3, comment: $comment, photos: $photos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FeedbackStateImpl &&
            (identical(other.grade1, grade1) || other.grade1 == grade1) &&
            (identical(other.grade2, grade2) || other.grade2 == grade2) &&
            (identical(other.grade3, grade3) || other.grade3 == grade3) &&
            (identical(other.comment, comment) || other.comment == comment) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @override
  int get hashCode => Object.hash(runtimeType, grade1, grade2, grade3, comment,
      const DeepCollectionEquality().hash(_photos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FeedbackStateImplCopyWith<_$FeedbackStateImpl> get copyWith =>
      __$$FeedbackStateImplCopyWithImpl<_$FeedbackStateImpl>(this, _$identity);
}

abstract class _FeedbackState implements FeedbackState {
  const factory _FeedbackState(
      {final int grade1,
      final int grade2,
      final int grade3,
      final String? comment,
      final List<File> photos}) = _$FeedbackStateImpl;

  @override
  int get grade1;
  @override
  int get grade2;
  @override
  int get grade3;
  @override
  String? get comment;
  @override
  List<File> get photos;
  @override
  @JsonKey(ignore: true)
  _$$FeedbackStateImplCopyWith<_$FeedbackStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
