import 'package:dreamwork/Constant.dart';
import 'package:dreamwork/response/RewardsResponse.dart';
import 'package:dreamwork/util/HttpClient.dart';
import 'package:dreamwork/util/Urls.dart';

class RewardsRepository {
  final HttpClient _httpClient = HttpClient();

  Future<List<RewardsResponse>> products() async{
    final header = {
      "Authorization": "Bearer ${Constant.userToken}"
    };

    final Map<String,dynamic> result = await _httpClient.getRequest(Urls.rewards, <String,dynamic>{}, header: header);

    if(result.isEmpty){
      throw Exception('Empty data from API');
    }

    List<dynamic> resultData = result['reward_details'];

    return resultData.map((value) => RewardsResponse.fromJson(value)).toList();
  }

}