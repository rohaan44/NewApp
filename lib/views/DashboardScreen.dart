import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/UserController.dart';
import 'package:paysense/utils/Colors.dart';
import 'package:paysense/utils/Images.dart';
import 'package:paysense/views/TabbarView.dart';
import 'package:paysense/views/UiTemplate.dart';
import 'package:paysense/widgets/RoundButton.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final UserController userController = Get.put(UserController());
    Future<void> _refreshScreen() async {}
    return GetBuilder<UserController>(builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: RefreshIndicator(
              onRefresh: _refreshScreen,
              child: Stack(
                children: [
                  const Uitemplate(),
                  const Positioned(
                      bottom: 0,
                      right: -100,
                      child: SizedBox(height: 150, child: Uitemplate())),
                  ListView(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 35, vertical: 45.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/DrawerView');
                                  },
                                  child: SvgPicture.asset(
                                    isDarkMode
                                        ? DummyImg.icon
                                        : DummyImg.liteDrawer,
                                    width: 32,
                                    height: 32,
                                  ),
                                ),
                                Text(
                                  'Pay Sense',
                                  style: GoogleFonts.poppins(
                                    fontSize: 30,
                                    color: isDarkMode
                                        ? ColorUtil.blackcolor
                                        : ColorUtil.whitecolor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/NotiView');
                                  },
                                  child: Icon(
                                    color: isDarkMode
                                        ? ColorUtil.blackcolor
                                        : ColorUtil.whitecolor,
                                    Icons.notifications_none_outlined,
                                    size: 35,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: Obx(() {
                              if (userController.isLoading.value) {
                                return Center(
                                    child: CircularProgressIndicator());
                              } else if (userController
                                  .errorMessage.isNotEmpty) {
                                log('Error: ${userController.errorMessage.value}');
                                return Center(
                                  child:
                                      Text(userController.errorMessage.value),
                                );
                              } else {
                                var userData = controller.userData.value;
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Rs. ${userData['amount']}",
                                      style: GoogleFonts.inter(
                                        fontSize: 30,
                                        height: 1.15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      'Wallet Id : ${userData['phoneNumber']}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                  ],
                                );
                              }
                            }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30, right: 30, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed('/BePayAmntView');
                                  },
                                  child: RoundButton(
                                    iconn: Icons.call_made_outlined,
                                    title: " Send\nMoney",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed("/RequestMoneyView");
                                  },
                                  child: RoundButton(
                                    iconn: Icons.call_received_outlined,
                                    title: "Request\n Money",
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.toNamed("/LoadMoneyView");
                                  },
                                  child: RoundButton(
                                    iconn: Icons.refresh,
                                    title: " Scan\n QR code",
                                  ),
                                ),
                                RoundButton(
                                  iconn: Icons.shopping_bag_outlined,
                                  title: "Shop\nNow",
                                ),
                              ],
                            ),
                          ),
                          const TabBarVieww(),
                        ],
                      )
                    ],
                  )
                ],
              )),
        ),
      );
    });
  }
}
