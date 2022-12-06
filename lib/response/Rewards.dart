import 'package:json_annotation/json_annotation.dart';

part 'Rewards.g.dart';

@JsonSerializable()
class RewardsResponse {
  @JsonKey(name: 'points')
  final int points;

  @JsonKey(name: 'image_url')
  final String image_url;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'description')
  final String description;

  @JsonKey(name: 'pointNeeded')
  final int pointNeeded;

  @JsonKey(name: 'coinImage')
  final String coinImage;

  RewardsResponse(this.points, this.image_url, this.name, this.description,
      this.pointNeeded,
      this.coinImage);

  //convert json to object
  factory RewardsResponse.fromJson(Map<String, dynamic> json) =>
      _$RewardsResponseFromJson(json);

  @override
  String toString() {
    return 'RewardsResponse{points: $points, image_url: $image_url, name: $name, description: $description, pointNeeded: $pointNeeded, coinImage: $coinImage}';
  }
}
