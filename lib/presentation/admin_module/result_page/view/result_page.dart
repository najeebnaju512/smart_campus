import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_campus_projects/core/constants/color_constants.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.status, this.username});
  final bool status;
  final String? username;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: ColorConstants.gradientColors),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Container(
                    height: 140,
                    width: 140,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                        "assets/images/uts_logo_shape.png",
                      )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    status==true? Text(
                      "Name : $username ",
                      style: TextStyle(
                          fontFamily: "Nexa Bold",
                          fontSize: 30,
                          color: Colors.black),
                    ):SizedBox(),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      status == true
                          ? "Attendance Added Successfull"
                          : "Attendance Adding Failed",
                      style: TextStyle(fontFamily: "Nexa Bold", fontSize: 30),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Lottie.asset(
                        status == true
                          ? "assets/animation/succeses.json"
                          : "assets/animation/failed.json",
                        width: 200,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )),
    );
  }
}
