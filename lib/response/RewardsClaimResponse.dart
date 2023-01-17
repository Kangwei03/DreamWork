import 'package:json_annotation/json_annotation.dart';

part 'RewardsClaimResponse.g.dart';

@JsonSerializable()
class RewardsClaimResponse {
  @JsonKey(name: "message")
  final String message;

  @JsonKey(name: "status")
  final String status;

  RewardsClaimResponse(this.message, this.status);

  //convert json to object
  factory RewardsClaimResponse.fromJson(Map<String, dynamic> json) =>
      _$RewardsClaimResponseFromJson(json);

  @override
  String toString() {
    return 'RewardsClaimResponse{message: $message, status: $status}';
  }
}
