import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paysense/utils/Colors.dart';
import 'package:paysense/views/CardScreen.dart';
import 'package:paysense/views/ChatScreen.dart';
import 'package:paysense/views/DashboardScreen.dart';
import 'package:paysense/views/QrScreen.dart';
import 'package:paysense/views/ShopScreen.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Persistent extends StatefulWidget {
  const Persistent({super.key});

  @override
  State<Persistent> createState() => _PersistentState();
}

class _PersistentState extends State<Persistent> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      DashboardScreen(),
      const ChatScreen(),
      const CardView(),
      const QrScreen(),
      const ShopScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(Icons.home_filled),
        title: ("Dashboard"),
        textStyle:
            GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w500),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.chat),
        textStyle:
            GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w500),
        title: ("Chat"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.credit_card),
        textStyle:
            GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w500),
        title: ("Card"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.qr_code),
        textStyle:
            GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w500),
        title: ("QR"),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.shopping_bag_rounded),
        title: ("Shop"),
        textStyle:
            GoogleFonts.poppins(fontSize: 11, fontWeight: FontWeight.w500),
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineToSafeArea: true,
      backgroundColor: isDarkMode
          ? ColorUtil.blackcolor
          : ColorUtil
              .whitecolor, // Change this to your desired background color
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      navBarHeight: 70, // Change this to your desired height
    );
  }
}
