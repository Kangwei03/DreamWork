import 'package:json_annotation/json_annotation.dart';

part 'RewardsResponse.g.dart';

@JsonSerializable()
class RewardsResponse {

  @JsonKey(name: 'image')
  final String image;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'point_to_redeem')
  final int point_to_redeem;

  @JsonKey(name: 'stock')
  final int stock;

  @JsonKey(name: 'created_at')
  final DateTime created_at;

  @JsonKey(name: 'updated_at')
  final DateTime updated_at;

  @JsonKey(name: 'id')
  final int id;


  RewardsResponse(this.image, this.name, this.description,
      this.point_to_redeem, this.stock, this.created_at, this.id, this.updated_at);

  //convert json to object
  factory RewardsResponse.fromJson(Map<String, dynamic> json) =>
      _$RewardsResponseFromJson(json);

  @override
  String toString() {
    return 'RewardsResponse{ image_url: $image, name: $name, description: $description,id: $id, pointNeeded: $point_to_redeem, stock: $stock, created_at: $created_at, updated_at: $updated_at}';
  }
}
