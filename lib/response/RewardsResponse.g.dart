// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RewardsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RewardsResponse _$RewardsResponseFromJson(Map<String, dynamic> json) {
  return RewardsResponse(
    json['image'] as String,
    json['name'] as String,
    json['description'] as String,
    json['point_to_redeem'] as int,
    json['stock'] as int,
    DateTime.parse(json['created_at'] as String),
    DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$RewardsResponseToJson(RewardsResponse instance) =>
    <String, dynamic>{
      'image_url': instance.image,
      'name': instance.name,
      'description': instance.description,
      'pointNeeded': instance.point_to_redeem,
      'stock': instance.stock,
      'created_at': instance.created_at,
      'updated_at': instance.updated_at,
    };
