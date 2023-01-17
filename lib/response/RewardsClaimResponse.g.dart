// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RewardsClaimResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **********************************************************************import 'package:dreamwork/response/RewardsClaimResponse.dart';

RewardsClaimResponse _$RewardsClaimResponseFromJson(Map<String, dynamic> json) =>
    RewardsClaimResponse(
      json['message'] as String,
      json['status'] as String,
    );

Map<String, dynamic> _$RewardsClaimResponseToJson(RewardsClaimResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'status': instance.status,
    };
