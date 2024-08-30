import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/Colors.dart';
import 'package:paysense/utils/Images.dart';
import 'package:paysense/views/LoginScreen.dart';
import 'package:paysense/views/SignupScreen.dart';
import 'package:paysense/views/UiTemplate.dart';
import 'package:paysense/widgets/Button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
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
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: SvgPicture.asset(
                    DummyImg.splashLogo,
                    semanticsLabel:
                        'Splash Logo', // Optional: For accessibility
                    placeholderBuilder: (BuildContext context) =>
                        CircularProgressIndicator(), // Optional: Placeholder while loading
                    fit: BoxFit
                        .contain, // Optional: Adjust how the image fits within its box
                  ),
                ),
                Center(
                  child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        "Let's Start",
                        style: GoogleFonts.poppins(
                          fontSize: 40,
                          color: isDarkMode
                              ? ColorUtil.blackcolor
                              : ColorUtil.whitecolor,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      )),
                ),
                Center(
                  child: Text(
                    'Create your account if your are not regisered\n\t\tor if your are registered then simply login.',
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: isDarkMode
                          ? ColorUtil.blackcolor
                          : ColorUtil.whitecolor,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DummyButton(
                title: "Register",
                clr: ColorUtil.bgblue,
                textClr: ColorUtil.whitecolor,
                onPress: () {
                  Get.off(() => SignupScreen());
                }),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DummyButton(
                title: "Login",
                clr: ColorUtil.whitecolor,
                textClr: ColorUtil.blackcolor,
                onPress: () {
                  Get.off(() => LoginScreen());
                }),
          ),
          SizedBox(
            height: 26,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
