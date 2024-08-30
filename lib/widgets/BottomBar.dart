import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/Colors.dart';
import 'package:paysense/utils/Images.dart';
import 'package:paysense/views/CardScreen.dart';
import 'package:paysense/views/ChatScreen.dart';
import 'package:paysense/views/DashboardScreen.dart';
import 'package:paysense/views/ShopScreen.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:paysense/controllers/BottomBarController.dart';
// import 'package:paysense/utils/colors.dart';
// import 'package:paysense/utils/images.dart';

// class BottomBar extends StatelessWidget {
//   BottomBar({super.key});

//   final BottomBarController controller = Get.put(BottomBarController());

//   @override
//   Widget build(BuildContext context) {
//     final isDarkMode = Theme.of(context).brightness == Brightness.dark;
//     final isLightMode = Theme.of(context).brightness == Brightness.light;

//     return SafeArea(
//       child: Scaffold(
//         extendBody: true,
//         body: Obx(() {
//           print(controller.currentTab.value); // For debugging
//           return PageStorage(
//               bucket: PageStorageBucket(), child: controller.currentScreen);
//         }),
//         floatingActionButton: FloatingActionButton(
//           shape: const CircleBorder(),
//           backgroundColor: Colors.white,
//           onPressed: () {
//             Get.toNamed("/QrView");
//           },
//           child: SvgPicture.asset(
//             DummyImg.scan,
//             width: 25, // Adjusted size
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         bottomNavigationBar: BottomAppBar(
//           elevation: 0,
//           color: isDarkMode ? const Color(0xff394660) : const Color(0xffebeff9),
//           height: 56, // Adjusted height
//           shape: const CircularNotchedRectangle(),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               buildNavBarItem(
//                   0, DummyImg.home, "Home", isDarkMode, isLightMode),
//               buildNavBarItem(
//                   1, DummyImg.chat, "Chat", isDarkMode, isLightMode),
//               buildNavBarItem(
//                   2, DummyImg.card, "Card", isDarkMode, isLightMode),
//               buildNavBarItem(
//                   3, DummyImg.shop, "Shop", isDarkMode, isLightMode),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   MaterialButton buildNavBarItem(
//       int index, String icon, String label, bool isDarkMode, bool isLightMode) {
//     return MaterialButton(
//       minWidth: 40,
//       onPressed: () {
//         controller.changeTab(index);
//       },
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           SvgPicture.asset(
//             icon,
//             width: 20, // Adjusted size
//             color: getTabColor(
//                 index, controller.currentTab.value, isDarkMode, isLightMode),
//           ),
//           Text(
//             label,
//             style: GoogleFonts.poppins(
//               color: getTabColor(
//                   controller.currentTab.value, index, isDarkMode, isLightMode),
//               fontSize: 12,
//               fontWeight: FontWeight.w300,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Color getTabColor(
//       int check, int currentTab, bool isDarkMode, bool isLightMode) {
//     if (currentTab == check) {
//       return ColorUtil.bgblue;
//     } else {
//       return isDarkMode
//           ? Colors.white
//           : isLightMode
//               ? Colors.black
//               : Colors.black;
//     }
//   }
// }



class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    DashboardScreen(),
    ChatScreen(),
    CardView(),
    ShopScreen(),
  ];

  void onTabTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: Container(
        height: 65,
        margin: const EdgeInsets.only(left: 24, bottom: 24, right: 24),
        decoration: BoxDecoration(
          color: isDarkMode ? ColorUtil.whitecolor : ColorUtil.blackcolor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(color: ColorUtil.bgcolor, spreadRadius: 2, blurRadius: 1),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            IconData icon;
            String title;

            switch (index) {
              case 0:
                icon = Icons.home_outlined;
                title = 'Home';
                break;
              case 1:
                icon = Icons.chat_outlined;
                title = 'Chat';
                break;
              case 2:
                icon = Icons.credit_card_outlined;
                title = 'Card';
                break;
              case 3:
                icon = Icons.shopping_bag_outlined;
                title = 'Shop';
                break;
              default:
                icon = Icons.home_outlined;
                title = 'Home';
            }

            bool isSelected = selectedIndex == index;
            return GestureDetector(
              onTap: () => onTabTapped(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    color: isSelected ? ColorUtil.bgblue : ColorUtil.bordercolor,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        color: isSelected
                            ? ColorUtil.bgblue
                            : ColorUtil.bordercolor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
