import 'package:json_annotation/json_annotation.dart';
import 'menu_group.dart';

part 'menu_response.g.dart';

@JsonSerializable()
class MenuResponse {
  final List<MenuGroup> top;
  final List<MenuGroup> footerLeft;
  final List<MenuGroup> footerRight;
  final List<MenuGroup> mobile;

  MenuResponse({
    required this.top,
    required this.footerLeft,
    required this.footerRight,
    required this.mobile,
  });

  factory MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MenuResponseToJson(this);
}
