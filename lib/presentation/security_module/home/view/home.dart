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
          "Admin Control",
          style: TextStyle(fontFamily: "Nexa Bold", fontSize: 30),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: ColorConstants.gradientColors)),
        child: ScannerScreen()
      ),
    );
  }
}
