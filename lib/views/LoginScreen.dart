import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/LoginController.dart';
import 'package:paysense/utils/Colors.dart';
import 'package:paysense/views/UiTemplate.dart';
import 'package:paysense/widgets/Button.dart';
import 'package:paysense/widgets/CustomTextfield.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final Logincontroller loginController = Get.put(Logincontroller());
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const Uitemplate(),
            const Positioned(
                bottom: 0,
                right: -100,
                child: SizedBox(height: 150, child: Uitemplate())),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(height: Get.height * 0.09),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Welcome back..!',
                      style: GoogleFonts.poppins(
                        fontSize: 28,
                        color: isDarkMode
                            ? ColorUtil.blackcolor
                            : ColorUtil.whitecolor,
                        height: 1.17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Container(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      textAlign: TextAlign.left,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Login to',
                            style: GoogleFonts.poppins(
                              height: 1.5,
                              fontSize: 17,
                              color: isDarkMode
                                  ? ColorUtil.blackcolor
                                  : ColorUtil.whitecolor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextSpan(
                            text: ' Pay Sense ',
                            style: GoogleFonts.poppins(
                              height: 1.5,
                              fontSize: 17,
                              color: ColorUtil.bgblue,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          TextSpan(
                            text: ' to enjoy your',
                            style: GoogleFonts.poppins(
                              height: 1.5,
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                              color: isDarkMode
                                  ? ColorUtil.blackcolor
                                  : ColorUtil.whitecolor,
                            ),
                          ),
                          TextSpan(
                            text: '\nfast & free transactions  ',
                            style: GoogleFonts.poppins(
                              height: 1.5,
                              fontSize: 17,
                              color: isDarkMode
                                  ? ColorUtil.blackcolor
                                  : ColorUtil.whitecolor,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.08),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        RoundedTextField(
                          controller: loginController.emailController,
                          focusNode: loginController.emailFocusNode,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your Account Number';
                            }
                            return null;
                          },
                          hintText: 'Email',
                        ),
                        SizedBox(height: Get.height * 0.030),
                        Obx(
                          () => RoundedTextField(
                            focusNode: loginController.pinFocusNode,
                            keyboardType: TextInputType.number,
                            obscureText: loginController.ispasswordHidden.value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your Pin';
                              }
                              return null;
                            },
                            controller: loginController.pinController,
                            hintText: "Pin",
                            suffixIcon: GestureDetector(
                              onTap: () {
                                loginController.ispasswordHidden.value =
                                    !loginController.ispasswordHidden.value;
                              },
                              child: Icon(
                                color: const Color(0xff979797),
                                loginController.ispasswordHidden.value
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: Get.height * 0.01),
                        Text(
                          "Forget Pin?",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            color: ColorUtil.bgblue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: Get.height * 0.05),
                        Obx(
                          () => DummyButton(
                            title: "Login",
                            clr: const Color(0xff459BFF),
                            isLoading: loginController.isLoading.value,
                            onPress: () {
                              print('Login button pressed');
                              if (_formKey.currentState!.validate()) {
                                print('Form validated');
                                log("Button Pressed");
                                loginController.login();
                              } else {
                                print('Form validation failed');
                              }
                            },
                            textClr: ColorUtil.whitecolor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
