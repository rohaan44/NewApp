import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysense/utils/Colors.dart';
import 'package:paysense/views/DashboardScreen.dart';
import 'package:paysense/views/LoginScreen.dart';
import 'package:paysense/views/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return GetMaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor:
            isDarkMode ? ColorUtil.whitecolor : ColorUtil.blackcolor,
      ),
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    );
  }
}
