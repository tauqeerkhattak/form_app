import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UiUtils {
  static void showSnackbar({
    required String message,
    Color? color,
  }) {
    Get.rawSnackbar(
      message: message,
      backgroundColor: color ?? Colors.black,
    );
  }
}
