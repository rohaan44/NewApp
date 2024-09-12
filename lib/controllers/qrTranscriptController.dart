import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
// import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:paysense/controllers/EnteraccController.dart';
import 'dart:ui' as ui;

import 'package:paysense/controllers/UserController.dart';

// Make sure this import is correct for your view

class QrTranscriptController extends GetxController {
  final GlobalKey globalKey = GlobalKey();
  var loading = false.obs;
  final recieverNumber = Get.find<UserController>().qrUserData;
  var formattedDate;

  // void verifyAccountNumber() async {
  //   loading.value = true;
  //   Map<String, dynamic>? userData = await recieverNumber.verifyPhoneNumber();
  //   loading.value = false;
  //   if (userData != null) {
  //     Get.to(() => TransScriptScreen());
  //   } else {
  //     Get.snackbar("Error", "Account Number is invalid");
  //   }
  // }

  Future<void> captureAndSavePng() async {
    try {
      RenderRepaintBoundary? boundary = globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary?;
      if (boundary == null) {
        Get.snackbar(
          'Error',
          'Failed to capture image: Boundary is null',
          duration: Duration(seconds: 2),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      // Ensure the widget has been fully rendered
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        // Capture image with a moderate pixel ratio
        ui.Image image = await boundary.toImage(pixelRatio: 1.0);
        ByteData? byteData =
            await image.toByteData(format: ui.ImageByteFormat.png);
        if (byteData != null) {
          // Save image to gallery
          final result =
              // await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
          // print(result);

          Get.snackbar(
            'Success',
            'Image saved to gallery successfully',
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
        } else {
          Get.snackbar(
            'Error',
            'Failed to capture image: ByteData is null',
            duration: Duration(seconds: 2),
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      });
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error',
        'Failed to save image: $e',
        duration: Duration(seconds: 2),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<Uint8List> _imageToByteData(ui.Image image) async {
    ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
    if (byteData != null) {
      return byteData.buffer.asUint8List();
    }
    throw Exception("Failed to convert image to ByteData");
  }

  String maskPhoneNumber(String phoneNumber) {
    if (phoneNumber.length <= 4) {
      return phoneNumber; // Return as is if the number is too short to mask
    }
    // Replace all but the last 4 digits with '*'
    return '*' * (phoneNumber.length - 4) +
        phoneNumber.substring(phoneNumber.length - 4);
  }

  void dateTime() {
    DateTime now = DateTime.now();
    formattedDate = DateFormat('hh:mma MM/dd/yyyy').format(now);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    dateTime();
  }
}
