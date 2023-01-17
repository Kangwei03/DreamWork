// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RewardsHistoryResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RewardsHistoryResponse _$RewardsHistoryResponseFromJson(
    Map<String, dynamic> json) {
  print(int.parse(json['point'] as String));
  return RewardsHistoryResponse(
    json['item_name'] as String,
    int.parse(json['point'] as String),
    DateTime.parse(json['created_at'] as String),
    json['status'] as int,
  );
}

Map<String, dynamic> _$RewardsHistoryResponseToJson(
        RewardsHistoryResponse instance) =>
    <String, dynamic>{
      'item_name': instance.item_name,
      'point': instance.point,
      'created_at': instance.created_at.toIso8601String(),
      'status': instance.status,
    };
