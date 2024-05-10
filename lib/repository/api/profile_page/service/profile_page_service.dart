import 'dart:developer';

import 'package:smart_campus_projects/core/utils/app_utils.dart';
import 'package:smart_campus_projects/repository/helper/api_helper.dart';

class ProfilePageService {
  static Future<dynamic> fetchData() async {
    try {
      var decodedData = await ApiHelper.getData(
        endPoint: "profile/",
        header: ApiHelper.getApiHeader(access: await AppUtils.getAccessKey()),
      );
      return decodedData;
    } catch (e) {
      log("$e");
    }
  }
}
