import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/BottombarController.dart';
import 'package:paysense/controllers/QrController.dart';
import 'package:paysense/controllers/UserController.dart';
import 'package:paysense/utils/Colors.dart';
import 'package:paysense/utils/Images.dart';
import 'package:paysense/views/UiTemplate.dart';
import 'package:paysense/widgets/Strings.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QrController controller = Get.put(QrController());
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final UserController userController = Get.find<UserController>();
    return Scaffold(
      body: Stack(
        children: [
          const Uitemplate(),
          const Positioned(
              bottom: 0,
              right: -100,
              child: SizedBox(height: 150, child: Uitemplate())),
          Column(children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 35, vertical: 45.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/DrawerView');
                    },
                    child: SvgPicture.asset(
                      DummyImg.icon,
                      color: isDarkMode
                          ? ColorUtil.blackcolor
                          : ColorUtil.whitecolor,
                      width: 32,
                      height: 32,
                    ),
                  ),
                  // Text(
                  //   'Pay Sense',
                  //   style: GoogleFonts.poppins(
                  //     fontSize: 23,
                  //     fontWeight: FontWeight.w500,
                  //     color: isDarkMode
                  //         ? ColorUtil.blackcolor
                  //         : ColorUtil.whitecolor,
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed('/NotiView');
                    },
                    child: Icon(
                      Icons.notifications_none_outlined,
                      size: 35,
                      color: isDarkMode
                          ? ColorUtil.blackcolor
                          : ColorUtil.whitecolor,
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: [
                // Positioned(child: ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 55),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.46,
                      width: MediaQuery.of(context).size.width * 1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: const Color.fromARGB(71, 81, 81, 85),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(151, 33, 149, 243),
                              spreadRadius: 8,
                              blurRadius: 10,
                            )
                          ]),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff232227),
                            borderRadius: BorderRadius.circular(22)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Obx(() {
                              if (userController.isLoading.value) {
                                return const Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.blue,
                                  ),
                                );
                              } else if (userController
                                  .errorMessage.isNotEmpty) {
                                log('Error: ${userController.errorMessage.value}');
                                return Center(
                                  child:
                                      Text(userController.errorMessage.value),
                                );
                              } else {
                                var userData = userController.userData.value;
                                log(userData['phoneNumber']);
                                return QrImageView(
                                  data: userData[
                                      'phoneNumber'], // Embed account number here
                                  version: QrVersions.auto,
                                  size: Get.width * 0.5,
                                  foregroundColor: ColorUtil.whitecolor,
                                  // embeddedImage: const AssetImage(
                                  //     "assets/images/qrcodescan.png"),
                                  // embeddedImageStyle:
                                  //     const QrEmbeddedImageStyle(
                                  //         size: Size(280, 280)),
                                );
                              }
                            }),
                            Obx(() {
                              var userData = userController.userData.value;
                              var str = userData['fullName'];
                              var string = CapitalizeString();
                              return Text("@" + string.capitalizeString(str),
                                  style: GoogleFonts.poppins(
                                      fontSize: Get.width * 0.06,
                                      color: ColorUtil.whitecolor,
                                      fontWeight: FontWeight.w500));
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                FractionalTranslation(
                  translation: const Offset(0.0, -0.6),
                  child: Align(
                    alignment: const FractionalOffset(0.5, 0.0),
                    child: CircleAvatar(
                      radius: 35.0,
                      backgroundImage: AssetImage(DummyImg.dp),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
          ])
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              width: MediaQuery.of(context).size.width - 70,
              height: MediaQuery.of(context).size.height * 0.08,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Color(0xff55a3fe), spreadRadius: 1, blurRadius: 15)
                ],
                color: const Color(0xff55a3fe),
                borderRadius: BorderRadius.circular(15),
              ),
              child: MaterialButton(
                onPressed: () {},
                elevation: 5,
                child: Center(
                  child: Text(
                    "Scan QR",
                    style: GoogleFonts.poppins(
                        fontSize: 22,
                        fontWeight: FontWeight.w400,
                        color: Colors.white),
                  ),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 70,
            height: MediaQuery.of(context).size.height * 0.08,
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(15),
            ),
            child: MaterialButton(
              onPressed: () {},
              elevation: 5,
              child: Center(
                child: Text(
                  "Share your QR",
                  style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
