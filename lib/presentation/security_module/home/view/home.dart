import 'package:flutter/material.dart';
import 'package:smart_campus_projects/core/constants/color_constants.dart';

import '../../scanner_page/view/scanner_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          "Security Control",
          style: TextStyle(fontFamily: "Nexa Bold", fontSize: 30),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: ColorConstants.gradientColors)),
        child: Center(
          child: ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                minimumSize: MaterialStatePropertyAll(Size(200, 50)),
                backgroundColor:
                    MaterialStateProperty.all(ColorConstants.primaryColor)),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ScannerScreen()));
            },
            child: Text(
              "Scan",
              style: TextStyle(color: ColorConstants.mainWhite, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
