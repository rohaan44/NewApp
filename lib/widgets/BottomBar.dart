import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/Colors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:paysense/controllers/BottomBarController.dart';
import 'package:paysense/utils/colors.dart';
import 'package:paysense/utils/images.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  final BottomBarController controller = Get.put(BottomBarController());

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: Obx(() {
          print(controller.currentTab.value); // For debugging
          return PageStorage(
              bucket: PageStorageBucket(), child: controller.currentScreen);
        }),
        floatingActionButton: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.white,
          onPressed: () {
            Get.toNamed("/QrView");
          },
          child: SvgPicture.asset(
            DummyImg.scan,
            width: 25, // Adjusted size
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          color: isDarkMode ? const Color(0xff394660) : const Color(0xffebeff9),
          height: 56, // Adjusted height
          shape: const CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildNavBarItem(
                  0, DummyImg.home, "Home", isDarkMode, isLightMode),
              buildNavBarItem(
                  1, DummyImg.chat, "Chat", isDarkMode, isLightMode),
              buildNavBarItem(
                  2, DummyImg.card, "Card", isDarkMode, isLightMode),
              buildNavBarItem(
                  3, DummyImg.shop, "Shop", isDarkMode, isLightMode),
            ],
          ),
        ),
      ),
    );
  }

  MaterialButton buildNavBarItem(
      int index, String icon, String label, bool isDarkMode, bool isLightMode) {
    return MaterialButton(
      minWidth: 40,
      onPressed: () {
        controller.changeTab(index);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            width: 20, // Adjusted size
            color: getTabColor(
                index, controller.currentTab.value, isDarkMode, isLightMode),
          ),
          Text(
            label,
            style: GoogleFonts.poppins(
              color: getTabColor(
                  controller.currentTab.value, index, isDarkMode, isLightMode),
              fontSize: 12,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }

  Color getTabColor(
      int check, int currentTab, bool isDarkMode, bool isLightMode) {
    if (currentTab == check) {
      return Colors.blue;
    } else {
      return isDarkMode
          ? Colors.white
          : isLightMode
              ? Colors.black
              : Colors.black;
    }
  }
}

// class BottomBar extends StatefulWidget {
//   const BottomBar({super.key});

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// }

// class _BottomBarState extends State<BottomBar> {
//   int selectedIndex = 0;

//   final List<Widget> screens = [
//     Center(child: Text('DashboardScreen')),
//     Center(child: Text('ChatScreen')),
//     Center(child: Text('CardView')),
//     Center(child: Text('ShopScreen')),
//   ];

//   void onTabTapped(int index) {
//     setState(() {
//       selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: screens[selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: selectedIndex,
//         onTap: onTabTapped,
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
//           BottomNavigationBarItem(icon: Icon(Icons.credit_card), label: 'Card'),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.shopping_bag), label: 'Shop'),
//         ],
//       ),
//     );
//   }
// }
