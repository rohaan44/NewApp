import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysense/views/DashboardScreen.dart';
import 'package:paysense/views/HomeScreen.dart';


class BottomBarController extends GetxController {
  var currentTab = 0.obs;
  final List<Widget> screens = [
    DashboardScreen(),
    HomeScreen(),
    //CardView(),
    //AccType(),
    //const CustomerSupport()
  ];

  Widget get currentScreen => screens[currentTab.value];
  
  void changeTab(int index) {
    currentTab.value = index;
  }
}
