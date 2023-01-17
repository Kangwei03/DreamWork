import 'package:dreamwork/response/CheckOutResponse.dart';
import 'package:dreamwork/response/ProductResponse.dart';
import 'package:dreamwork/util/Urls.dart';

import '../Constant.dart';
import '../util/HttpClient.dart';

class ProductRepository {
  final HttpClient _httpClient = HttpClient();

  Future<List<ProductResponse>> product() async{
    final header = {
      "Authorization": "Bearer ${Constant.userToken}"
    };

    print(header);

    final Map<String,dynamic> result = await _httpClient.getRequest(Urls.products, <String,dynamic>{}, header: header);

    if(result.isEmpty){
      throw Exception('Empty data from API');
    }

    List<dynamic> resultData = result['stock_details'];

    return resultData.map((value) => ProductResponse.fromJson(value)).toList();
  }

  Future<List<CheckOutResponse>> checkOut() async{
    final header = {
      "Authorization": "Bearer ${Constant.userToken}"
    };

    print(header);

    final Map<String,dynamic> result = await _httpClient.getRequest(Urls.getCart, <String,dynamic>{}, header: header);

    if(result.isEmpty){
      throw Exception('Empty data from API');
    }

    List<dynamic> resultData = result['Cart Details'];

    return resultData.map((value) => CheckOutResponse.fromJson(value)).toList();
  }




}