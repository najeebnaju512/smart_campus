import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:smart_campus_projects/core/utils/app_utils.dart';
import 'package:smart_campus_projects/repository/api/student_login_screen/service/student_login_service.dart';

import '../../user_page/view/user_page.dart';

class StudentLoginController extends ChangeNotifier {
  onlogin(BuildContext context, {required String id, required String pass}) {
    var data = {"admission_number": id, "password": pass};
    try {
      StudentloginService.postLogin(data).then((resData) {
        if (resData["status"] == 1) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UserPage()));
        } else {
          AppUtils.oneTimeSnackBar("Login Failed", context: context);
        }
      });
      notifyListeners();
    } catch (e) {
      log("$e");
    }
  }
}
