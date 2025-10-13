// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feedback_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeedbackDto _$FeedbackDtoFromJson(Map<String, dynamic> json) => FeedbackDto(
      rate1: (json['rate1'] as num?)?.toInt(),
      rate2: (json['rate2'] as num?)?.toInt(),
      rate3: (json['rate3'] as num?)?.toInt(),
      content: json['content'] as String?,
    );

Map<String, dynamic> _$FeedbackDtoToJson(FeedbackDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('rate1', instance.rate1);
  writeNotNull('rate2', instance.rate2);
  writeNotNull('rate3', instance.rate3);
  writeNotNull('content', instance.content);
  return val;
}
