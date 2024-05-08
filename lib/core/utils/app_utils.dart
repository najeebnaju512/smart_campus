import 'dart:convert';
import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../config/app_config.dart';

class AppUtils {
  late SharedPreferences sharedPreferences;
  //to get access key
  static Future<String?> getAccessKey() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    log("getAccessKey() sharedprefrence object created");

    if (sharedPreferences.get(AppConfig.loginData) != null) {
      log("getAccessKey()->checked if AppConfig.LOGIN_DATA is null");
      final access = jsonDecode(
          sharedPreferences.get(AppConfig.loginData) as String)['access'];
      log("stored 'access' from AppConfig.LOGIN_DATA to access in getAccessKey() ");
      return access;
    } else {
      log("getAccessKey() returned null");
      return null;
    }
  }


  static oneTimeSnackBar(
    String? message, {
    int time = 2,
    Color? bgColor,
    TextStyle? textStyle,
    required BuildContext context,
    bool showOnTop = false,
  }) {
    ScaffoldMessenger.of(context).clearSnackBars();

    ///To CLEAR PREVIOUS SNACK BARS
    return ScaffoldMessenger.of(context)
        // ScaffoldMessenger.of(context??Routes.router.routerDelegate.navigatorKey.currentState!.context)
        .showSnackBar(
      SnackBar(
        /*action:SnackBarAction(label: "Ok",
        onPressed: (){
          SystemSettings.internalStorage();
        },
        ) ,*/

        behavior: showOnTop ? SnackBarBehavior.floating : null,
        backgroundColor: bgColor ?? Colors.white60,
        content: Text(message!, style: textStyle ),
        duration: Duration(seconds: time),
        margin: showOnTop
            ? EdgeInsets.only(
                bottom: MediaQuery.of(context).size.height - 100,
                right: 20,
                left: 20)
            : null,
      ),
    );
  }
}