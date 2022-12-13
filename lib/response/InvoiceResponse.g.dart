// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'InvoiceResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InvoiceResponse _$InvoiceResponseFromJson(Map<String, dynamic> json) =>
    InvoiceResponse(
      json['userId'] as String,
      json['address'] as String,
      DateTime.parse(json['orderDate'] as String),
      json['image_url'] as String,
      json['name'] as String,
      json['quantity'] as int,
      (json['subTotal'] as num).toDouble(),
      (json['sub_total'] as num).toDouble(),
      json['deliveryFee'] as int,
      (json['pointEarn'] as num).toDouble(),
      (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$InvoiceResponseToJson(InvoiceResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'address': instance.address,
      'orderDate': instance.orderDate.toIso8601String(),
      'image_url': instance.image_url,
      'name': instance.name,
      'quantity': instance.quantity,
      'subTotal': instance.subTotal,
      'sub_total': instance.sub_total,
      'deliveryFee': instance.deliveryFee,
      'pointEarn': instance.pointEarn,
      'total': instance.total,
    };
