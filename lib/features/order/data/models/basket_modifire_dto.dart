import 'package:json_annotation/json_annotation.dart';

part 'basket_modifire_dto.g.dart';

@JsonSerializable(
  includeIfNull: false,
  fieldRename: FieldRename.snake,
)
class BasketModifireDto {
  BasketModifireDto({
    required this.id,
    required this.qnt,
  });

  final int id;
  final int qnt;

  Map<String, dynamic> toJson() => {
        'id': id,
        'qnt': qnt,
      };

  factory BasketModifireDto.fromJson(Map<String, dynamic> json) =>
      _$BasketModifireDtoFromJson(json);
}
