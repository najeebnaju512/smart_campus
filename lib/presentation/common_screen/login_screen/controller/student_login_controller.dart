import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_campus_projects/config/app_config.dart';
import 'package:smart_campus_projects/core/utils/app_utils.dart';
import 'package:smart_campus_projects/presentation/admin_module/home/view/admin_home.dart';
import 'package:smart_campus_projects/repository/api/student_login_screen/service/student_login_service.dart';

import '../../../students_module/profile_page/view/profile_page.dart';

class LoginController extends ChangeNotifier {
  bool visibility = false;
  late SharedPreferences sharedPreferences;

  onLogin(BuildContext context, {required String id, required String pass}) {
    log("LoginController -> onLogin()");
    var data = {"admission_number": id, "password": pass};
    if (id == "admin" && pass == "1234") {
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => AdminHome()));
      Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => AdminHome()),
            (route) => false);
    }
    StudentloginService.postLogin(data).then((resData) {
      log("token -> ${resData["data"]["access_token"]}");
      if (resData["status"] == 1) {
        storeLoginData(resData);
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
            (route) => false);
        AppUtils.getAccessKey();
      } else {
        AppUtils.oneTimeSnackBar("Login Failed", context: context);
      }
      notifyListeners();
    });
  }

  storeLoginData(receivedData) async {
    log("LoginController -> storeLoginData()");
    sharedPreferences = await SharedPreferences.getInstance();
    String storeData = jsonEncode(receivedData);
    log("storedData -> $storeData");
    sharedPreferences.setString(AppConfig.loginData, storeData);
  }
}
