import 'dart:async';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/data/datasources/mock_auth_service.dart';
import 'package:hotel_booking/data/repositories/auth_repository.dart';
import 'package:hotel_booking/routes/app_routes.dart';

enum AuthStep { welcome, login, register, otpVerification }

class AuthController extends GetxController {
  late final AuthRepository _authRepository;

  @override
  void onInit() {
    super.onInit();
    // Initialize repository with mock service
    _authRepository = AuthRepository(MockAuthService());
    setupValidators();
  }

  void setupValidators() {
    // Worker sẽ tự động lắng nghe thay đổi của biến Rx và gọi validation
    // debounce: Chờ user ngừng gõ 500ms rồi mới validate (tránh validate liên tục)
    debounce(
      name,
      (_) => validateName(),
      time: const Duration(milliseconds: 500),
    );
    debounce(
      phone,
      (_) => validatePhone(),
      time: const Duration(milliseconds: 500),
    );
    debounce(
      email,
      (_) => validateEmail(),
      time: const Duration(milliseconds: 500),
    );
    debounce(
      password,
      (_) => validatePassword(),
      time: const Duration(milliseconds: 500),
    );
    debounce(
      confirmPassword,
      (_) => validateConfirmPassword(),
      time: const Duration(milliseconds: 500),
    );
  }

  var currentStep = AuthStep.welcome.obs;

  final List<AuthStep> _history = [];

  void changeStep(AuthStep step) {
    _history.add(currentStep.value);
    currentStep.value = step;

    if (step == AuthStep.otpVerification) {
      startTimer();
    }
  }

  void goBack() {
    if (_history.isNotEmpty) {
      currentStep.value = _history.removeLast();
    } else {
      Get.back();
    }
  }

  var start = 60.obs;
  Timer? _timer;

  void startTimer() {
    start.value = 59;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (start.value > 0) {
        start.value--;
      } else {
        timer.cancel();
      }
    });
  }

  String get timerText {
    int minutes = start.value ~/ 60;
    int seconds = start.value % 60;
    return "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}";
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  // Reactive variables cho dữ liệu form
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;
  var phone = ''.obs;
  var otp = ''.obs;
  var isLoading = false.obs;

  // Reactive variables cho error messages
  var nameError = Rxn<String>(); // Rxn = Rx nullable
  var emailError = Rxn<String>();
  var passwordError = Rxn<String>();
  var confirmPasswordError = Rxn<String>();
  var phoneError = Rxn<String>();
  var otpError = Rxn<String>();

  void validateEmail() {
    if (email.value.isEmpty) {
      emailError.value = null; // Không hiện lỗi nếu rỗng
      return;
    }

    if (!GetUtils.isEmail(email.value)) {
      emailError.value = "Invalid email format"; // Set error message
    } else {
      emailError.value = null; // Clear error nếu hợp lệ
    }
  }

  void validateName() {
    if (name.value.isEmpty) {
      nameError.value = null;
      return;
    }

    if (name.value.length < 2) {
      nameError.value = "Name must be at least 2 characters";
    } else {
      nameError.value = null;
    }
  }

  void validatePassword() {
    if (password.value.isEmpty) {
      passwordError.value = null;
      return;
    }

    if (password.value.length < 6) {
      passwordError.value = "Password must be at least 6 characters";
    } else {
      passwordError.value = null;
    }
  }

  void validateConfirmPassword() {
    if (confirmPassword.value.isEmpty) {
      confirmPasswordError.value = null;
      return;
    }

    if (confirmPassword.value != password.value) {
      confirmPasswordError.value = "Confirm password does not match";
    } else {
      confirmPasswordError.value = null;
    }
  }

  void validatePhone() {
    if (phone.value.isEmpty) {
      phoneError.value = null; // Không hiện lỗi nếu rỗng
      return;
    }

    if (!RegExp(r'^[0-9]{9,10}$').hasMatch(phone.value)) {
      phoneError.value = "Invalid phone number (9-10 digits)";
    } else {
      phoneError.value = null; // Clear error nếu hợp lệ
    }
  }

  double get cardHeight {
    switch (currentStep.value) {
      case AuthStep.welcome:
        return 320;
      case AuthStep.login:
        return 600;
      case AuthStep.register:
        return 720;
      case AuthStep.otpVerification:
        return 440;
    }
  }

  Future<void> login() async {
    validateEmail();
    validatePassword();

    if (emailError.value != null || passwordError.value != null) {
      Get.snackbar(
        "Error",
        "Please check your input",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;
    try {
      final success = await _authRepository.login(email.value, password.value);
      if (success) {
        Get.offNamed(AppRoutes.HOME);
      } else {
        Get.snackbar(
          "Login Failed",
          "Invalid email or password",
          backgroundColor: Colors.redAccent,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "An unexpected error occurred",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
