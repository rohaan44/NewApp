import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/Images.dart';
import 'package:paysense/utils/colors.dart';

class CustomDialog extends StatelessWidget {
  VoidCallback onPressed;
  CustomDialog({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Dialog(
      insetAnimationCurve: Curves.linear,
      insetAnimationDuration: const Duration(seconds: 1),
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: Get.height * 0.22,
        width: Get.width * 0.98,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 30), // To create space for the icon

                  Text('Are you sure?\n Do you really want to Signout..?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Get.width * 0.040,
                          color: ColorUtil.bordercolor,
                        ),
                      )),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            backgroundColor: isDarkMode
                                ? ColorUtil.blackcolor
                                : ColorUtil
                                    .whitecolor, // Button background color
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // Rounded corners
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15), // Padding
                          ),
                          icon: Icon(
                            Icons.close, // Icon for the button
                            color: isDarkMode
                                ? ColorUtil.whitecolor
                                : ColorUtil.blackcolor,
                          ),
                          label: Text('Cancel',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: isDarkMode
                                      ? ColorUtil.whitecolor
                                      : ColorUtil.blackcolor, // Text color
                                  fontSize: 16, // Text size
                                ),
                              )),
                        ),
                      ),
                      Center(
                        child: ElevatedButton.icon(
                          onPressed: onPressed,
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            backgroundColor:
                                ColorUtil.bgcolor, // Button background color
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(10), // Rounded corners
                            ),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15), // Padding
                          ),
                          icon: Icon(
                            Icons.check, // Icon for the button
                            color: ColorUtil.whitecolor,
                          ),
                          label: Text('Yes',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  color: ColorUtil.whitecolor, // Text color
                                  fontSize: 16, // Text size
                                ),
                              )),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
                top: -50,
                child: SvgPicture.asset(
                  DummyImg.confuseEmoji,
                  width: 100,
                )),
          ],
        ),
      ),
    );
  }
}
