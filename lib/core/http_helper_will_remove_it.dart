import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'local/cache_helper.dart';

class HttpHelper {
  static const String _baseUrl = 'https://elagkapp.com/api/v1/';
  static const String _baseUrlForQuery = 'elagkapp.com';
  static const String _lastUrlForQuery = '/api/v1/';

  static Future<Map<String, dynamic>> getData(String path) async {
    final url = Uri.parse('$_baseUrl$path');
    final response = await http.get(url, headers: {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}'
    });
    return _handleResponse(response, path);
  }

  static Future<Map<String, dynamic>> getDataWithQuery(String path, Map<String, dynamic> query) async {
    final url = Uri.https(_baseUrlForQuery, '$_lastUrlForQuery$path', query);
    final response = await http.get(
      url,
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}'
      },
    );
    if (kDebugMode) {
      print(response.body);
    }
    return _handleResponse(response, path);
  }

  static Future<Map<String, dynamic>> postData(
      String path, Map<String, dynamic> body) async {
    final url = Uri.parse('$_baseUrl$path');
    final response = await http.post(url, body: body, headers: {
      'Accept': 'application/json',
      // 'Authorization': 'Bearer ${CacheHelper.getData(key: 'token')}'
    });
    return _handleResponse(response, path);
  }

  static dynamic _handleResponse(http.Response response, String path) {
    if (kDebugMode) {
      print("${response.statusCode} path is : $path");
    }

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 422) {
      if (kDebugMode) {
        print(jsonDecode(response.body));
      }
      handleErrorAuth(response);
    } else {
      throw Exception('Failed to load data');
    }
  }
}

void handleErrorAuth(http.Response response) async {
  var errors = await jsonDecode(response.body)['errors'];
  String errorEncoded = jsonEncode(errors);
  List split1 = errorEncoded.split('["').toList();
  List split2 = [];
  for (var element in split1) {
    split2.add(element.toString().split('."]'));
  }
  List finalL = [];
  for (var element in split2) {
    if (split2.indexOf(element) != 0) {
      finalL.add(element[0]);
    }
  }
  String result = (finalL.join(",")).toString().replaceAll(',', '\n');

  if (kDebugMode) {
    print(result);
  }

  Fluttertoast.showToast(msg: result);
}
