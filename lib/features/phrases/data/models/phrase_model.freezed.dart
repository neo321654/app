// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'phrase_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhraseModel _$PhraseModelFromJson(Map<String, dynamic> json) {
  return _PhraseModel.fromJson(json);
}

/// @nodoc
mixin _$PhraseModel {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhraseModelCopyWith<PhraseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhraseModelCopyWith<$Res> {
  factory $PhraseModelCopyWith(
          PhraseModel value, $Res Function(PhraseModel) then) =
      _$PhraseModelCopyWithImpl<$Res, PhraseModel>;
  @useResult
  $Res call({int id, String title, String content});
}

/// @nodoc
class _$PhraseModelCopyWithImpl<$Res, $Val extends PhraseModel>
    implements $PhraseModelCopyWith<$Res> {
  _$PhraseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
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
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhraseModelImplCopyWith<$Res>
    implements $PhraseModelCopyWith<$Res> {
  factory _$$PhraseModelImplCopyWith(
          _$PhraseModelImpl value, $Res Function(_$PhraseModelImpl) then) =
      __$$PhraseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String title, String content});
}

/// @nodoc
class __$$PhraseModelImplCopyWithImpl<$Res>
    extends _$PhraseModelCopyWithImpl<$Res, _$PhraseModelImpl>
    implements _$$PhraseModelImplCopyWith<$Res> {
  __$$PhraseModelImplCopyWithImpl(
      _$PhraseModelImpl _value, $Res Function(_$PhraseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? content = null,
  }) {
    return _then(_$PhraseModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhraseModelImpl implements _PhraseModel {
  const _$PhraseModelImpl(
      {required this.id, required this.title, required this.content});

  factory _$PhraseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhraseModelImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String content;

  @override
  String toString() {
    return 'PhraseModel(id: $id, title: $title, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhraseModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhraseModelImplCopyWith<_$PhraseModelImpl> get copyWith =>
      __$$PhraseModelImplCopyWithImpl<_$PhraseModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhraseModelImplToJson(
      this,
    );
  }
}

abstract class _PhraseModel implements PhraseModel {
  const factory _PhraseModel(
      {required final int id,
      required final String title,
      required final String content}) = _$PhraseModelImpl;

  factory _PhraseModel.fromJson(Map<String, dynamic> json) =
      _$PhraseModelImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$PhraseModelImplCopyWith<_$PhraseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
