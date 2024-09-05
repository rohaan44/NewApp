import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paysense/controllers/DrawerScreenController.dart';
import 'package:paysense/utils/Images.dart';
import 'package:paysense/views/UiTemplate.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final DrawerScreenController drawerController =
        Get.put(DrawerScreenController());
    return SafeArea(
        child: Scaffold(
            body: Stack(children: [
      const Uitemplate(),
      Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 45.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: SvgPicture.asset(
                  DummyImg.chevleft,
                  width: 35,
                  color: isDarkMode ? Colors.white : Colors.black87,
                ),
              ),
              Obx(() {
                return GestureDetector(
                  onTap: () {
                    drawerController
                        .toggleSwitchTheme(!drawerController.isSwitched.value);
                  },
                  child: Container(
                    width: 70,
                    height: 35,
                    decoration: BoxDecoration(
                      color: drawerController.isSwitched.value
                          ? Color(0xFF333333)
                          : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          offset: Offset(5, 5),
                          blurRadius: 15,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-5, -5),
                          blurRadius: 15,
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          left: 10,
                          child: Icon(
                            Icons.sunny, // Replacing sun with settings icon
                            color: drawerController.isSwitched.value
                                ? Colors.white
                                : Colors.white,
                          ),
                        ),
                        Positioned(
                          right: 10,
                          child: Icon(
                            Icons.nightlight_round,
                            color: drawerController.isSwitched.value
                                ? Colors.white
                                : Color(0xFF333333),
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 300),
                          left: drawerController.isSwitched.value ? 35 : 0,
                          child: Container(
                            width: 35,
                            height: 35,
                            decoration: BoxDecoration(
                              color: drawerController.isSwitched.value
                                  ? Colors.white
                                  : Color(0xFF333333),
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  offset: Offset(5, 5),
                                  blurRadius: 15,
                                ),
                                BoxShadow(
                                  color: Colors.white,
                                  offset: Offset(-5, -5),
                                  blurRadius: 15,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                drawerController.isSwitched.value
                                    ? Icons.nightlight_round
                                    : Icons.sunny,
                                color: drawerController.isSwitched.value
                                    ? Color(0xff3333333)
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ),
      ])
    ])));
  }
}
