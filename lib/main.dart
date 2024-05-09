import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:smart_campus_projects/presentation/common_screen/login_screen/controller/student_login_controller.dart';
import 'package:smart_campus_projects/presentation/common_screen/splash_screen/view/splash_screen.dart';
import 'package:smart_campus_projects/presentation/students_module/profile_page/controller/profile_page_controller.dart';


void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LoginController()),
      ChangeNotifierProvider(create: (context) => ProfilePageController())
      // ChangeNotifierProvider(create: (context) => ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: Theme.of(context).appBarTheme.copyWith(systemOverlayStyle: SystemUiOverlayStyle.light),
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
