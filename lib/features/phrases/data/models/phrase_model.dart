import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:monobox/features/phrases/domain/entities/phrase.dart';

part 'phrase_model.freezed.dart';
part 'phrase_model.g.dart';

@freezed
class PhraseModel with _$PhraseModel {
  const factory PhraseModel({
    required int id,
    required String title,
    required String description,
    required String icon,
  }) = _PhraseModel;

  factory PhraseModel.fromJson(Map<String, dynamic> json) =>
      _$PhraseModelFromJson(json);
}
