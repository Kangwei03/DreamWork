import 'package:dreamwork/Constant.dart';
import 'package:dreamwork/response/CheckOutResponse.dart';
import 'package:dreamwork/response/ProductResponse.dart';
import 'package:dreamwork/ui/CheckOut.dart';
import 'package:dreamwork/util/HttpClient.dart';
import 'package:dreamwork/util/Urls.dart';

class AddToCartRepository {
  final HttpClient _httpClient = HttpClient();

  Future<ProductResponse> addToCart(Map<String, dynamic> payload) async {
    final Map<String, dynamic> result = await _httpClient.postRequest(
        Urls.addToCart, payload);

    if (result.isEmpty) {
      throw Exception('Empty data from API');
    }

    return ProductResponse.fromJson(result);
  }
}