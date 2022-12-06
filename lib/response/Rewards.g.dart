// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Rewards.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RewardsResponse _$RewardsResponseFromJson(Map<String, dynamic> json) =>
    RewardsResponse(
      json['points'] as int,
      json['image_url'] as String,
      json['name'] as String,
      json['description'] as String,
      json['pointNeeded'] as int,
      json['coinImage'] as String,
    );

Map<String, dynamic> _$RewardsResponseToJson(RewardsResponse instance) =>
    <String, dynamic>{
      'points': instance.points,
      'image_url': instance.image_url,
      'name': instance.name,
      'description': instance.description,
      'pointNeeded': instance.pointNeeded,
      'coinImage': instance.coinImage,
    };
