import 'package:dreamwork/Constant.dart';
import 'package:dreamwork/response/RewardsClaimResponse.dart';
import 'package:dreamwork/response/RewardsHistoryResponse.dart';
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

  Future<List<RewardsHistoryResponse>> rewardsHistory() async{
    final header = {
      "Authorization": "Bearer ${Constant.userToken}"
    };

    final Map<String,dynamic> result = await _httpClient.getRequest(Urls.rewardsHistory, <String,dynamic>{}, header: header);

    if(result.isEmpty){
      throw Exception('Empty data from API');
    }

    List<dynamic> resultData = result['Redeem History'];

    return resultData.map((value) => RewardsHistoryResponse.fromJson(value)).toList();
  }

  Future<RewardsClaimResponse> rewards(Map<String, dynamic> payload) async{
    final header = {
      "Authorization": "Bearer ${Constant.userToken}"
    };

    print(header);

    final Map<String,dynamic> result = await _httpClient.postRequest(Urls.claimRewards, payload, header: header);

    if(result.isEmpty){
      throw Exception('Empty data from API');
    }

    return RewardsClaimResponse.fromJson(result);
  }

}