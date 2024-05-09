import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smart_campus_projects/core/utils/app_utils.dart';
import '../../../../repository/api/admin_module/add_attendence/service/scan_service.dart';
import '../../result_page/view/result_page.dart';

class ScanController extends ChangeNotifier {
  postId(BuildContext context, {required String id}) {
    late bool isAdded;
    log("ScanController++++==$id");
    ScanService.postId(id).then((data) {
      if (data["status"] == 1) {
        isAdded = true;
        AppUtils.oneTimeSnackBar("Attendance Added Successfully",
            context: context, bgColor: Colors.green);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultScreen(
                    status: isAdded, username: data["data"]["username"])));
      } else {
        isAdded = false;
        AppUtils.oneTimeSnackBar("Attendance Adding Failed",
            context: context, bgColor: Colors.red);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultScreen(
                      status: isAdded,
                    )));
      }
    });
    notifyListeners();
  }
}
