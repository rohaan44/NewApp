import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/SignupController.dart';
import 'package:paysense/utils/Colors.dart';
import 'package:paysense/views/LoginScreen.dart';
import 'package:paysense/views/UiTemplate.dart';
import 'package:paysense/widgets/Button.dart';
import 'package:paysense/widgets/CustomTextfield.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SignupController controller = Get.put(SignupController());
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
        child: GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            const Uitemplate(),
            const Positioned(
                bottom: 0,
                right: -100,
                child: SizedBox(height: 150, child: Uitemplate())),
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.09,
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: Text('Hello..!',
                          style: GoogleFonts.poppins(
                              color: isDarkMode
                                  ? ColorUtil.blackcolor
                                  : ColorUtil.whitecolor,
                              fontSize: 20,
                              height: 1.17,
                              fontWeight: FontWeight.w500)),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      child: RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(children: [
                            TextSpan(
                                text: 'Registered your self to',
                                style: GoogleFonts.poppins(
                                    height: 1.3,
                                    fontSize: 16,
                                    color: isDarkMode
                                        ? ColorUtil.blackcolor
                                        : ColorUtil.whitecolor,
                                    fontWeight: FontWeight.w400)),
                            TextSpan(
                                text: ' Pay Sense',
                                style: GoogleFonts.poppins(
                                    height: 1.3,
                                    fontSize: 16,
                                    color: ColorUtil.bgblue,
                                    fontWeight: FontWeight.w500)),
                            TextSpan(
                                text: ' because it’s your Money your Hold  ',
                                style: GoogleFonts.poppins(
                                    height: 1.5,
                                    fontSize: 16,
                                    color: isDarkMode
                                        ? ColorUtil.blackcolor
                                        : ColorUtil.whitecolor,
                                    fontWeight: FontWeight.w400))
                          ])),
                    ),
                    SizedBox(
                      height: Get.height * 0.08,
                    ),
                    Form(
                      key: controller.formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            RoundedTextField(
                              focusNode: controller.emailFocusNode,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your email';
                                }
                                return null;
                              },
                              controller: controller.emailController,
                              hintText: 'Email',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RoundedTextField(
                              focusNode: controller.fullNameFocusNode,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your Fullname';
                                }
                                return null;
                              },
                              controller: controller.fullNameController,
                              hintText: 'Fullname',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            RoundedTextField(
                              focusNode: controller.phoneNumberFocusNode,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your phone number';
                                }
                                return null;
                              },
                              controller: controller.phoneNumberController,
                              hintText: 'Phone Number',
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Obx(() {
                              return RoundedTextField(
                                keyboardType: TextInputType.number,
                                obscureText: controller.isHiddenPassword.value,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your pin';
                                  }
                                  if (value.length != 4 ||
                                      !RegExp(r'^\d{4}$').hasMatch(value)) {
                                    return 'The pin must be a 4-digit number';
                                  }
                                  return null;
                                },
                                controller: controller.pinController,
                                hintText: "Pin",
                                suffixIcon: GestureDetector(
                                    onTap: () {
                                      controller.isHiddenPassword.value =
                                          !controller.isHiddenPassword.value;
                                    },
                                    child: Icon(
                                        color: const Color(0xff979797),
                                        controller.isHiddenPassword.value
                                            ? Icons.visibility_off
                                            : Icons.visibility)),
                                focusNode: controller.pinFocusNode,
                              );
                            }),
                            const SizedBox(
                              height: 10,
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: 'You are signing up as an ',
                                  style: GoogleFonts.poppins(
                                      color: isDarkMode
                                          ? ColorUtil.blackcolor
                                          : ColorUtil.whitecolor,
                                      height: 1.5,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w300)),
                              TextSpan(
                                  text: 'Individual',
                                  style: GoogleFonts.poppins(
                                      height: 1.5,
                                      fontSize: 16,
                                      color: ColorUtil.bgblue,
                                      fontWeight: FontWeight.w500)),
                            ])),
                            SizedBox(
                              height: Get.height * 0.08,
                            ),
                            Obx(
                              () => DummyButton(
                                textClr: ColorUtil.whitecolor,
                                title: "Register",
                                clr: const Color(0xff459BFF),
                                isLoading: controller.isLoading.value,
                                onPress: () {
                                  if (controller.formKey.currentState!
                                      .validate()) {
                                    controller.register();
                                    log("register button pressed");
                                  }
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Text.rich(
                        TextSpan(
                          text: "Already have an account? ",
                          style: GoogleFonts.poppins(
                            color: isDarkMode
                                ? ColorUtil.blackcolor
                                : ColorUtil.whitecolor,
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Login',
                              style: GoogleFonts.poppins(
                                color: Colors.blue,
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
