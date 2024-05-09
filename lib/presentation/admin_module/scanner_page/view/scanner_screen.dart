import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:smart_campus_projects/core/utils/app_utils.dart';
import 'package:smart_campus_projects/presentation/admin_module/scanner_page/controller/scanner_controller.dart';

import '../../../../core/constants/color_constants.dart';

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  ScanController scanController = ScanController();

  bool isCancel=false;
  String _barcode = '';
  @override
  void initState() {
    super.initState();
    _scanBarcode(); // Automatically trigger barcode scanning when the app starts
  }

  Future<void> _scanBarcode() async {
    try {
      String barcode = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.DEFAULT,
      );
      setState(() {
        _barcode = barcode;
      });
      if (barcode == '-1') {
        // User cancelled scanning, navigate to another screen or perform any action
        isCancel = true;
        AppUtils.oneTimeSnackBar("Scan Failed",
            context: context, bgColor: Colors.red);
        return; // Exit the method if user cancels
      }
      // Navigate to the next screen after scanning
      if (_barcode.isNotEmpty) {
        scanController.postId(context, id: barcode);
      }
    } on PlatformException catch (e) {
      print("Error scanning barcode: ${e.message}");
      setState(() {
        _barcode = 'Failed to scan barcode';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
        body: Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: ColorConstants.gradientColors)),
      child: isCancel==false? Center(child: CircularProgressIndicator()):Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Center(
              child: Text(
                "Scaning Canceled",
                style: TextStyle(
                    fontFamily: "Nexa Bold", fontSize: 26, color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style: ButtonStyle(
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                minimumSize: MaterialStatePropertyAll(Size(200, 50)),
                backgroundColor:
                    MaterialStateProperty.all(ColorConstants.primaryColor)),
            onPressed: () {
              _scanBarcode();
            },
            child: Text(
              "Scan Again",
              style: TextStyle(color: ColorConstants.mainWhite, fontSize: 20),
            ),
          ),
        ],
      ),
    ));
  }
}
