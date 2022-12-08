// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RewardsHistoryResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RewardsHistoryResponse _$RewardsHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    RewardsHistoryResponse(
      json['image'] as String,
      json['name'] as String,
      json['points'] as int,
          DateTime.parse(json['redeemDate'] as String),
      json['status'] as String,
    );

Map<String, dynamic> _$RewardsHistoryToJson(RewardsHistoryResponse instance) =>
    <String, dynamic>{
      'image': instance.image,
      'name': instance.name,
      'points': instance.points,
      'redeemDate': instance.redeemDate.toIso8601String(),
      'status': instance.status,
    };
