// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      json['name'] as String,
      json['image_url'] as String,
      (json['price'] as num).toDouble(),
      json['description'] as String,
      (json['weight'] as num).toDouble(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'name': instance.name,
      'image_url': instance.image_url,
      'price': instance.price,
      'description': instance.description,
      'weight': instance.weight,
    };
