import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/logo_component/company_logo.dart';
import 'package:hotel_booking/presentation/controllers/auth_controller.dart';
import 'package:hotel_booking/presentation/pages/auth/views/login_view.dart';
import 'package:hotel_booking/presentation/pages/auth/views/otp_verification_view.dart';
import 'package:hotel_booking/presentation/pages/auth/views/register_view.dart';
import 'package:hotel_booking/presentation/pages/auth/views/welcome_view.dart';
import 'package:hotel_booking/domain/entities/auth_step.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAEF),
      body: _AuthAnimatedBody(controller: controller),
    );
  }
}

class _AuthAnimatedBody extends StatefulWidget {
  final AuthController controller;
  const _AuthAnimatedBody({Key? key, required this.controller})
    : super(key: key);

  @override
  State<_AuthAnimatedBody> createState() => _AuthAnimatedBodyState();
}

class _AuthAnimatedBodyState extends State<_AuthAnimatedBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutBack));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(
            "assets/images/background_login.png",
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 60,
          left: 10,
          right: 0,
          child: Center(child: const CompanyLogo(width: 200)),
        ),
        Positioned(
          top: 50,
          left: 10,
          child: Obx(() {
            if (widget.controller.currentStep.value == AuthStep.welcome) {
              return const SizedBox.shrink();
            }
            return IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: widget.controller.goBack,
            );
          }),
        ),
        SlideTransition(
          position: _slideAnimation,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Obx(() {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                height: widget.controller.cardHeight,
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 8,
                  bottom: 40,
                  left: 24,
                  right: 24,
                ),
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 147, 147, 147),
                      blurRadius: 4,
                      offset: Offset(0, -4),
                    ),
                  ],
                  color: Color(0xFFF9FAEF),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
                ),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(opacity: animation, child: child);
                  },
                  child: _buildCurrentView(),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentView() {
    switch (widget.controller.currentStep.value) {
      case AuthStep.welcome:
        return const WelcomeView(key: ValueKey('welcome'));
      case AuthStep.login:
        return const LoginView(key: ValueKey('login'));
      case AuthStep.register:
        return const RegisterView(key: ValueKey('register'));
      case AuthStep.otpVerification:
        return const OtpVerificationView(key: ValueKey('otpVerification'));
    }
  }
}
