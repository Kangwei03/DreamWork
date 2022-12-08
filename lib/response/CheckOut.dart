import 'package:json_annotation/json_annotation.dart';

part 'CheckOut.g.dart';


@JsonSerializable()
class CheckOutResponse{

  @JsonKey(name: 'productName')
  final String productName;

  @JsonKey(name: 'image_url')
  final String image_url;

  @JsonKey(name: 'amount')
  final int amount;

  @JsonKey(name: 'price')
  final double price;

  @JsonKey(name: 'totalPrice')
  final double totalPrice;

  CheckOutResponse(this.productName, this.image_url, this.amount, this.price, this.totalPrice);

  @override
  String toString() {
    return 'CheckOutResponse{productName: $productName, image_url: $image_url, amount: $amount, price: $price, totalPrice: $totalPrice}';
  }
}