import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/Images.dart';
import 'package:paysense/views/UiTemplate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SvgPicture.asset(
                  DummyImg.splashLogo,
                  semanticsLabel: 'Splash Logo', // Optional: For accessibility
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
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    )),
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      'Create your account if your are not regisered\n\t\tor if your are registered then simply login.',
                      style: GoogleFonts.poppins(
                        fontSize: 25,
                        fontWeight: FontWeight.w400,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
    ));
  }
}
