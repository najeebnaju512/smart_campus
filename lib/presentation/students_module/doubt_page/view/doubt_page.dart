import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_campus_projects/presentation/students_module/doubt_page/controller/doubt_controller.dart';

import '../../../../core/constants/color_constants.dart';

class DoubtPage extends StatefulWidget {
  const DoubtPage({super.key});

  @override
  State<DoubtPage> createState() => _DoubtPageState();
}

class _DoubtPageState extends State<DoubtPage> {
  var msgController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: ColorConstants.gradientColors),
          ),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Image(
                          image: AssetImage("assets/images/backButton.png"),
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                      "assets/images/logo.png",
                    )),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Write Any doubt or clarification",
                      style: TextStyle(fontFamily: "Nexa Bold", fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                      width: MediaQuery.of(context).size.width * 0.75,
                      decoration: BoxDecoration(
                        color: ColorConstants.secondaryColor,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        controller: msgController,
                        maxLines: 20,
                        decoration: InputDecoration(
                          hintText: 'Enter your text',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.all(16),
                        ),
                      ),
                    ),
                  ],
                ),
                Consumer<DoubtController>(
                  builder: (context, controller, child) {
                    return ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          backgroundColor: MaterialStateProperty.all(
                              ColorConstants.primaryColor)),
                      onPressed: () {
                        controller.postMsg(context,
                            msg: msgController.text.trim());  // enquiry message passed to controller class
                        msgController.clear();
                      },
                      child: Text(
                        "Send",
                        style: TextStyle(
                            color: ColorConstants.mainWhite, fontSize: 20),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
