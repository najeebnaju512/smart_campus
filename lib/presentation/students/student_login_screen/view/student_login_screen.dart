import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_campus_projects/core/constants/color_constants.dart';
import 'package:smart_campus_projects/global_widgets/reusable_textfield_widget.dart';

import '../controller/student_login_controller.dart';

class StudentLoginScree extends StatelessWidget {
  const StudentLoginScree({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    var idController = TextEditingController();
    var passController = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: ColorConstants.gradientColors)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Image(image: AssetImage("assets/images/logo.png")),
                const SizedBox(
                  height: 20,
                ),
                const Image(
                  image: AssetImage("assets/images/smartCampus.png"),
                  height: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                const Center(
                  child: Text(
                    "Only for UTAS Student",
                    style: TextStyle(
                      fontFamily: "Nexa Bold",
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ReusableTextFieldWidget(
                    controller: idController,
                    hinttext: "♦️ID Number",
                    name: "ID Number",
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: ReusableTextFieldWidget(
                    controller: passController,
                    autofocus: false,
                    hinttext: "♦️Password",
                    name: "Password",
                    decoration: InputDecoration(
                      fillColor: ColorConstants.mainWhite,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                    ),
                  ),
                ),
                Center(child: Text("Forgot your ID Number or Password? ?")),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Consumer<StudentLoginController>(
                      builder: (context, control, _) {
                        return ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(
                              Size(220, 60),
                            ),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStatePropertyAll(
                                ColorConstants.primaryColor),
                          ),
                          onPressed: () {
                            control.onlogin(
                              context,
                                id: idController.text.trim(),
                                pass: passController.text.trim());

                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: ColorConstants.mainWhite,
                                fontFamily: "Nexa Bold",
                                fontSize: screenWidth / 16),
                          ),
                        );
                      },
                    )),
                const SizedBox(
                  height: 30,
                ),
                // ElevatedButton(
                //   style: ButtonStyle(
                //       shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                //           borderRadius: BorderRadius.circular(10))),
                //       minimumSize: MaterialStatePropertyAll(Size(80, 25)),
                //       backgroundColor:
                //           MaterialStateProperty.all(ColorConstants.mainBlack)),
                //   onPressed: () {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => StudentLoginScree()));
                //   },
                //   child: Text(
                //     "Exit",
                //     style: TextStyle(
                //         color: ColorConstants.mainWhite, fontSize: 20),
                //   ),
                // ),
                Spacer(),
                Row(
                  children: [
                    Text("Note:♦️fields are required"),
                  ],
                ),
                SizedBox(
                  height: 10,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
