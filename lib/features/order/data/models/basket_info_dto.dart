import 'package:json_annotation/json_annotation.dart';

import '../../../home/data/models/product_dto.dart';
import 'basket_pretotal_info_dto.dart';
import 'basket_total_info_dto.dart';
import 'basket_profile_bonus_dto.dart'; // Import the new DTO

part 'basket_info_dto.g.dart';

@JsonSerializable(
  fieldRename: FieldRename.snake,
  createToJson: false,
)
class BasketInfoDto {
  BasketInfoDto({
    this.products = const [],
    required this.totalInfo,
    this.pretotalInfo = const [],
    required this.bonusInfo,
    this.warnings = const [],
    this.timeDelay,
    this.profileBonus, // Add the new field
  });

  final List<ProductDto> products;
  final BasketTotalInfoDto totalInfo;
  final List<BasketPretotalnfoDto> pretotalInfo;
  final BasketPretotalnfoDto bonusInfo;
  final List<String> warnings;
  final String? timeDelay;
  final BasketProfileBonusDto? profileBonus; // Declare the new field

  factory BasketInfoDto.fromJson(Map<String, dynamic> json) {
    return _$BasketInfoDtoFromJson(json);
  }
}
