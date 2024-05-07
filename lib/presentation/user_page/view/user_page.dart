import 'package:flutter/material.dart';

import 'package:smart_campus_projects/core/constants/color_constants.dart';
import 'package:smart_campus_projects/presentation/doubt_page/view/doubt_page.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    color: ColorConstants.secondaryColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Image.asset(
                    "assets/images/img.png",
                    fit: BoxFit.cover,
                    colorBlendMode: BlendMode.lighten,
                  ),
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
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Column(
              children: [
                Text(
                  "Akram Ibrahim Kmala",
                  style: TextStyle(fontFamily: "Nexa Bold", fontSize: 30),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "2018493131",
                  style: TextStyle(fontFamily: "Nexa Bold", fontSize: 30),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Information Technology",
                  style: TextStyle(fontFamily: "Nexa Bold", fontSize: 20),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "91212872",
                  style: TextStyle(fontFamily: "Nexa Bold", fontSize: 20),
                ),
              ],
            ),
            Image.asset(
              "assets/images/barcode.png",
              width: 300,
              height: 300,
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DoubtPage()));
              },
              child: Text(
                "Note:Click here if you have any doubt or clarification",
                style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: ColorConstants.mainWhite,
                    decorationColor: ColorConstants.mainWhite),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
