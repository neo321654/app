import 'package:json_annotation/json_annotation.dart';
import 'menu_link.dart';

part 'menu_group.g.dart';

@JsonSerializable()
class MenuGroup {
  final String title;
  final List<MenuLink> links;

  MenuGroup({
    required this.title,
    required this.links,
  });

  factory MenuGroup.fromJson(Map<String, dynamic> json) =>
      _$MenuGroupFromJson(json);

  Map<String, dynamic> toJson() => _$MenuGroupToJson(this);
}
