// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CheckOut.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckOutResponse _$CheckOutResponseFromJson(Map<String, dynamic> json) =>
    CheckOutResponse(
      json['productName'] as String,
      json['image_url'] as String,
      json['amount'] as int,
      (json['price'] as num).toDouble(),
      (json['totalPrice'] as num).toDouble(),
    );

Map<String, dynamic> _$CheckOutResponseToJson(CheckOutResponse instance) =>
    <String, dynamic>{
      'productName': instance.productName,
      'image_url': instance.image_url,
      'amount': instance.amount,
      'price': instance.price,
      'totalPrice': instance.totalPrice,
    };
