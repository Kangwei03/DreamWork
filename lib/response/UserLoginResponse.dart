
import 'package:json_annotation/json_annotation.dart';

part 'UserLoginResponse.g.dart';

@JsonSerializable()
class UserLoginResponse{
  @JsonKey(name: 'token')
  final String token;

  @JsonKey(name: 'status')
  final String status;

  UserLoginResponse(this.token, this.status);

  //convert json to object
  factory UserLoginResponse.fromJson(Map<String, dynamic> json) =>
      _$UserLoginResponseFromJson(json);

  @override
  String toString() {
    return 'UserLoginResponse{token: $token, status: $status}';
  }
}