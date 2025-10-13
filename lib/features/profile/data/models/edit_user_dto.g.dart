// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_user_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditUserDto _$EditUserDtoFromJson(Map<String, dynamic> json) => EditUserDto(
      name: json['name'] as String?,
      email: json['email'] as String?,
      birthdate: json['birthdate'] as String?,
    );

Map<String, dynamic> _$EditUserDtoToJson(EditUserDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('email', instance.email);
  writeNotNull('birthdate', instance.birthdate);
  return val;
}
