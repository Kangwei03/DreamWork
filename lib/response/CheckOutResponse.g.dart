// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckOutResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOutResponse _$CheckOutResponseFromJson(Map<String, dynamic> json) =>
    CheckOutResponse(
          json['name'] as String,
      json['product_id'] as int,
      json['image_url'] as String,
      json['quantity'] as int,
      json['price'] as int,
);

Map<String, dynamic> _$CheckOutResponseToJson(CheckOutResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'product_id': instance.product_id,
      'image_url': instance.image_url,
      'quantity': instance.quantity,
      'price': instance.price,
    };
