import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';
import 'package:hotel_booking/component/logo_component/company_logo.dart';
import 'package:hotel_booking/presentation/controllers/welcome_controller.dart';
import 'package:hotel_booking/utils/constants/app_styles.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAEF),
      body: _WelcomeAnimatedBody(controller: controller),
    );
  }
}

class _WelcomeAnimatedBody extends StatefulWidget {
  final WelcomeController controller;
  const _WelcomeAnimatedBody({Key? key, required this.controller})
    : super(key: key);

  @override
  State<_WelcomeAnimatedBody> createState() => _WelcomeAnimatedBodyState();
}

class _WelcomeAnimatedBodyState extends State<_WelcomeAnimatedBody>
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
          child: Center(
            // Bọc widget con vào Center để nó luôn nằm giữa trục ngang
            child: const CompanyLogo(width: 200),
          ),
        ),

        // Lớp UI trượt lên
        SlideTransition(
          position: _slideAnimation,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 352,
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Color(0xFFF9FAEF),
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: Column(
                children: [
                  Text(
                    "Let’s Explore The World",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Login to unlock exclusive deals and\nplan your perfect trip.",
                    textAlign: TextAlign.center,
                  ),
                  const Spacer(),

                  // Chỉ gọi hàm, không viết logic chuyển màn ở đây
                  ButtonText(
                    text: "Login",
                    onPressed: widget.controller.navigateToLogin,
                  ),

                  const Spacer(),
                  _buildRegisterLink(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRegisterLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Ready for your next adventure? "),
        GestureDetector(
          onTap: widget.controller.navigateToRegister,
          child: const Text(
            "Register",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
