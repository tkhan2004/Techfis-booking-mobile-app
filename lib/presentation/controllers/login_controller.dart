import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hotel_booking/routes/app_routes.dart';

import 'package:hotel_booking/component/helper_component/success_dialog_widget.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void login() {
    // Show success dialog before going to home Page
    showSuccessDialog(
      title: "Login Successful!",
      message: "Welcome back to VNhotel. Let's find your perfect stay.",
      confirmText: "Go to Home",
      onConfirm: () {
        Get.offAllNamed(AppRoutes.HOME);
      },
    );
  }
}
