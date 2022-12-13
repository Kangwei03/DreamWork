import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class InvoiceResponse {
  @JsonKey(name: "userId")
  final String userId;

  @JsonKey(name: "address")
  final String address;

  @JsonKey(name: "orderDate")
  final DateTime orderDate;

  @JsonKey(name: "image_url")
  final String image_url;

  @JsonKey(name: "name")
  final String name;

  @JsonKey(name: "quantity")
  final int quantity;

  @JsonKey(name: "subTotal")
  final double subTotal;

  @JsonKey(name: "sub_total")
  final double sub_total;

  @JsonKey(name: "deliveryFee")
  final int deliveryFee;

  @JsonKey(name: "pointEarn")
  final double pointEarn;

  @JsonKey(name: "total")
  final double total;

  InvoiceResponse(
      this.userId,
      this.address,
      this.orderDate,
      this.image_url,
      this.name,
      this.quantity,
      this.subTotal,
      this.sub_total,
      this.deliveryFee,
      this.pointEarn,
      this.total);

  //convert json to object
  factory InvoiceResponse.fromJson(Map<String, dynamic> json) =>
      _$InvoiceResponseFromJson(json);

  @override
  String toString() {
    return 'InvoiceResponse{userId: $userId, address: $address, orderDate: $orderDate, image_url: $image_url, name: $name, quantity: $quantity, subTotal: $subTotal, sub_total: $sub_total, deliveryFee: $deliveryFee, pointEarn: $pointEarn, total: $total}';
  }
}
