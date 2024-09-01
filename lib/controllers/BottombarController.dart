// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:paysense/views/DashboardScreen.dart';
// import 'package:paysense/views/HomeScreen.dart';

// class Bo ttomBarController extends GetxController {
//   final PageController pageController = PageController();

//   RxInt currentTab = 0.obs;
//   // final List<Widget> screens = [
//   //   DashboardScreen(),
//   //   HomeScreen(),
//   //   //CardView(),
//   //   //AccType(),
//   //   //const CustomerSupport()
//   // ];

//   // Widget get currentScreen => screens[currentTab.value];

//   // void changeTab(int index) {
//   //   currentTab.value = index;
//   //   pageController.animateToPage(index,
//   //       duration: Duration(milliseconds: 400), curve: Curves.bounceIn);
//   // }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BarController extends GetxController {
  final PageController pageController = PageController();
  RxInt currentTab = 0.obs;
}
