import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/QrTransconfirmController.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/views/UiTemplate.dart';
import 'package:paysense/widgets/FingerKeypay.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class QrTransConfirmScreen extends StatelessWidget {
  const QrTransConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final QrTransConfirmController transController =
        Get.put(QrTransConfirmController());
    return Scaffold(
      body: Stack(
        children: [
          const Uitemplate(),
          const Positioned(
              bottom: 0,
              right: -100,
              child: SizedBox(height: 150, child: Uitemplate())),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 45.0, bottom: 20),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: SvgPicture.asset(
                        DummyImg.chevleft,
                        width: 32,
                        height: 32,
                        color: isDarkMode
                            ? ColorUtil.whitecolor
                            : ColorUtil.blackcolor,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Enter your PIN",
                style: GoogleFonts.poppins(
                  color:
                      isDarkMode ? ColorUtil.whitecolor : ColorUtil.blackcolor,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.12,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
                child: PinCodeTextField(
                  cursorColor: ColorUtil.whitecolor,
                  appContext: context,
                  length: 4,
                  keyboardType: TextInputType.none,
                  obscureText: true,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 40,
                      fieldWidth: 40,
                      activeFillColor: ColorUtil.bgblue,
                      inactiveFillColor: Colors.transparent,
                      inactiveColor: ColorUtil.bgblue,
                      inactiveBorderWidth: 2),

                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                  controller: transController.textControl,
                  onCompleted: (v) {
                    print(
                        "Completed PIN: $v"); // Print entered PIN for debugging
                    transController.verifyPin(); // Directly call the verifyPin function
                  },
                  beforeTextPaste: (text) {
                    if (kDebugMode) {
                      print("Allowing to paste $text");
                    }

                    return true;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Forget PIN?",
                  style: GoogleFonts.poppins(
                    color: isDarkMode
                        ? ColorUtil.whitecolor
                        : ColorUtil.blackcolor,
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: FingerKeypad(
                  onPress: () {
                    // Get.toNamed("/TransScriptView");
                  },
                  onKeyPressed: (value) {
                    if (value == '⌫') {
                      if (transController.textControl.text.isNotEmpty) {
                        transController.textControl.text =
                            transController.textControl.text.substring(
                          0,
                          transController.textControl.text.length - 1,
                        );
                      }
                    } else {
                      transController.textControl.text += value;
                    }
                    transController.onTextChanged(
                      transController.textControl.text,
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
