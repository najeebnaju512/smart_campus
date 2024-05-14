import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_campus_projects/core/constants/color_constants.dart';
import 'package:smart_campus_projects/global_widgets/reusable_textfield_widget.dart';

import '../controller/student_login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var idController = TextEditingController();
  var passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10, top: 20),
            height: size.height,
            decoration: BoxDecoration(gradient: LinearGradient(colors: ColorConstants.gradientColors)),
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
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ReusableTextFieldWidget(
                    controller: idController,
                    hinttext: "♦️ID Number",
                    name: "ID Number",
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: ReusableTextFieldWidget(
                    controller: passController,
                    obscureText: true,
                    autofocus: false,
                    hinttext: "♦️Password",
                    name: "Password",
                    decoration: InputDecoration(
                      fillColor: ColorConstants.mainWhite,
                      filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Consumer<LoginController>(
                      builder: (context, control, _) {
                        return ElevatedButton(
                          style: ButtonStyle(
                            minimumSize: MaterialStatePropertyAll(
                              Size(220, 60),
                            ),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                            backgroundColor: MaterialStatePropertyAll(ColorConstants.primaryColor),
                          ),
                          onPressed: () {
                            control.onLogin(context,
                                id: idController.text.trim(), pass: passController.text.trim());  //controller class function is done through this method where navigation to next page is also done
                            idController.clear();
                            passController.clear();
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: ColorConstants.mainWhite,
                                fontFamily: "Nexa Bold",
                                fontSize: size.width / 16),
                          ),
                        );
                      },
                    )),
                const SizedBox(height: 30),
                Spacer(),
                Row(
                  children: [
                    Text("Note:♦️fields are required"),
                  ],
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
