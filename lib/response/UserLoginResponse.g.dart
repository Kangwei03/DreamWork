// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserLoginResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLoginResponse _$UserLoginResponseFromJson(Map<String, dynamic> json) =>
    UserLoginResponse(
      json['token'] as String,
      json['status'] as String,
    );

Map<String, dynamic> _$UserLoginResponseToJson(UserLoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'status': instance.status,
    };
