// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BodyMeasurementResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BodyMeasurementResponse _$BodyMeasurementResponseFromJson(
    Map<String, dynamic> json) {
  //from json to object
  return BodyMeasurementResponse(
    json['id'] as int,
    json['created_at'] as String,
    json['weight'] as double,
    json['height'] as double,
    json['shoulder'] as double,
    json['arm'] as double,
    json['chest'] as double,
    json['waist'] as double,
    json['hip'] as double,
    json['tight'] as double,
    json['calf'] as double,
  );
}

//from object to json
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
    };
