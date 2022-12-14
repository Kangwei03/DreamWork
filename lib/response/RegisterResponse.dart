import 'package:json_annotation/json_annotation.dart';

part 'RegisterResponse.g.dart';
@JsonSerializable()
class RegisterResponse {

  @JsonKey(name: 'message')
  final String message;

  @JsonKey(name: 'status')
  final String status;

  RegisterResponse(this.message, this.status);

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseFromJson(json);

  @override
  String toString() {
    return 'RegisterResponse{message: $message, status: $status}';
  }
}