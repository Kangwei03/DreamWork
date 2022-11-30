import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../constant.dart';

class HttpClient{
  var client = http.Client();

  static const baseUrl = "54.179.56.6";
  static const timeoutPeriod = Duration(seconds:60);

  Future<dynamic> getRequest(String path, final payload, {Map<String,String> header = const {}}) async {
    http.Response response;

    try {
      Map<String, String> httpHeader = {
        "Content-Type": "application/json",
      };

      if(header['token'] != null){
        httpHeader['token'] = header['token']!;
      }

      //use http for unsecure link
      //use https for secure link
      response = await client.get(
        Uri.http(baseUrl, path, payload),
        headers: httpHeader,
      ).timeout(timeoutPeriod, onTimeout: () {
        throw Exception("Server Connection Timeout");
      });

      final statusCode = response.statusCode;

      if (statusCode == 200) {
        if (response.body.isEmpty) {
          return <dynamic>[];
        }
        else {
          return jsonDecode(response.body);
        }
      } else if (statusCode == 401) {
        throw Exception(jsonDecode(response.body)['message']);
      } else {
        print(jsonDecode(response.body)['message']);
        throw Exception(jsonDecode(response.body)['message']);
      }
    } on SocketException {
      throw Exception('Server Connection Timeout');
    } on HttpException catch (e) {
      print("Error on http = $e");
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> postRequest(String path, final payload, {Map<String,String> header = const {}}) async {
    http.Response response;

    try {
      Map<String, String> httpHeader = {
        "Content-Type": "application/json",
      };

      if(header['token'] != null){
        httpHeader['token'] = header['token']!;
      }

      response = await client.post(
        Uri.http(baseUrl, path),
        headers: httpHeader,
        body: jsonEncode(payload),
      ).timeout(timeoutPeriod, onTimeout: () {
        throw Exception("Server Connection Timeout");
      });

      print(response.body);

      final statusCode = response.statusCode;

      if (statusCode == 200 || statusCode == 201) {
        if (response.body.isEmpty) {
          return <dynamic>[];
        } else {
          return jsonDecode(response.body);
        }
      } else if (statusCode == 401) {
        throw Exception(jsonDecode(response.body)['message']);
      } else {
        print(jsonDecode(response.body)['message']);
        throw Exception(jsonDecode(response.body)['message']);
      }
    } on SocketException {
      throw Exception('Server Connection Timeout');
    } on HttpException catch (e) {
      print("Error on http = $e");
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> patchRequest(String path, final payload, {Map<String,String> header = const {}}) async {
    http.Response response;

    try {
      Map<String, String> httpHeader = {
        "Content-Type": "application/json",
      };

      if(header['token'] != null){
        httpHeader['token'] = header['token']!;
      }

      response = await client.patch(
        Uri.http(baseUrl, path),
        headers: httpHeader,
        body: jsonEncode(payload),
      ).timeout(timeoutPeriod, onTimeout: () {
        throw Exception("Server Connection Timeout");
      });

      print(response.body);

      final statusCode = response.statusCode;
      if (statusCode == 200) {
        if (response.body.isEmpty) {
          return <dynamic>[];
        } else {
          return jsonDecode(response.body);
        }
      } else if (statusCode == 401) {
        throw Exception(jsonDecode(response.body)['message']);
      } else {
        print(jsonDecode(response.body)['message']);
        throw Exception(jsonDecode(response.body)['message']);
      }
    } on SocketException {
      throw Exception('Server Connection Timeout');
    } on HttpException catch (e) {
      print("Error on http = $e");
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<dynamic> deleteRequest(String path, final payload) async {
    http.Response response;

    try {
      response = await client.delete(
        Uri.http(baseUrl, path),
        headers: <String, String>{
          "Content-Type": "application/json",
        },
        body: jsonEncode(payload),
      ).timeout(timeoutPeriod, onTimeout: () {
        throw Exception("Server Connection Timeout");
      });

      final statusCode = response.statusCode;
      if (statusCode == 200) {
        if (response.body.isEmpty) {
          return <dynamic>[];
        } else {
          return jsonDecode(response.body);
        }
      } else if (statusCode == 401) {
        print('unauthorized');
        throw Exception(jsonDecode(response.body)['message']);
      } else {
        print(jsonDecode(response.body)['message']);
        throw Exception(jsonDecode(response.body)['message']);
      }
    } on SocketException {
      print('server timeout');
      throw Exception('Server Connection Timeout');
    } on HttpException catch (e) {
      print("Error on http = $e");
    } catch (e) {
      print('catch');
      throw Exception(e);
    }
  }
}