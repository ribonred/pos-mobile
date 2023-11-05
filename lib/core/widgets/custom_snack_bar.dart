import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackBar {
  CustomSnackBar.show(String message) {
    Get.snackbar("", message, snackPosition: SnackPosition.BOTTOM);
  }

  CustomSnackBar.showError(
      {String message = 'Something went wrong, please try again later'}) {
    Get.snackbar("", message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white);
  }
}
