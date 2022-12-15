import 'package:dreamwork/Constant.dart';
import 'package:dreamwork/response/InvoiceResponse.dart';
import 'package:dreamwork/util/HttpClient.dart';
import 'package:dreamwork/util/Urls.dart';

class InvoiceRepository {
  final HttpClient _httpClient = HttpClient();

  Future<List<InvoiceResponse>> invoice() async{
    final header = {
      "Authorization": "Bearer ${Constant.userToken}"
    };

    print(header);

    final Map<String, dynamic> result = await _httpClient.postRequest(
        Urls.invoice, <String,dynamic>{}, header: header);

    if (result.isEmpty) {
      throw Exception('Empty data from API');
    }
    List<dynamic> resultData = result[''];

    return resultData.map((value) => InvoiceResponse.fromJson(value)).toList();
  }
}
