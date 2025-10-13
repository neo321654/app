// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_offer_dto.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BasketOfferDtoAdapter extends TypeAdapter<BasketOfferDto> {
  @override
  final int typeId = 2;

  @override
  BasketOfferDto read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BasketOfferDto(
      id: fields[0] as String,
      product: fields[1] as ProductDto,
      quantity: fields[2] as int?,
      addOptions: (fields[3] as List?)?.cast<ProductOptionDto>(),
      removeOptions: (fields[4] as List?)?.cast<ProductOptionDto>(),
    );
  }

  @override
  void write(BinaryWriter writer, BasketOfferDto obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.product)
      ..writeByte(2)
      ..write(obj.quantity)
      ..writeByte(3)
      ..write(obj.addOptions)
      ..writeByte(4)
      ..write(obj.removeOptions);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketOfferDtoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketOfferDto _$BasketOfferDtoFromJson(Map<String, dynamic> json) =>
    BasketOfferDto(
      id: json['id'] as String,
      product: ProductDto.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num?)?.toInt(),
      addOptions: (json['add_options'] as List<dynamic>?)
          ?.map((e) => ProductOptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      removeOptions: (json['remove_options'] as List<dynamic>?)
          ?.map((e) => ProductOptionDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BasketOfferDtoToJson(BasketOfferDto instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'product': instance.product,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('quantity', instance.quantity);
  writeNotNull('add_options', instance.addOptions);
  writeNotNull('remove_options', instance.removeOptions);
  return val;
}
