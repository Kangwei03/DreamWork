import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class UserPointsResponse{
  @JsonKey(name: 'userId')
  final String userId;

  @JsonKey(name: 'points')
  final double points;

  UserPointsResponse(this.userId, this.points);

  @override
  String toString() {
    return 'UserPointsResponse{userId: $userId, points: $points}';
  }
}