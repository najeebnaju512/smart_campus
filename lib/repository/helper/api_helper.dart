import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../../config/app_config.dart';

class ApiHelper {
  static Map<String, String> getApiHeader({String? access, String? dbName}) {
    if (access != null) {
      return {'Content-Type': 'application/json', 'Authorization': 'Bearer $access' };
    } else if (dbName != null) {
      return {'Content-Type': 'application/json', 'dbName': dbName};
    } else {
      return {
        'Content-Type': 'application/json',
      };
    }
  }

  static getData({required String endPoint, Map<String, String>? header}) async {
    log("ApiHelper -> getData()");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("Url -> $url");
    try {
      var response = await http.get(url, headers: header);
      log("StatusCode -> ${response.statusCode}");
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static postData({
    required String endPoint,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    log("ApiHelper -> postData()");
    final url = Uri.parse(AppConfig.baseurl + endPoint);
    log("Url -> $url");
    try {
      var response = await http.post(url, body: body, headers: header);
      log("StatusCode -> ${response.statusCode}");
      var decodedData = jsonDecode(response.body);
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
