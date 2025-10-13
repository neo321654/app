import 'package:json_annotation/json_annotation.dart';

import '../../../home/data/models/product_dto.dart';

part 'gifts_scale_item_dto.g.dart';

@JsonSerializable(
  createToJson: false,
)
class GiftsScaleItemDto {
  GiftsScaleItemDto({
    required this.title,
    this.price,
    required this.product,
  });

  final String title;
  final String? price;
  final ProductDto product;

  factory GiftsScaleItemDto.fromJson(Map<String, dynamic> json) =>
      _$GiftsScaleItemDtoFromJson(json);
}
