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
    log("AppUtils -> getAccessKey() sharedPreferences object created");

    if (sharedPreferences.get(AppConfig.loginData) != null) {
      final access = jsonDecode(sharedPreferences.get(AppConfig.loginData) as String)['data']["access_token"];
      return access;
    } else {
      log("getAccessKey() returned null");
      return null;
    }
  }

  //show Snackbar
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
        behavior: showOnTop ? SnackBarBehavior.floating : null,
        backgroundColor: bgColor ?? Colors.white60,
        content: Text(message!, style: textStyle),
        duration: Duration(seconds: time),
        margin: showOnTop
            ? EdgeInsets.only(bottom: MediaQuery.of(context).size.height - 100, right: 20, left: 20)
            : null,
      ),
    );
  }
}
