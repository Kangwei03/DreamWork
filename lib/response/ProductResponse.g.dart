// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      json['id'] as int,
      DateTime.parse(json['created_at'] as String),
      DateTime.parse(json['updated_at'] as String),
      json['name'] as String,
      json['image_url'] as String,
      json['quantity'] as int,
      json['status'] as int,
      json['color'] as int,
      json['type'] as int,
      (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_at': instance.created_at.toIso8601String(),
      'updated_at': instance.updated_at.toIso8601String(),
      'name': instance.name,
      'image_url': instance.image_url,
      'quantity': instance.quantity,
      'status': instance.status,
      'color': instance.color,
      'type': instance.type,
      'price': instance.price,
    };
