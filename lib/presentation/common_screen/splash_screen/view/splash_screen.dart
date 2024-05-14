import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_campus_projects/config/app_config.dart';
import 'package:smart_campus_projects/presentation/common_screen/lets_get_started_screen/view/lets_get_started.dart';
import 'package:smart_campus_projects/presentation/common_screen/login_screen/view/student_login_screen.dart';

import '../../../../core/constants/color_constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //Function to check if the app is opened for the first time and to show lets get started screen
  _checkSeen() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool _seen = (sharedPreferences.getBool(AppConfig.seen) ?? false);
    if (_seen) { //if it has opened before then it will navigate to login screen
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {  // else to getstarted screen
      await sharedPreferences.setBool(AppConfig.seen, true);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LetsGetStarted()));
    }
  }

  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
      _checkSeen();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: ColorConstants.gradientColors),
        ),
        child: Image.asset(
          "assets/images/uts_logo_shape.png",
          scale: size.width * .005,
        ),
      ),
    );
  }
}
