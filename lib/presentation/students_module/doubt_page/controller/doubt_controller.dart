import 'package:flutter/material.dart';
import 'package:smart_campus_projects/core/utils/app_utils.dart';
import 'package:smart_campus_projects/repository/api/doubt_page/service/doubt_service.dart';

class DoubtController extends ChangeNotifier {
  postMsg(BuildContext context, {required String msg}) {
    Map<String,String> data = {"description": msg};
    DoubtService.postmsg(data).then((resData) {//passing enquiry message to backend 
      if (resData["status"] == 1) {
        AppUtils.oneTimeSnackBar("Enquiry Added Successfully",
            context: context, bgColor: Colors.green);
      } else {
        AppUtils.oneTimeSnackBar("Enquiry Failed",
            context: context, bgColor: Colors.red);
      }
    });
    notifyListeners();
  }
}
