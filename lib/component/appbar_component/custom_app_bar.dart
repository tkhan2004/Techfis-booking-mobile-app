import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool glassmorphism;
  final VoidCallback? onBack;

  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.glassmorphism = false,
    this.onBack,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: glassmorphism ? Colors.transparent : Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: AppBarBackButton(glassmorphism: glassmorphism, onBack: onBack),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
          color: Colors.black,
        ),
      ),
      actions: actions,
    );
  }
}

class AppBarBackButton extends StatelessWidget {
  final bool glassmorphism;
  final VoidCallback? onBack;

  const AppBarBackButton({super.key, this.glassmorphism = false, this.onBack});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBack ?? () => Get.back(),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: glassmorphism
              ? Colors.white.withValues(alpha: 0.4)
              : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: glassmorphism
                ? Colors.white.withValues(alpha: 0.8)
                : Colors.grey.shade200,
            width: glassmorphism ? 1.5 : 1,
          ),
        ),
        child: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
          size: 18,
        ),
      ),
    );
  }
}
