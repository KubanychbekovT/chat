import 'package:flashy_flushbar/flashy_flushbar.dart';
import 'package:flutter/material.dart';

abstract class ToastUtil {
  static void showErrorMessage(String message) {
    FlashyFlushbar(
      message: message,
      leadingWidget: const Icon(
        Icons.error,
        color: Colors.red,
      ),
      duration: const Duration(seconds: 4),
      backgroundColor: Colors.white,
    ).show();
  }
}
