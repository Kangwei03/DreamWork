import 'package:dreamwork/Constant.dart';
import 'package:dreamwork/response/LogOutResponse.dart';
import 'package:dreamwork/util/HttpClient.dart';
import 'package:dreamwork/util/Urls.dart';

class LogOutRepository {
  final HttpClient _httpClient = HttpClient();

  Future<LogOutResponse> logOut() async {
    final header = {"Authorization": "Bearer ${Constant.userToken}"};

    print(header);

    final Map<String, dynamic> result = await _httpClient
        .postRequest(Urls.logOut, <String, dynamic>{}, header: header);

    if (result.isEmpty) {
      throw Exception('Empty data from API');
    }

    return LogOutResponse.fromJson(result['response']);
  }
}
