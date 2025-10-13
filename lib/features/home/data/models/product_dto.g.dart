// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductDtoAdapter extends TypeAdapter<ProductDto> {
  @override
  final int typeId = 4;

  @override
  ProductDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductDto(
      id: fields[0] as int,
      name: fields[1] as String,
      picture: fields[2] as String?,
      description: fields[3] as String?,
      price: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductDto obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.picture)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
      id: (json['id'] as num).toInt(),
      name: json['title'] as String,
      picture: json['image'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toInt(),
      tags: (json['tags'] as List<dynamic>?)
              ?.map((e) => TagDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      modifiers: (json['modifiers'] as List<dynamic>?)
              ?.map((e) => ModifierDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      kbzhu: (json['kbzhu'] as List<dynamic>?)
              ?.map((e) => KbzhuDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      weight: (json['weight'] as num?)?.toInt(),
      weightText: json['weight_text'] as String?,
      isCombo: json['is_combo'] as bool? ?? false,
      isHalfPizza: json['is_half_pizza'] as bool? ?? false,
    );

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'title': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('image', instance.picture);
  writeNotNull('description', instance.description);
  writeNotNull('price', instance.price);
  val['tags'] = instance.tags;
  val['modifiers'] = instance.modifiers;
  val['kbzhu'] = instance.kbzhu;
  writeNotNull('weight', instance.weight);
  writeNotNull('weight_text', instance.weightText);
  val['is_combo'] = instance.isCombo;
  val['is_half_pizza'] = instance.isHalfPizza;
  return val;
}
