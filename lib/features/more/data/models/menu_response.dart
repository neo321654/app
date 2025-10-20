import 'package:json_annotation/json_annotation.dart';
import 'menu_group.dart';

part 'menu_response.g.dart';

@JsonSerializable()
class MenuResponse {
  final List<MenuGroup> top;
  final List<MenuGroup> footer_left;
  final List<MenuGroup> footer_right;
  final List<MenuGroup> mobile;

  MenuResponse({
    required this.top,
    required this.footer_left,
    required this.footer_right,
    required this.mobile,
  });

  factory MenuResponse.fromJson(Map<String, dynamic> json) =>
      _$MenuResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MenuResponseToJson(this);
}
