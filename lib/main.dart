import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:paysense/firebase_options.dart';
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
// SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//   systemNavigationBarContrastEnforced: false,
//   systemNavigationBarDividerColor: Colors.transparent,
//   systemNavigationBarIconBrightness: isDarkMode ? Brightness.light : Brightness.dark,
//   systemNavigationBarColor: Colors.transparent,
// ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    // Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
    return AnnotatedRegion(
        value: const SystemUiOverlayStyle(
            systemNavigationBarContrastEnforced: false,
            systemNavigationBarDividerColor: Colors.transparent,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.transparent,
            statusBarColor: Colors.transparent,
            systemStatusBarContrastEnforced: false),
        child: GetMaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor:
                isDarkMode ? ColorUtil.whitecolor : ColorUtil.blackcolor,
          ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
        ));
  }
}
