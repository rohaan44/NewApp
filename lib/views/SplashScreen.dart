import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/Images.dart';
import 'package:paysense/views/HomeScreen.dart';
import 'package:paysense/views/UiTemplate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 5), () {
      Get.off(() => HomeScreen()); // Navigate to LoginView
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Uitemplate(),
          const Positioned(
              bottom: 0,
              right: -100,
              child: SizedBox(height: 150, child: Uitemplate())),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  width: Get.width * 0.8,
                  DummyImg.splashLogo,
                  semanticsLabel: 'Splash Logo', // Optional: For accessibility
                  placeholderBuilder: (BuildContext context) =>
                      CircularProgressIndicator(), // Optional: Placeholder while loading
                  fit: BoxFit.contain,
                ),
              ),
              Center(
                child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      'Your Money Your Hold',
                      style: GoogleFonts.poppins(
                        fontSize: Get.width * 0.077,
                        color: const Color(0xff459BFF),
                        fontWeight: FontWeight.w400,
                      ),
                    )),
              )
            ],
          ),
        ],
      ),
    );
  }
}
