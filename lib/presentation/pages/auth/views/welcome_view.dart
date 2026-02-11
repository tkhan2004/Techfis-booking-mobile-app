import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/presentation/pages/auth/widget/auth_redirect_text.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';
import 'package:hotel_booking/presentation/controllers/auth_controller.dart';
import 'package:hotel_booking/presentation/pages/auth/widget/social_login_button.dart';

class WelcomeView extends GetView<AuthController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Let's Explore The World",
          style: Theme.of(
            context,
          ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        const Text(
          "Login to unlock exclusive deals and\nplan your perfect trip.",
          textAlign: TextAlign.center,
        ),
        const Spacer(),
        ButtonText(
          text: "Start now",
          onPressed: () => controller.changeStep(AuthStep.login),
        ),
        const Spacer(),
        AuthRedirectText(
          prefix: "Ready for your next adventure? ",
          actionText: "Register",
          onTap: () => controller.changeStep(AuthStep.register),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
