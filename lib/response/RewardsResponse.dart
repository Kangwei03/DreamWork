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


  RewardsResponse(this.image, this.name, this.description,
      this.point_to_redeem);

  //convert json to object
  factory RewardsResponse.fromJson(Map<String, dynamic> json) =>
      _$RewardsResponseFromJson(json);

  @override
  String toString() {
    return 'RewardsResponse{ image_url: $image, name: $name, description: $description, pointNeeded: $point_to_redeem}';
  }
}
