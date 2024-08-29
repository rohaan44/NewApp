import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysense/controllers/LoginController.dart';
import 'package:paysense/controllers/SendingamountController.dart';
import 'package:paysense/utils/Colors.dart';
import 'package:paysense/views/AfterpaymentScreen.dart';
import 'package:paysense/widgets/Customkeyboard.dart';

class EnterAccController extends GetxController {
  TextEditingController textacc = TextEditingController();
  final SendingAmountController bePayAmntView =
      Get.put(SendingAmountController());
  final Logincontroller loginController = Get.put(Logincontroller());
  final RxBool loading = false.obs;
  var verificationMessage = ''.obs;
  var userData = {}.obs;

  RxString inputText = ''.obs;
  RxBool showError = false.obs;

  void onTextChanged(newText) {
    inputText.value = newText;
    showError.value = false; // Reset error state
  }

  bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  Color getBackgroundColor(BuildContext context) {
    return isDarkMode(context) ? ColorUtil.whitecolor : ColorUtil.bgblue;
  }

  void openModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      barrierColor: Colors.transparent,
      backgroundColor: getBackgroundColor(context),
      context: context,
      shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(20))),
      builder: (BuildContext context) {
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: CustomKeyboard(
              height: 1.5,
              onKeyPressed: (value) {
                if (value == '⌫') {
                  if (textacc.text.isNotEmpty) {
                    textacc.text =
                        textacc.text.substring(0, textacc.text.length - 1);
                  }
                } else {
                  textacc.text += value;
                }
                onTextChanged(textacc.text);
              },
            ),
          ),
        );
      },
    );
  }

  Future<Map<String, dynamic>?> verifyPhoneNumber() async {
    String phoneNumber = textacc.text.trim();
    try {
      // Reference to the Firestore collection where user data is stored
      CollectionReference users =
          FirebaseFirestore.instance.collection('users');

      // Query to check if the phone number exists
      QuerySnapshot querySnapshot =
          await users.where('phoneNumber', isEqualTo: phoneNumber).get();

      // If the query result is not empty, the phone number exists
      if (querySnapshot.docs.isNotEmpty) {
        // Return the first user's data (assuming phoneNumber is unique)
        return querySnapshot.docs.first.data() as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      log('Error verifying phone number: $e');
      return null;
    }
  }

  void verifyAccountNumber() async {
    loading.value = true;
    Map<String, dynamic>? data = await verifyPhoneNumber();
    loading.value = false;
    if (data != null) {
      userData.value = data; // Assign the data to userData
      Get.to(() => AfterPaymentScreen(userData: userData));
    } else {
      Get.snackbar("Error", "Account Number is invalid");
    }
  }
}
