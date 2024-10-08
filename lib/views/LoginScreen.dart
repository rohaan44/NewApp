import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/LoginController.dart';
import 'package:paysense/res/routes/RouteNames.dart';
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
    return GestureDetector(
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
                    SizedBox(height: Get.height * 0.099),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Welcome back..!',
                        style: GoogleFonts.poppins(
                          fontSize: Get.width * 0.1,
                          color: isDarkMode
                              ? ColorUtil.whitecolor
                              : ColorUtil.blackcolor,
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
                                fontSize: Get.width * 0.044,
                                color: isDarkMode
                                    ? ColorUtil.whitecolor
                                    : ColorUtil.blackcolor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' Pay Sense ',
                              style: GoogleFonts.poppins(
                                height: 1.5,
                                fontSize: Get.width * 0.048,
                                color: ColorUtil.bgblue,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextSpan(
                              text: ' to enjoy your',
                              style: GoogleFonts.poppins(
                                height: 1.5,
                                fontSize: Get.width * 0.044,
                                fontWeight: FontWeight.w400,
                                color: isDarkMode
                                    ? ColorUtil.whitecolor
                                    : ColorUtil.blackcolor,
                              ),
                            ),
                            TextSpan(
                              text: '\nfast & free transactions  ',
                              style: GoogleFonts.poppins(
                                height: 1.5,
                                fontSize: Get.width * 0.044,
                                color: isDarkMode
                                    ? ColorUtil.whitecolor
                                    : ColorUtil.blackcolor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Get.height * 0.06),
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
                              obscureText:
                                  loginController.ispasswordHidden.value,
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
                              fontSize: Get.width * 0.040,
                              color: ColorUtil.bgblue,
                              fontWeight: FontWeight.w600,
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: Get.height * 0.3,
                ),
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
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have and Account",
                        style: GoogleFonts.poppins(
                            fontSize: Get.width * 0.032,
                            color: isDarkMode
                                ? ColorUtil.whitecolor
                                : ColorUtil.blackcolor,
                            fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(RouteName.signupScreen);
                          },
                          child: Text("Sign Up",
                              style: GoogleFonts.poppins(
                                fontSize: Get.width * 0.040,
                                color: ColorUtil.bgblue,
                                fontWeight: FontWeight.w500,
                              ))),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}
