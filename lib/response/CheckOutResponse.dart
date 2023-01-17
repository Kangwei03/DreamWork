import 'package:json_annotation/json_annotation.dart';

part 'CheckOutResponse.g.dart';


@JsonSerializable()
class CheckOutResponse{

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'product_id')
  final int product_id;

  @JsonKey(name: 'image_url')
  final String image_url;

  @JsonKey(name: 'quantity')
  final int quantity;

  @JsonKey(name: 'price')
  final int price;

  CheckOutResponse(this.name, this.product_id, this.image_url, this.quantity, this.price);


  //convert json to object
  factory CheckOutResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckOutResponseFromJson(json);

  @override
  String toString() {
    return 'CheckOutResponse{name: $name, product_id: $product_id, image_url: $image_url, quantity: $quantity, price: $price}';
  }
}