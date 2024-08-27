import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:paysense/views/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignupController extends GetxController {
  final RxBool isLoading = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController pinController = TextEditingController();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode pinFocusNode = FocusNode();
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode phoneNumberFocusNode = FocusNode();
  final ScrollController scrollController = ScrollController();
  var isHiddenPassword = true.obs;

 void onInit() {
    super.onInit();

    emailFocusNode.addListener(() {
      if (emailFocusNode.hasFocus) {
        Timer(Duration(milliseconds: 300), () {
          scrollController.position.physics;
        });
      }
    });

fullNameFocusNode.addListener(() {
      if (fullNameFocusNode.hasFocus) {
        Timer(Duration(milliseconds: 300), () {
          scrollController.position.physics;
        });
      }
    });
    phoneNumberFocusNode.addListener(() {
      if (phoneNumberFocusNode.hasFocus) {
        Timer(Duration(milliseconds: 300), () {
          scrollController.position.physics;
        });
      }
    });
    pinFocusNode.addListener(() {
      if (pinFocusNode.hasFocus) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  Future<void> register() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    final String email = emailController.text.trim();
    final String fullName = fullNameController.text.trim();
    final String phoneNumber = phoneNumberController.text.trim();
    final String pin = pinController.text.trim();
    // Ensure the pin is at least 6 characters long
    final String adjustedPin = pin.padRight(6, '0');
    const int amount = 5000;
    var formatter = NumberFormat('#,###');
    String formattedNumber = formatter.format(amount);
    try {
      isLoading.value = true;

      // Check if the email is already registered in Firebase Authentication
      final List<String> signInMethods = await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);
      if (signInMethods.isNotEmpty) {
        Get.snackbar(
          'Error',
          'The email is already taken. Please choose another one.',
          snackPosition: SnackPosition.BOTTOM,
        );
        isLoading.value = false;
        return;
      }

      // Check if the phone number is already taken in Firestore
      final QuerySnapshot phoneResult = await FirebaseFirestore.instance
          .collection('users')
          .where('phoneNumber', isEqualTo: phoneNumber)
          .get();

      if (phoneResult.docs.isNotEmpty) {
        Get.snackbar(
          'Error',
          'The phone number is already taken. Please choose another one.',
          snackPosition: SnackPosition.TOP,
        );
        isLoading.value = false;
        return;
      }

      // Create user with email and password
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: adjustedPin,
      );

      // Save user data in Firestore
      await FirebaseFirestore.instance.collection('users').doc(phoneNumber).set({
        'email': email,
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'pin': pin,
        'amount': formattedNumber,
      });
      log('Data saved in Firestore successfully');

      // Save user data locally
      await saveUserDataLocally(email, fullName, phoneNumber, pin, formattedNumber);

      Get.snackbar(
        'Success',
        'Registration successful',
        snackPosition: SnackPosition.TOP,
      );
      Get.to(LoginScreen());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar(
          'Error',
          'The password provided is too weak.',
          snackPosition: SnackPosition.TOP,
        );
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar(
          'Error',
          'The account already exists for that email.',
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar(
        'Error',
        'Error: Something went wrong',
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveUserDataLocally(
    String email,
    String fullName,
    String phoneNumber,
    String pin,
    String formattedNumber,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String existingEmail = prefs.getString('email') ?? '';
    if (existingEmail.isNotEmpty && existingEmail == email) {
      Get.snackbar(
        'Error',
        'User with the same email is already registered locally.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      await prefs.setString('email', email);
      await prefs.setString('fullName', fullName);
      await prefs.setString('phoneNumber', phoneNumber);
      await prefs.setString('pin', pin);
      await prefs.setString('amount', formattedNumber);
      log('User data saved locally.');

      // Verify saved data
      log('Saved Email: ${prefs.getString('email')}');
      log('Saved FullName: ${prefs.getString('fullName')}');
      log('Saved PhoneNumber: ${prefs.getString('phoneNumber')}');
      log('Saved Pin: ${prefs.getString('pin')}');
      log('Saved Amount: ${prefs.getString('amount')}');
    }
  }
}
