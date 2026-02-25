import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/presentation/pages/auth/widgets/auth_redirect_text.dart';
import 'package:hotel_booking/component/text_field_component/input_text_field.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';
import 'package:hotel_booking/presentation/controllers/auth_controller.dart';
import 'package:hotel_booking/presentation/pages/auth/widgets/social_login_button.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);

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
                      "LOGIN",
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const SizedBox(width: 24),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "Please enter your a valid account email and password.",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Obx(
                  () => AuthTextField(
                    label: "Email",
                    hintText: "youremail@gmail.com",
                    onChanged: (value) => controller.email.value = value,
                    isPassword: false,
                    errorText: controller.emailError.value, // Reactive update
                  ),
                ),
                const SizedBox(height: 20),
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
                Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(color: AppColors.primaryDark),
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            const SizedBox(height: 20),
            Obx(
              () => controller.isLoading.value
                  ? const CircularProgressIndicator(color: AppColors.primary)
                  : ButtonText(text: "Login", onPressed: controller.login),
            ),
            const SizedBox(height: 20),
            _buildDivider(),
            const SizedBox(height: 8),
            buildSocialLoginButton(),
            const SizedBox(height: 20),
            AuthRedirectText(
              prefix: "Don't have an account? ",
              actionText: "Register",
              onTap: () => controller.changeStep(AuthStep.register),
            ),
          ],
        ),
      ],
    );
  }
}

Widget _buildDivider() {
  return Row(
    children: [
      const Expanded(
        child: Divider(thickness: 1, color: Colors.grey),
      ), // Đường kẻ trái
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(
          "OR",
          style: TextStyle(
            color: Colors.black.withOpacity(0.5),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      const Expanded(
        child: Divider(thickness: 1, color: Colors.grey),
      ), // Đường kẻ phải
    ],
  );
}
