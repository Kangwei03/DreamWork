import 'package:json_annotation/json_annotation.dart';
part 'RewardsHistoryResponse.g.dart';

@JsonSerializable()
class RewardsHistoryResponse {

  @JsonKey(name: 'item_name')
  final String item_name;

  @JsonKey(name: 'point')
  final int point;

  @JsonKey(name: 'created_at')
  final DateTime created_at;

  @JsonKey(name: 'status')
  final int status;

  RewardsHistoryResponse(
      this.item_name, this.point, this.created_at, this.status);

  //convert json to object
  factory RewardsHistoryResponse.fromJson(Map<String, dynamic> json) =>
      _$RewardsHistoryResponseFromJson(json);

  @override
  String toString() {
    return 'RewardsHistoryResponse{item_name: $item_name, point: $point, created_at: $created_at, status: $status}';
  }
}
