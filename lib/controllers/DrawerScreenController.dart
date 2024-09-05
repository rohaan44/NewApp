import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysense/utils/Colors.dart';
import 'package:paysense/views/HomeScreen.dart';

class DrawerScreenController extends GetxController {
   var isSwitched = false.obs;

  void changetheme() {
    if (Get.isDarkMode) {
      Get.changeTheme(ThemeData.light());
    } else {
      Get.changeTheme(ThemeData.dark());
    }
  }

  void toggleSwitchTheme(bool value) {
    isSwitched.value = value;
    changetheme();
  }

  signOutUser(BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    try {
      await auth.signOut();
      // ignore: use_build_context_synchronously
      Get.offAll(() => HomeScreen());
      // ignore: use_build_context_synchronously
      Get.snackbar("Congratulations", "SignOut Successfully",
          icon: Icon(
            Icons.check_circle,
            color: ColorUtil.bgblue,
          ),
          colorText: isDarkMode ? ColorUtil.whitecolor : ColorUtil.blackcolor,
          backgroundColor: ColorUtil.bgcolor);
      // Util.snackBar(
      //   "Congratulations",
      //   "SignOut Successfully",
      // );
      if (kDebugMode) {
        print('SignOut Successfully');
      }
    } catch (e) {
      Get.snackbar("Congratulations", "SignOut Successfully",
          icon: Icon(
            Icons.error,
            color: Colors.red,
          ),
          colorText: isDarkMode ? ColorUtil.whitecolor : ColorUtil.blackcolor,
          backgroundColor: ColorUtil.bgcolor);
      if (kDebugMode) {
        print('Error in SignOut: $e');
      }
    }
  }
}
