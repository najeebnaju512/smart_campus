import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smart_campus_projects/core/utils/app_utils.dart';
import '../../../../repository/api/admin_module/add_attendence/service/scan_service.dart';
import '../../result_page/view/result_page.dart';

class ScanController extends ChangeNotifier {
  postId(BuildContext context, {required String id}) {
    late bool isAdded;
    ScanService.postId(id).then((data) { //data is passed to backend 
      if (data["status"] == 1) {// if suceeded navigate to result screen with sucesess message
        isAdded = true;
        log("isAdded=$isAdded");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ResultScreen(
                    status: isAdded, username: data["data"]["username"])));
        AppUtils.oneTimeSnackBar("Attendance Added Successfully",
            context: context, bgColor: Colors.green);
      } else { // else navigate to result screen with failed message
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
