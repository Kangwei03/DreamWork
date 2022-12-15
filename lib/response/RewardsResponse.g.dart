// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RewardsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RewardsResponse _$RewardsResponseFromJson(Map<String, dynamic> json) =>
    RewardsResponse(
      json['image'] as String,
      json['name'] as String,
      json['description'] as String,
      json['point_to_redeem'] as int,
    );

Map<String, dynamic> _$RewardsResponseToJson(RewardsResponse instance) =>
    <String, dynamic>{
      'image_url': instance.image,
      'name': instance.name,
      'description': instance.description,
      'pointNeeded': instance.point_to_redeem,
    };
