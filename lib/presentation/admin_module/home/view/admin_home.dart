import 'package:flutter/material.dart';
import 'package:smart_campus_projects/core/constants/color_constants.dart';
import 'package:smart_campus_projects/presentation/admin_module/scanner_page/view/scanner_screen.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({super.key});

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
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
