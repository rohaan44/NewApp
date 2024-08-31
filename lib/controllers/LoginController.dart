import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paysense/controllers/UserController.dart';
import 'package:paysense/views/DashboardScreen.dart';

class Logincontroller extends GetxController {
  var emailController = TextEditingController();
  var pinController = TextEditingController();
  var isLoading = false.obs;
  var ispasswordHidden = true.obs;
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode pinFocusNode = FocusNode();
  final ScrollController scrollController = ScrollController();
  var userData = {}.obs;

  @override
  void onInit() {
    super.onInit();

    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus) {
        Timer(const Duration(milliseconds: 300), () {
          scrollController.position.physics;
        });
      }
    });

    pinFocusNode.addListener(() {
      if (pinFocusNode.hasFocus) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

    Future<void> login() async {
    final String email = emailController.text;
    final String pin = pinController.text;
    final String adjustedPin = pin.padRight(6, '0');

    if (email.isEmpty || pin.isEmpty) {
      Get.snackbar("Error", "Email and PIN cannot be empty");
      return;
    }

    isLoading.value = true;

    try {
      // Sign in with Firebase
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: adjustedPin,
      );

      // Initialize the UserController and fetch user data
      Get.put(UserController()).fetchUserData();

      Get.snackbar("Congratulations", "User Logged In Successfully");
      Get.to(() => const DashboardScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Error", "No user found for that email.");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Error", "Wrong password provided.");
      } else {
        Get.snackbar("Error", e.message ?? "An error occurred.");
      }
    } catch (error) {
      Get.snackbar("Error", "An unexpected error occurred: ${error.toString()}");
    } finally {
      isLoading.value = false;
    }
  }

}
