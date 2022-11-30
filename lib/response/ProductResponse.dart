import 'package:json_annotation/json_annotation.dart';

part 'ProductResponse.g.dart';

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'created_at')
  final DateTime created_at;

  @JsonKey(name: 'updated_at')
  final DateTime updated_at;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'image_url')
  final String image_url;

  @JsonKey(name: 'quantity')
  final int quantity;

  @JsonKey(name: 'status')
  final int status;

  @JsonKey(name: 'color')
  final int color;

  @JsonKey(name: 'type')
  final int type;

  @JsonKey(name: 'price')
  final double price;

  ProductResponse(this.id, this.created_at, this.updated_at, this.name,
      this.image_url, this.quantity, this.status, this.color, this.type,
      this.price);
  //convert json to object
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  @override
  String toString() {
    return 'ProductResponse{id: $id, created_at: $created_at, updated_at: $updated_at, name: $name, image_url: $image_url, quantity: $quantity, status: $status, color: $color, type: $type, price: $price}';
  }


}

