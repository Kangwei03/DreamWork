import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CheckOutResponse{
  @JsonKey(name: 'userId')
  final String userId;

  @JsonKey(name: 'points')
  final double points;

  CheckOutResponse(this.userId, this.points);

  @override
  String toString() {
    return 'CheckOutResponse{userId: $userId, points: $points}';
  }
}