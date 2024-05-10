import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_campus_projects/core/constants/color_constants.dart';
import 'package:smart_campus_projects/presentation/security_module/home/view/home.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.status, this.username});
  final bool status;
  final String? username;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        return await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                    backgroundColor: ColorConstants.iconBlue,
                    title: Text(
                      'Do you wish to go back',
                    ),
                    actions: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "No",
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                  (route) => false);
                            },
                            child: Text(
                              "Yes",
                            ),
                          )
                        ],
                      )
                    ])); // Handle if showDialog returns null
      },
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: ColorConstants.gradientColors),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 140,
                  width: 140,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      "assets/images/uts_logo_shape.png",
                    )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    if (status)
                      Text(
                        "Name : $username ",
                        style: TextStyle(
                            fontFamily: "Nexa Bold",
                            fontSize: 30,
                            color: Colors.black),
                      ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      status
                          ? "Attendance Added Successfully"
                          : "Attendance Adding Failed",
                      style: TextStyle(fontFamily: "Nexa Bold", fontSize: 30),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      child: Lottie.asset(
                        status
                            ? "assets/animation/success.json"
                            : "assets/animation/failed.json",
                        width: 200,
                        height: 200,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        minimumSize: MaterialStateProperty.all(Size(200, 50)),
                        backgroundColor: MaterialStateProperty.all(
                            ColorConstants.primaryColor),
                      ),
                      onPressed: () {
                         Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Home()),
                                  (route) => false);
                      },
                      child: Text(
                        "Scan Next",
                        style: TextStyle(
                            color: ColorConstants.mainWhite, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
