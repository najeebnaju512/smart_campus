import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_campus_projects/common_screen/splash_screen/view/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp( theme: ThemeData(
      appBarTheme: Theme.of(context).appBarTheme.copyWith(systemOverlayStyle:SystemUiOverlayStyle.light),
    ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
