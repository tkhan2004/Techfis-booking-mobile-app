import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class ButtonText extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isOutline;

  const ButtonText({
    super.key,
    required this.text,
    required this.onPressed,
    this.isOutline = false, // Mặc định là nút Solid (nền màu)
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isOutline ? Colors.transparent : AppColors.primary,
          foregroundColor: isOutline
              ? AppColors.primary
              : const Color.fromARGB(255, 42, 27, 27),

          side: isOutline
              ? const BorderSide(color: AppColors.primary, width: 1.5)
              : BorderSide.none,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16),
          elevation: 0,
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
