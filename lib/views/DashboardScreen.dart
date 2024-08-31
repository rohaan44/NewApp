import 'dart:developer';
import 'package:paysense/res/routes/RouteNames.dart';
import 'package:paysense/widgets/BottomBar.dart';
import 'package:shimmer/shimmer.dart';
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
    Future<void> refreshScreen() async {
      userController.fetchUserData();
    }

    return GetBuilder<UserController>(builder: (controller) {
      return Scaffold(
        body: RefreshIndicator(
            color: ColorUtil.bgblue,
            onRefresh: refreshScreen,
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
                              horizontal: 30, vertical: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.to(());
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
                              // Shimmer effect when loading
                              return Shimmer.fromColors(
                                baseColor: const Color(0xff9f9f9f)!,
                                highlightColor: const Color(0xffF1F1F1)!,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 200.0,
                                      height: 60.0,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: 6),
                                    Container(
                                      width: 150.0,
                                      height: 20.0,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: 6),
                                    Container(
                                      width: 100.0,
                                      height: 20.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              );
                            } else if (userController.errorMessage.isNotEmpty) {
                              log('Error: ${userController.errorMessage.value}');
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    userController.errorMessage.value,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontSize: 15,
                                        color: isDarkMode
                                            ? ColorUtil.blackcolor
                                            : ColorUtil.whitecolor,
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              var userData = controller.userData.value;
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Rs. ${userData['amount']}",
                                    style: GoogleFonts.inter(
                                      color: isDarkMode
                                          ? ColorUtil.blackcolor
                                          : ColorUtil.whitecolor,
                                      fontSize: 50,
                                      height: 1.3,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Text(
                                    'Wallet Id : ${userData['phoneNumber']}',
                                    style: GoogleFonts.poppins(
                                      color: isDarkMode
                                          ? ColorUtil.blackcolor
                                          : ColorUtil.whitecolor,
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
                        const SizedBox(
                          height: 15,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 35),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    RouteName.sendAmountScreen,
                                  );
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
                                  title: " Load\nMoney",
                                ),
                              ),
                              RoundButton(
                                iconn: Icons.shopping_bag_outlined,
                                title: "Shop\nNow",
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TabBarVieww(),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    )
                  ],
                )
              ],
            )),
      );
    });
  }
}
