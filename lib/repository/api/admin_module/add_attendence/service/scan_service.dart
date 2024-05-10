import 'dart:developer';

import 'package:smart_campus_projects/repository/helper/api_helper.dart';

class ScanService {
  static Future<dynamic> postId(String id) async {
    try {
      var decodedData =
          await ApiHelper.postData(endPoint: "add-attendance/$id/");
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
