

import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paysense/controllers/LoginController.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

class UserController extends GetxController {
  var userData = {}.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  final Logincontroller controller = Get.find<Logincontroller>();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    
    fetchUserData();
    super.onInit();
  }

  Future <void> fetchUserData() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      SharedPreferences prefs = await SharedPreferences.getInstance();
      String email = prefs.getString('email') ?? '';

      QuerySnapshot querySnapshot = await firestore
          .collection('users')
          .where('email', isEqualTo: controller.emailController.text.toString())
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        userData.value = querySnapshot.docs.first.data() as Map<String, dynamic>;
        log('User data fetched: ${userData.value}');
      } else {
        errorMessage.value = 'No user found for phone number: $email';
        log('No user found for phone number: $email');
      }
    } catch (e) {
      errorMessage.value = 'Failed to fetch user data: $e';
      log('Failed to fetch user data: $e');
    } finally {
      isLoading.value = false;
    }
  }

}
