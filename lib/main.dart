import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paysense/firebase_options.dart';
import 'package:paysense/res/routes/Routes.dart';
import 'package:paysense/utils/Colors.dart';
import 'package:paysense/views/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Debug prints to check initialization
  debugPrint('Initializing Firebase...');

  if (Firebase.apps.isEmpty) {
    debugPrint('No Firebase apps initialized. Initializing now...');
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    debugPrint('Firebase initialized.');
  } else {
    debugPrint('Firebase already initialized.');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarContrastEnforced: false,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness:
          isDarkMode ? Brightness.light : Brightness.dark,
      systemNavigationBarColor:
          isDarkMode ? ColorUtil.blackcolor : ColorUtil.whitecolor,
      statusBarColor: Colors.transparent,
      systemStatusBarContrastEnforced: false,
    ));

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: isDarkMode
          ? SystemUiOverlayStyle.dark.copyWith(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.light,
              systemNavigationBarColor: ColorUtil.whitecolor,
              systemNavigationBarIconBrightness: Brightness.dark,
              systemStatusBarContrastEnforced: false,
            )
          : SystemUiOverlayStyle.light.copyWith(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
              systemNavigationBarColor: ColorUtil.blackcolor,
              systemNavigationBarIconBrightness: Brightness.dark,
              systemStatusBarContrastEnforced: false),
      child: GetMaterialApp(
          darkTheme: ThemeData.dark(),
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          home: const SplashScreen(),
          getPages: AppRoutes.routes),
    );
  }
}
