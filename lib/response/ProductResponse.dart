import 'package:json_annotation/json_annotation.dart';

part 'ProductResponse.g.dart';

@JsonSerializable()
class ProductResponse {

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'image_url')
  final String image_url;

  @JsonKey(name: 'price')
  final double price;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'weight')
  final double weight;

  ProductResponse(

      this.name,
      this.image_url,
      this.price,
      this.description,
      this.id,
      this.weight);
  //convert json to object
  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  @override
  String toString() {
    return 'ProductResponse{name: $name, image_url: $image_url, id: $id， price: $price, description: $description, weight: $weight}';
  }
}
