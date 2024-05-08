import 'dart:developer';

import 'package:smart_campus_projects/repository/helper/api_helper.dart';

class StudentloginService {
  static Future<dynamic> postLogin(Map<String, String> data) async {
    try {
      var decodedData = await ApiHelper.postData(endPoint: "login/",body: data);
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
