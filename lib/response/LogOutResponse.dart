import 'package:json_annotation/json_annotation.dart';

part 'LogOutResponse.g.dart';

@JsonSerializable()
class LogOutResponse {
  @JsonKey(name: 'message')
  final String message;

  LogOutResponse(this.message);

  //convert json to object
  factory LogOutResponse.fromJson(Map<String, dynamic> json) =>
      _$LogOutResponseFromJson(json);

  @override
  String toString() {
    return 'LogOutResponse{message: $message}';
  }

}