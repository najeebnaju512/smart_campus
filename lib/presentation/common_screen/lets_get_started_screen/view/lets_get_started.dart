import 'package:flutter/material.dart';
import 'package:smart_campus_projects/core/constants/color_constants.dart';

import '../../login_screen/view/student_login_screen.dart';

class LetsGetStarted extends StatefulWidget {
  const LetsGetStarted({super.key});

  @override
  State<LetsGetStarted> createState() => _LetsGetStartedState();
}

class _LetsGetStartedState extends State<LetsGetStarted> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: ColorConstants.gradientColors)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Image(image: AssetImage("assets/images/logo.png")),
                const Image(image: AssetImage("assets/images/smartCampus.png")),
                RichText(
                  text: TextSpan(
                    children: [
                      const TextSpan(
                        text: "Smart",
                        style: TextStyle(
                            color: Colors.orange,
                            fontFamily: "Nexa Bold",
                            fontSize: 30),
                      ),
                      TextSpan(
                        text: "Campus",
                        style: TextStyle(
                            color: Colors.blueAccent.shade700,
                            fontFamily: "Nexa Bold",
                            fontSize: 30),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Welcome to SmartCampus",
                      style: TextStyle(
                          color: ColorConstants.mainWhite,
                          fontSize: 24,
                          fontFamily: "Nexa Regular"),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Experience the future of student identification with our electronic Student ID Card App!",
                      style: TextStyle(
                          fontFamily: "Nexa Regular",
                          fontSize: 18,
                          color: ColorConstants.mainWhite),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Your digital identity is securely stored on your smartphone",
                      style: TextStyle(
                          fontFamily: "Nexa Regular",
                          fontSize: 18,
                          color: ColorConstants.mainWhite),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      minimumSize: MaterialStatePropertyAll(Size(200, 50)),
                      backgroundColor: MaterialStateProperty.all(
                          ColorConstants.primaryColor)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: Text(
                    "Let's Start",
                    style: TextStyle(
                        color: ColorConstants.mainWhite, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
