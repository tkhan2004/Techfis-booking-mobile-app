import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/presentation/pages/auth/widgets/auth_redirect_text.dart';
import 'package:hotel_booking/component/text_field_component/input_text_field.dart';
import 'package:hotel_booking/component/text_field_component/number_text_field.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';
import 'package:hotel_booking/presentation/controllers/auth_controller.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Phần trên: Form nhập liệu (Scrollable)
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: controller.goBack,
                      child: const Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "Register",
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const SizedBox(width: 24),
                  ],
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    "Create your account to unlock exclusive deals.",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const SizedBox(height: 8),
                // TextField cho Full Name - Worker tự động validate sau 500ms
                Obx(
                  () => AuthTextField(
                    label: "Full Name",
                    hintText: "Enter your full name",
                    onChanged: (value) =>
                        controller.name.value = value, // Chỉ cập nhật giá trị
                    isPassword: false,
                    errorText: controller.nameError.value, // Reactive update
                  ),
                ),
                const SizedBox(height: 20),
                // TextField cho Phone - Worker tự động validate sau 500ms
                Obx(
                  () => PhoneTextField(
                    label: "Phone Number",
                    hintText: "Enter your phone number",
                    onChanged: (value) => controller.phone.value = value,
                    isPassword: false,
                    errorText: controller.phoneError.value,
                  ),
                ),
                const SizedBox(height: 20),
                // TextField cho Email - Worker tự động validate sau 500ms
                Obx(
                  () => AuthTextField(
                    label: "Email",
                    hintText: "youremail@gmail.com",
                    onChanged: (value) => controller.email.value = value,
                    isPassword: false,
                    errorText: controller.emailError.value,
                  ),
                ),
                const SizedBox(height: 20),
                // TextField cho Password - Worker tự động validate sau 500ms
                Obx(
                  () => AuthTextField(
                    label: "Password",
                    hintText: "yourpassword",
                    onChanged: (value) => controller.password.value = value,
                    isPassword: true,
                    errorText: controller.passwordError.value,
                  ),
                ),
                const SizedBox(height: 20),
                // TextField cho Confirm Password - Worker tự động validate sau 500ms
                Obx(
                  () => AuthTextField(
                    label: "Confirm Password",
                    hintText: "yourpassword",
                    onChanged: (value) =>
                        controller.confirmPassword.value = value,
                    isPassword: true,
                    errorText: controller.confirmPasswordError.value,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Phần dưới: Buttons (Continue, Login Redirect) - Cố định ở đáy
        Column(
          children: [
            const SizedBox(height: 24),
            ButtonText(
              text: "Continue",
              onPressed: () {
                controller.changeStep(AuthStep.otpVerification);
              },
            ),
            const SizedBox(height: 20),
            AuthRedirectText(
              prefix: "Already have an account? ",
              actionText: "Login",
              onTap: () => controller.changeStep(AuthStep.login),
            ),
          ],
        ),
      ],
    );
  }
}
