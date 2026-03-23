import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:saypay/core/routes/routes_constant.dart';
import '../../core/utils/ui_utils/ui_utils.dart';
import '../session_controller/session_controller.dart';

class AuthService extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final fullNameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // Reactive loading state for the whole screen
  final RxBool isLoading = false.obs;

  final SessionController _session = SessionController();

  /// --- Professional Login ---
  Future<void> login(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading.value = true; // This will trigger the full-screen overlay

      // Simulate API call (Replace with your actual http.post)
      await Future.delayed(const Duration(seconds: 2));

      // 1. Success Logic (Removed hardcoded test check)
      await _session.saveUserInPreference({
        "email": emailController.text.trim(),
        "token": "api_generated_token_example",
      });

      if (context.mounted) {
        UiUtils.showFlushbar(context, "Login Successful", isError: false);
        Get.offAllNamed(RoutesConstant.main);
      }
    } catch (e) {
      if (context.mounted) {
        UiUtils.showFlushbar(context, "Login Failed: ${e.toString()}");
      }
    } finally {
      isLoading.value = false; // Hide overlay
    }
  }

  /// --- Professional Registration ---
  Future<void> register(BuildContext context) async {
    if (!formKey.currentState!.validate()) return;

    try {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));

      await _session.saveUserInPreference({
        "name": fullNameController.text.trim(),
        "email": emailController.text.trim(),
        "token": "reg_token_example",
      });

      if (context.mounted) {
        UiUtils.showFlushbar(context, "Welcome to Spendly!", isError: false);
        Get.offAllNamed(RoutesConstant.main);
      }
    } catch (e) {
      if (context.mounted) UiUtils.showFlushbar(context, e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// --- THE LOGOUT METHOD ---
  /// This clears the local storage and redirects the user to the Login screen.
  Future<void> logout(BuildContext context) async {
    try {
      isLoading.value = true; // Show the full-screen loader

      // 1. Clear the Session (Tokens, User data, isLogin flag)
      await _session.logout();

      // 2. Small delay for a smooth transition
      await Future.delayed(const Duration(milliseconds: 500));

      // 3. Navigate to Login and remove ALL previous screens from the stack
      // This is CRITICAL for security.
      Get.offAllNamed(RoutesConstant.login);

      if (context.mounted) {
        UiUtils.showFlushbar(
          context,
          "Logged out successfully",
          isError: false,
        );
      }
    } catch (e) {
      if (context.mounted) {
        UiUtils.showFlushbar(context, "Logout failed: $e");
      }
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    super.onClose();
  }
}
