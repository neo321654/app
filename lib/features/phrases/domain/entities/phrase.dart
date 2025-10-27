import 'package:equatable/equatable.dart';

class Phrase extends Equatable {
  final int id;
  final String title;
  final String description;
  final String icon;

  const Phrase({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  List<Object?> get props => [id, title, description, icon];
}
