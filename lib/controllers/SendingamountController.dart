import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendingAmountController extends GetxController {
   var textEdit = TextEditingController();
  var isButtonEnabled = false.obs;
  var isTextFieldFocused = false.obs;
  var focusNode = FocusNode();
  RxString inputText = ''.obs;
  RxDouble fontSize = 40.0.obs;
  RxBool showError = false.obs;
  void onTextChanged(String newText) {
    inputText.value = newText;
    showError.value = false; // Reset error state
    updateFontSize();

    // Parse the entered text as an integer
    final enteredValue = int.tryParse(newText) ?? 0;

    // Check if entered value is greater than 200,000
    if (enteredValue > 200000) {
      // Limit the value to 200,000
      textEdit.text = '200000';
      Get.snackbar(
        "your limit Rs. 200000 per Transaction",
        "Transaction limit error",
        colorText: Colors.black,
        icon: const Icon(Icons.error),
      );
      showError.value = false; // Display an error
    }
  }

  void updateFontSize() {
    final length = inputText.value.length;
    fontSize.value = 40.0 - (length * 1.0); // Adjust this factor as needed
  }

  @override
  void onInit() {
    super.onInit();
    textEdit.addListener(() {
      isButtonEnabled.value = textEdit.text.isNotEmpty;
    });
  }

  // Handle text changes and button enablement
  void handleTextChange(String newText) {
    textEdit.text = newText;
    isButtonEnabled.value = textEdit.text.isNotEmpty;
  }







  @override
  void dispose() {
    textEdit.dispose();
    focusNode.dispose();
    super.dispose();
  }
}