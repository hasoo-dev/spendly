import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class UiUtils {
  static void showFlushbar(BuildContext context, String message, {bool isError = true}) {
    Flushbar(
      message: message,
      icon: Icon(
        isError ? Icons.error_outline : Icons.check_circle_outline,
        size: 28.0,
        color: isError ? Colors.redAccent : Colors.greenAccent,
      ),
      duration: const Duration(seconds: 3),
      leftBarIndicatorColor: isError ? Colors.redAccent : Colors.greenAccent,
      margin: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(15),
      backgroundColor: Colors.black87,
      flushbarPosition: FlushbarPosition.TOP, // Premium apps usually show it at the top
      animationDuration: const Duration(milliseconds: 500),
    ).show(context);
  }
}