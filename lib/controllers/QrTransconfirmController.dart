import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysense/controllers/QrTransactionController.dart';
import 'package:paysense/controllers/UserController.dart';
import 'package:paysense/res/routes/RouteNames.dart';
import 'package:paysense/views/QrTranscriptScreen.dart';

class QrTransConfirmController extends GetxController {
  TextEditingController textControl = TextEditingController();
  final TextEditingController fieldOne = TextEditingController();
  final TextEditingController fieldTwo = TextEditingController();
  final TextEditingController fieldThree = TextEditingController();
  final TextEditingController fieldFour = TextEditingController();
  var userData = Get.find<UserController>().userData;
  final transactionController = Get.put(QrTransactionController());

  String? otp;
  RxString inputText = ''.obs;
  RxBool showError = false.obs;

  void onTextChanged(newText) {
    inputText.value = newText;
    showError.value = false; // Reset error state
  }

  void verifyPin() {
    // Check if userData is populated before proceeding
    if (userData.isNotEmpty) {
      log("User Data: ${userData['pin']}");
      log("Entered PIN: ${textControl.text}");

      // Verify the PIN
      if (textControl.text == userData['pin']) {
        log("Pin verification successful.");
        transactionController.transaction(); // Call the transaction function
        Get.to(()=>QrTransScriptScreen()); // Navigate to the transaction script screen
      } else {
        log("Pin verification failed.");
        Get.snackbar("Error", "Pin is incorrect"); // Show error message
      }
    } else {
      log("UserData is empty or not loaded. Cannot verify PIN.");
      Get.snackbar("Error", "User data not available for PIN verification");
    }
  }
}
