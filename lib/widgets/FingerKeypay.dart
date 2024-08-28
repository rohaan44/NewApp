import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class FingerKeypad extends StatefulWidget {
  final Function(String) onKeyPressed;
  final VoidCallback onPress;
  const FingerKeypad(
      {Key? key, required this.onKeyPressed, required this.onPress})
      : super(key: key);

  @override
  _FingerKeypadState createState() => _FingerKeypadState();
}

class _FingerKeypadState extends State<FingerKeypad> {
  late final LocalAuthentication auth;
   bool _supportState = false;
  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
          (bool isSupported) => setState(() {
            _supportState = isSupported;
          }),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildRow(['1', '2', '3']),
        buildRow(['4', '5', '6']),
        buildRow(['7', '8', '9']),
        buildRow(['fingerprint', '0', '⌫'], special: true),
      ],
    );
  }

  Widget buildRow(List<String> keys, {bool special = false}) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: keys.map((key) {
        if (special && key == 'fingerprint') {
          return Expanded(
            child: TextButton(
              onPressed: () {
                _authenticateAndNavigate(context);
              },
              child: Icon(
                Icons.fingerprint,
                size: 25.sp,
                color: isDarkMode ? Colors.white : Colors.black87,
              ),
            ),
          );
        } else {
          return Expanded(
            child: TextButton(
              onPressed: () => widget.onKeyPressed(key),
              child: Text(key,
                  style: GoogleFonts.poppins(
                      color: isDarkMode ? Colors.white : Colors.black87,
                      fontSize: 25.sp,
                      height: 2.1,
                      fontWeight: FontWeight.w500)),
            ),
          );
        }
      }).toList(),
    );
  }

  Future<void> _authenticateAndNavigate(BuildContext context) async {
    try {
      bool authenticated = await _authenticate();

      if (authenticated) {
        Get.toNamed("/TransScriptView");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Authentication failed'),
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<bool> _authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Scan Fingerprint to Authenticate',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      return authenticated;
    } on PlatformException catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics =
        await auth.getAvailableBiometrics();
    if (kDebugMode) {
      print("List of availableBiometrics: $availableBiometrics");
    }
    if (!mounted) {
      return;
    }
  }
}
