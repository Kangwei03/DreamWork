import 'package:json_annotation/json_annotation.dart';
part 'RewardsHistoryResponse.g.dart';

@JsonSerializable()
class RewardsHistoryResponse {
  @JsonKey(name: 'image')
  final String image;

  @JsonKey(name: 'name')
  final String name;

  @JsonKey(name: 'points')
  final int points;

  @JsonKey(name: 'redeemDate')
  final DateTime redeemDate;

  @JsonKey(name: 'status')
  final String status;

  RewardsHistoryResponse(
      this.image, this.name, this.points, this.redeemDate, this.status);

  //convert json to object
  factory RewardsHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$RewardsHistoryResponseFromJson(json);

  @override
  String toString() {
    return 'RewardsHistoryResponse{image: $image, name: $name, points: $points, redeemDate: $redeemDate, status: $status}';
  }
}
