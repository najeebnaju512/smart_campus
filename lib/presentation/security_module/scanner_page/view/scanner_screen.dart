import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:smart_campus_projects/core/utils/app_utils.dart';

import '../../../../core/constants/color_constants.dart';
import '../controller/scanner_controller.dart';

class ScannerScreen extends StatefulWidget {
  @override
  _ScannerScreenState createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  ScanController scanController = ScanController();
  String _barcode = '';
  @override
  void initState() {
    _scanBarcode(); // Automatically trigger barcode scanning when the app starts
    super.initState();
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
        AppUtils.oneTimeSnackBar("Scan Canceled",
            context: context, bgColor: Colors.red);
        return; // Exit the method if user cancels
      }
      // Navigate to the next screen after scanning
      if (_barcode.isNotEmpty) {
        scanController.postId(context, id: barcode); // datas got from scaning has passed to controller class
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
                gradient:
                    LinearGradient(colors: ColorConstants.gradientColors)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                      minimumSize: MaterialStatePropertyAll(Size(200, 50)),
                      backgroundColor: MaterialStateProperty.all(
                          ColorConstants.primaryColor)),
                  onPressed: () {
                    _scanBarcode();
                  },
                  child: Text(
                    "Scan",
                    style: TextStyle(
                        color: ColorConstants.mainWhite, fontSize: 20),
                  ),
                ),
              ],
            )));
  }
}
