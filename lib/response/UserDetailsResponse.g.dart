// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserDetailsResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDetailsResponse _$UserDetailsResponseFromJson(Map<String, dynamic> json) =>
    UserDetailsResponse(
      json['Email'] as String,
      json['Username'] as String,
      json['Name'] as String,
      json['Phone_No'] as String,
      json['Address'] as String,
      json['status'] as String,
      json['Point'] as int,
    );

Map<String, dynamic> _$UserDetailsResponseToJson(
        UserDetailsResponse instance) =>
    <String, dynamic>{
      'Email': instance.Email,
      'Username': instance.Username,
      'Name': instance.Name,
      'Phone_No': instance.Phone_No,
      'Address': instance.Address,
      'status': instance.status,
      'Point': instance.Point,
    };
