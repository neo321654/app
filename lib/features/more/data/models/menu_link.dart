import 'package:json_annotation/json_annotation.dart';

part 'menu_link.g.dart';

@JsonSerializable()
class MenuLink {
  final String title;
  final String link;
  final String? icon;
  final String? target;

  MenuLink({
    required this.title,
    required this.link,
    this.icon,
    this.target,
  });

  factory MenuLink.fromJson(Map<String, dynamic> json) =>
      _$MenuLinkFromJson(json);

  Map<String, dynamic> toJson() => _$MenuLinkToJson(this);
}
