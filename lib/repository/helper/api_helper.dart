import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class ApiHelper {
  static getData({required String endpoint, Map<String, String>? header}) async {
    log("ApiHelper -> getData()");
    final url = Uri.parse(endpoint); //TODO : add AppConfig base url
    log("Url -> $url");
    try {
      var response = await http.get(url, headers: header);
      log("StatusCode -> ${response.statusCode}");
      var decodedData = jsonDecode(response.body);
      log("Response -> ${response.body}");
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static postData({
    required String endpoint,
    Map<String, dynamic>? body,
    Map<String, String>? header,
  }) async {
    log("ApiHelper -> postData()");
    log("Body ->  $body");
    log("Header -> $header");
    final url = Uri.parse(endpoint); //TODO : add AppConfig base url
    log("Url -> $url");
    try{
      var response = await http.post(url,body: body,headers: header);
      log("StatusCode -> ${response.statusCode}");
      var decodedData = jsonDecode(response.body);
      log("Response -> ${response.body}");
      return decodedData;
    }catch(e){
      log("$e");
    }
  }
}
