import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/TransconfirmController.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';
import 'package:paysense/views/UiTemplate.dart';
import 'package:paysense/widgets/FingerKeypay.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class TransConfirmScreen extends StatelessWidget {
  const TransConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final TransConfirmController transController =
        Get.put(TransConfirmController());
    return SafeArea(
      child: Scaffold(
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
                  padding:
                      const EdgeInsets.only(left: 20, top: 45.0, bottom: 20),
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
                              ? ColorUtil.blackcolor
                              : ColorUtil.whitecolor,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "Enter your PIN",
                  style: GoogleFonts.poppins(
                    color: isDarkMode
                        ? ColorUtil.blackcolor
                        : ColorUtil.whitecolor,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.12,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 30),
                  child: PinCodeTextField(
                    appContext: context,
                    length: 4,
                    keyboardType: TextInputType.none,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                        shape: PinCodeFieldShape.underline,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: 40,
                        fieldWidth: 40,
                        activeFillColor: isDarkMode
                            ? ColorUtil.blackcolor
                            : ColorUtil.whitecolor,
                        inactiveFillColor: Colors.transparent,
                        inactiveColor: ColorUtil.bgblue,
                        inactiveBorderWidth: 5),

                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    // errorAnimationController: errorController,
                    controller: transController.textControl,
                    onCompleted: (v) {
                      if (kDebugMode) {
                        transController.verifyPin();
                      }
                    },
                    onChanged: (value) {
                      if (kDebugMode) {
                        print(value);
                      }
                      // transController.inputText = value;
                    },
                    beforeTextPaste: (text) {
                      if (kDebugMode) {
                        print("Allowing to paste $text");
                      }
                      //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                      //but you can show anything you want here, like your pop up saying wrong paste format or etc
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
                          ? ColorUtil.blackcolor
                          : ColorUtil.whitecolor,
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
      ),
    );
  }
}
