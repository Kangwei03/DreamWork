// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BodyMeasurementResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyMeasurementResponse _$BodyMeasurementResponseFromJson(
        Map<String, dynamic> json) =>
    BodyMeasurementResponse(
      json['id'] as int,
      json['created_at'] as String,
      (json['weight'] as num).toDouble(),
      (json['height'] as num).toDouble(),
      (json['shoulder'] as num).toDouble(),
      (json['arm'] as num).toDouble(),
      (json['chest'] as num).toDouble(),
      (json['waist'] as num).toDouble(),
      (json['hip'] as num).toDouble(),
      (json['tight'] as num).toDouble(),
      (json['calf'] as num).toDouble(),
      (json['bmi'] as num).toDouble(),
    );

Map<String, dynamic> _$BodyMeasurementResponseToJson(
        BodyMeasurementResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at,
      'weight': instance.weight,
      'height': instance.height,
      'shoulder': instance.shoulder,
      'arm': instance.arm,
      'chest': instance.chest,
      'waist': instance.waist,
      'hip': instance.hip,
      'tight': instance.tight,
      'calf': instance.calf,
      'bmi': instance.bmi,
    };
