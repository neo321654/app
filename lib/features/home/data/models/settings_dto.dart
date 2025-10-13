import 'package:json_annotation/json_annotation.dart';

part 'settings_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class SettingsDto {
  SettingsDto({
    this.socnet,
    this.pdf,
    this.feedback,
    this.monobox,
    required this.loyalty,
    this.children,
    this.callback,
    this.usePromocode,
    this.useLoyalty,
  });

  final SocnetDto? socnet;
  final PdfDto? pdf;
  final FeedbackDto? feedback;
  final MonoboxDto? monobox;
  final bool loyalty;
  final bool? children;
  final bool? callback;
  final bool? usePromocode;
  final bool? useLoyalty;

  factory SettingsDto.fromJson(Map<String, dynamic> json) =>
      _$SettingsDtoFromJson(json);
}

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class SocnetDto {
  SocnetDto({
    this.vk,
    this.tg,
    this.insta,
  });

  final String? vk;
  final String? tg;
  final String? insta;

  factory SocnetDto.fromJson(Map<String, dynamic> json) =>
      _$SocnetDtoFromJson(json);
}

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class PdfDto {
  PdfDto({
    this.politic,
  });

  final String? politic;

  factory PdfDto.fromJson(Map<String, dynamic> json) => _$PdfDtoFromJson(json);
}

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class FeedbackDto {
  FeedbackDto({
    this.phone,
    this.vk,
    this.tg,
    this.wa,
  });

  final String? phone;
  final String? vk;
  final String? tg;
  final String? wa;

  factory FeedbackDto.fromJson(Map<String, dynamic> json) =>
      _$FeedbackDtoFromJson(json);
}

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class MonoboxDto {
  MonoboxDto({
    this.link,
  });

  final String? link;

  factory MonoboxDto.fromJson(Map<String, dynamic> json) =>
      _$MonoboxDtoFromJson(json);
}
