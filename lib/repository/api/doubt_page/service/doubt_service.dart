import 'dart:developer';

import 'package:smart_campus_projects/repository/helper/api_helper.dart';

import '../../../../core/utils/app_utils.dart';

class DoubtService {
  static Future<dynamic> postmsg(Map<String, String> data) async {
    try {
      var decodedData = await ApiHelper.postData(
        endPoint: "enqui-student/",
        body: data,
        header: apiHeader(access: await AppUtils.getAccessKey()),
      );
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }

  static Map<String, String> apiHeader({String? access, String? dbName}) {
    if (access != null) {
      return {'Accept': '*/*', 'Authorization': 'Bearer $access'};
    } else if (dbName != null) {
      return {'Content-Type': 'application/json', 'dbName': dbName};
    } else {
      return {
        'Content-Type': 'application/json',
      };
    }
  }
}
