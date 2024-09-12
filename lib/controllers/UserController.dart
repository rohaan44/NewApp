import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paysense/controllers/LoginController.dart';
import 'dart:developer';
import 'package:paysense/views/QrSendAmountScreen.dart';

class UserController extends GetxController {
  var userData = {}.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  var qrUserData = {}.obs;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
  }

  void onQRCodeScanned(BuildContext context, String accountNumber) async {
    try {
      isLoading(true);
      DocumentSnapshot userDoc = await firestore
          .collection('users')
          .doc(accountNumber)
          .get();

      if (userDoc.exists) {
        qrUserData.value = userDoc.data() as Map<String, dynamic>;
        Get.to(()=>QRSendAmountScreen());
      } else {
        log("No user found with this account number.");
        errorMessage.value = "No user found with this account number.";
      }
    } catch (e) {
      log("Error fetching user data: $e");
      errorMessage.value = "Error fetching user data.";
    } finally {
      // Stop loading indicator
      isLoading(false);
    }
  }
  Future<void> fetchUserData() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      final Logincontroller loginController = Get.find<Logincontroller>();
      String email = loginController.emailController.text.trim();
      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('email', isEqualTo: email)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        userData.value =
            querySnapshot.docs.first.data() as Map<String, dynamic>;
        log('User data fetched: ${userData.value}');
      } else {
        errorMessage.value = 'No user found for this email';
        log('No user found for this email');
      }
    } catch (e) {
      errorMessage.value = 'Failed to fetch user data: $e';
      log('Failed to fetch user data: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
