// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_option_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductOptionDtoAdapter extends TypeAdapter<ProductOptionDto> {
  @override
  final int typeId = 1;

  @override
  ProductOptionDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductOptionDto(
      id: fields[0] as int,
      name: fields[1] as String,
      picture: fields[2] as String?,
      description: fields[3] as String?,
      price: fields[4] as int?,
      unit: fields[5] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductOptionDto obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.picture)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.price)
      ..writeByte(5)
      ..write(obj.unit);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductOptionDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductOptionDto _$ProductOptionDtoFromJson(Map<String, dynamic> json) =>
    ProductOptionDto(
      id: (json['id'] as num).toInt(),
      name: json['title'] as String,
      picture: json['image'] as String?,
      description: json['description'] as String?,
      price: (json['price'] as num?)?.toInt(),
      unit: json['unit'] as String?,
    );

Map<String, dynamic> _$ProductOptionDtoToJson(ProductOptionDto instance) {
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
  writeNotNull('unit', instance.unit);
  return val;
}
