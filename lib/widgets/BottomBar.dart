import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/controllers/BottombarController.dart';
import 'package:get/get.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  final BarController controller = Get.put(BarController());

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final isLightMode = Theme.of(context).brightness == Brightness.light;

    return BottomAppBar(
      elevation: 0,
      color: Colors.transparent,
      // height: 56, // Adjusted height
      shape: const CircularNotchedRectangle(),
      child: Row(
        children: [
          buildNavBarItem(0, Icons.home, "Home", isDarkMode, isLightMode),
          buildNavBarItem(1, Icons.chat, "Chat", isDarkMode, isLightMode),
          buildNavBarItem(
              2, Icons.credit_card, "Card", isDarkMode, isLightMode),
          buildNavBarItem(3, Icons.qr_code, "Scan Qr", isDarkMode, isLightMode),
          buildNavBarItem(4, Icons.shop, "Shop", isDarkMode, isLightMode),
        ],
      ),
    );
    //   ),
    // );
  }

  MaterialButton buildNavBarItem(int index, IconData icon, String label,
      bool isDarkMode, bool isLightMode) {
    return MaterialButton(
        minWidth: 40,
        onPressed: () {
          controller.pageController.animateToPage(index,
              duration: Duration(milliseconds: 400), curve: Curves.bounceIn);
        },
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 30, // Adjusted size
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
          ),
        ));
  }

  Color getTabColor(
      int check, int currentTab, bool isDarkMode, bool isLightMode) {
    if (currentTab == check) {
      return const Color(0xff67ADFF);
    } else {
      return isDarkMode
          ? Color(0xff141a16) 
          : isLightMode
              ? Color(0xffFDFDFD)
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
