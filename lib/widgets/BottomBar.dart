import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:paysense/controllers/BottombarController.dart';
import 'package:paysense/utils/Colors.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  final BarController controller = Get.find(); // Use Get.find() to access the existing controller

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      shape: const CircularNotchedRectangle(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buildNavBarItem(0, Icons.home, "Home", isDarkMode, isLightMode),
          buildNavBarItem(1, Icons.chat, "Chat", isDarkMode, isLightMode),
          buildNavBarItem(2, Icons.credit_card, "Card", isDarkMode, isLightMode),
          buildNavBarItem(3, Icons.qr_code, "Scan Qr", isDarkMode, isLightMode),
          buildNavBarItem(4, Icons.shop, "Shop", isDarkMode, isLightMode),
        ],
      ),
    );
  }

  MaterialButton buildNavBarItem(int index, IconData icon, String label,
      bool isDarkMode, bool isLightMode) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        controller.currentTab.value = index; // Update the tab index
      },
      child: Obx(() => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30,
                color: getTabColor(index, controller.currentTab.value,
                    isDarkMode, isLightMode),
              ),
              Text(
                label,
                style: GoogleFonts.poppins(
                  color: getTabColor(controller.currentTab.value, index,
                      isDarkMode, isLightMode),
                  fontSize: Get.width * 0.035,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          )),
    );
  }

  Color getTabColor(
      int index, int currentTab, bool isDarkMode, bool isLightMode) {
    return currentTab == index
        ? const Color(0xff67ADFF)
        : isDarkMode
            ? ColorUtil.whitecolor
            : isLightMode
                ? ColorUtil.blackcolor
                : Colors.black;
  }
}
