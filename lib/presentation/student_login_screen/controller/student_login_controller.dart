import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_campus_projects/config/app_config.dart';
import 'package:smart_campus_projects/core/utils/app_utils.dart';
import 'package:smart_campus_projects/repository/api/student_login_screen/service/student_login_service.dart';

import '../../profile_page/view/profile_page.dart';


class StudentLoginController extends ChangeNotifier {
  bool visibility = false;
  late SharedPreferences sharedPreferences;

  onLogin(BuildContext context, {required String id, required String pass}) {
    log("StudentLoginController -> onLogin()");
    var data = {"admission_number": id, "password": pass};
    StudentloginService.postLogin(data).then((resData) {
      log("token -> ${resData["data"]["access_token"]}");
      if (resData["status"] == 1) {
        storeLoginData(resData);
        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfilePage()));
        AppUtils.getAccessKey();
      } else {
        AppUtils.oneTimeSnackBar("Login Failed", context: context);
      }
      notifyListeners();
    });
  }

  storeLoginData(receivedData) async {
    log("StudentLoginController -> storeLoginData()");
    sharedPreferences = await SharedPreferences.getInstance();
    String storeData = jsonEncode(receivedData);
    log("storedData -> $storeData");
    sharedPreferences.setString(AppConfig.loginData, storeData);
  }
}
