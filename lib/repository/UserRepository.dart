import 'package:dreamwork/Constant.dart';
import 'package:dreamwork/response/BodyMeasurementResponse.dart';
import 'package:dreamwork/response/ProductResponse.dart';
import 'package:dreamwork/response/RegisterResponse.dart';
import 'package:dreamwork/response/UserDetailsResponse.dart';
import 'package:dreamwork/response/UserLoginResponse.dart';
import 'package:dreamwork/util/HttpClient.dart';
import 'package:dreamwork/util/Urls.dart';

class UserRepository{
  final HttpClient _httpClient = HttpClient();

  Future<UserLoginResponse> userLogin(Map<String, dynamic> payload) async{
    final Map<String,dynamic> result = await _httpClient.postRequest(Urls.userLogin, payload);

    if(result.isEmpty){
      throw Exception('Empty data from API');
    }

    return UserLoginResponse.fromJson(result);
  }

  Future<RegisterResponse> userRegister(Map<String, dynamic> payload) async{
    final Map<String,dynamic> result = await _httpClient.postRequest(Urls.userRegister, payload);

    if(result.isEmpty){
      throw Exception('Empty data from API');
    }

    return RegisterResponse.fromJson(result);
  }

  Future<RegisterResponse> bodyMeasurement(Map<String, dynamic> payload) async{
    final header = {
      "Authorization": "Bearer ${Constant.userToken}"
    };

    print(header);

    final Map<String,dynamic> result = await _httpClient.postRequest(Urls.bodyMeasurement, payload, header: header);

    if(result.isEmpty){
      throw Exception('Empty data from API');
    }

    return RegisterResponse.fromJson(result);
  }

  Future<RegisterResponse> rewards(Map<String, dynamic> payload) async{
    final header = {
      "Authorization": "Bearer ${Constant.userToken}"
    };

    print(header);

    final Map<String,dynamic> result = await _httpClient.getRequest(Urls.rewards, payload, header: header);

    if(result.isEmpty){
      throw Exception('Empty data from API');
    }

    return RegisterResponse.fromJson(result);
  }

  Future<UserDetailsResponse> userDetails() async{
    final header = {
      "Authorization": "Bearer ${Constant.userToken}"
    };

    print(header);

    final Map<String,dynamic> result = await _httpClient.getRequest(Urls.userDetails, <String,dynamic>{}, header: header);

    if(result.isEmpty){
      throw Exception('Empty data from API');
    }

    return UserDetailsResponse.fromJson(result);
  }



}