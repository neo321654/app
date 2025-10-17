import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_entity.freezed.dart';

@freezed
class SettingsEntity with _$SettingsEntity {
  const factory SettingsEntity({
    SocnetEntity? socnet,
    PdfEntity? pdf,
    FeedbackEntity? feedback,
    MonoboxEntity? monobox,
    @Default(true) bool loyalty,
    @Default(false) bool children,
    @Default(false) bool callback,
  }) = _SettingsEntity;
}

@freezed
class SocnetEntity with _$SocnetEntity {
  const factory SocnetEntity({
    String? vk,
    String? tg,
    String? insta,
  }) = _SocnetEntity;
}

@freezed
class PdfEntity with _$PdfEntity {
  const factory PdfEntity({
    String? politic,
  }) = _PdfEntity;
}

@freezed
class FeedbackEntity with _$FeedbackEntity {
  const factory FeedbackEntity({
    String? vk,
    String? tg,
    String? phone,
    String? wa,
  }) = _FeedbackEntity;
}

@freezed
class MonoboxEntity with _$MonoboxEntity {
  const factory MonoboxEntity({
    String? link,
  }) = _MonoboxEntity;
}
