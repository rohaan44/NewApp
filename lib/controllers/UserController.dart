import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:paysense/controllers/LoginController.dart';
import 'dart:developer';

class UserController extends GetxController {
  var userData = {}.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;
  
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
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
        userData.value = querySnapshot.docs.first.data() as Map<String, dynamic>;
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
