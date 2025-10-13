import 'package:json_annotation/json_annotation.dart';

part 'basket_total_info_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class BasketTotalInfoDto {
  BasketTotalInfoDto({
    required this.total,
    required this.discountPrice,
  });

  final int total;
  final int discountPrice;

  factory BasketTotalInfoDto.fromJson(Map<String, dynamic> json) =>
      _$BasketTotalInfoDtoFromJson(json);
}
