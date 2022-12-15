import 'package:dreamwork/ui/UserDetails.dart';
import 'package:json_annotation/json_annotation.dart';
part 'UserDetailsResponse.g.dart';


@JsonSerializable()
class UserDetailsResponse {
  @JsonKey(name: "Email")
  final String Email;

  @JsonKey(name: "Username")
  final String Username;

  @JsonKey(name: "Name")
  final String Name;

  @JsonKey(name: "Phone_No")
  final String Phone_No;

  @JsonKey(name:"Address")
  final String Address;

  @JsonKey(name: "status")
  final String status;

  UserDetailsResponse(this.Email, this.Username, this.Name, this.Phone_No,
      this.Address, this.status);

  //convert json to object
  factory UserDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$UserDetailsResponseFromJson(json);

  @override
  String toString() {
    return 'UserDetailsResponse{Email: $Email, Username: $Username, Name: $Name, Phone_No: $Phone_No, Address: $Address, status: $status}';
  }
}
