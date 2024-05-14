import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_campus_projects/config/app_config.dart';
import 'package:smart_campus_projects/core/utils/app_utils.dart';
import 'package:smart_campus_projects/repository/api/student_login_screen/service/student_login_service.dart';

import '../../../security_module/home/view/home.dart';
import '../../../students_module/profile_page/view/profile_page.dart';

class LoginController extends ChangeNotifier {
  bool visibility = false;
  late SharedPreferences sharedPreferences;

  onLogin(BuildContext context, {required String id, required String pass}) {
    log("LoginController -> onLogin()");
    var data = {"admission_number": id, "password": pass};
    if (id == "admin" && pass == "1234") { //if the values entered is id = "admin" && pass = "1234" then navigate to home page of security to scan
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) => Home()), (route) => false);
    } else { // else case Api is called to fetch data of students
      StudentloginService.postLogin(data).then((resData) {
        if (resData["status"] == 1) { // if suceses navigate to profile of student
          storeLoginData(resData);  // store data recieved from api"backend"
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
              (route) => false);
          AppUtils.getAccessKey();
        } else { //if failed snack bar is shown
          AppUtils.oneTimeSnackBar("Login Failed", context: context,bgColor: Colors.red);
        }
        notifyListeners();
      });
    }
  }

  storeLoginData(receivedData) async {
    log("LoginController -> storeLoginData()");
    sharedPreferences = await SharedPreferences.getInstance();
    String storeData = jsonEncode(receivedData);
    sharedPreferences.setString(AppConfig.loginData, storeData);
  }
}
