
import 'package:dreamwork/Constant.dart';
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


}