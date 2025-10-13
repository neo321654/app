import 'package:decimal/decimal.dart';
import 'package:equatable/equatable.dart';

class ProductOptionEntity extends Equatable {
  final int? id;
  final String name;
  final String? description;
  final String? image;
  final Decimal? price;
  final String? unit;
  final int quantity;

  const ProductOptionEntity({
    this.id,
    required this.name,
    this.description,
    this.image,
    required this.price,
    this.unit,
    this.quantity = 1,
  });

  ProductOptionEntity copyWith({
    int? id,
    String? name,
    String? description,
    String? image,
    Decimal? price,
    String? unit,
    int? quantity,
  }) {
    return ProductOptionEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      price: price ?? this.price,
      unit: unit ?? this.unit,
      quantity: quantity ?? this.quantity,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'qnt': quantity,
      };

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        image,
        price,
        unit,
        quantity,
      ];
}
