import 'dart:async';
import 'dart:io'; // For InternetAddress
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For SystemNavigator
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
    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    bool isConnected = await _hasInternetConnection();
    if (isConnected) {
      // Navigate to HomeScreen after 5 seconds
      Timer(const Duration(seconds: 5), () {
        Get.off(() => HomeScreen());
      });
    } else {
      // Show an alert dialog and keep checking
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showNoInternetDialog();
      });
    }
  }

  Future<bool> _hasInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      }
    } on SocketException catch (_) {
      // Handle the exception if needed
    }
    return false;
  }

  void _showNoInternetDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Text('No Internet Connection'),
        content: Text('Please check your internet connection and try again.'),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(); // Close the dialog
              bool isConnected = await _hasInternetConnection();
              if (!isConnected) {
                // Retry checking after a short delay
                Future.delayed(
                    const Duration(seconds: 5), _showNoInternetDialog);
              } else {
                // Navigate to HomeScreen after connection is restored
                Get.off(() => HomeScreen());
              }
            },
            child: Text('Retry'),
          ),
          TextButton(
            onPressed: () {
              SystemNavigator.pop(); // Exit the app
            },
            child: Text('Exit'),
          ),
        ],
      ),
    );
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
            child: SizedBox(height: 150, child: Uitemplate()),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  width: Get.width * 0.8,
                  DummyImg.splashLogo,
                  semanticsLabel: 'Splash Logo',
                  placeholderBuilder: (BuildContext context) =>
                      CircularProgressIndicator(),
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
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
