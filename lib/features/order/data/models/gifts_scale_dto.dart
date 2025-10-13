import 'package:json_annotation/json_annotation.dart';

import 'gifts_scale_item_dto.dart';

part 'gifts_scale_dto.g.dart';

@JsonSerializable(
  createToJson: false,
)
class GiftsScaleDto {
  GiftsScaleDto({
    required this.giftsScale,
  });

  final List<GiftsScaleItemDto> giftsScale;

  factory GiftsScaleDto.fromJson(Map<String, dynamic> json) =>
      _$GiftsScaleDtoFromJson(json);
}
