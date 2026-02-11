import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class HomeSectionHeader extends StatelessWidget {
  final String title;
  final String? text;
  final VoidCallback? onSeeAllPressed;

  const HomeSectionHeader({
    super.key,
    required this.title,
    this.text,
    this.onSeeAllPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textMain,
          ),
        ),
        TextButton(
          onPressed: () {
            HapticFeedback.lightImpact();
            onSeeAllPressed?.call();
          },
          child: Text(
            text ?? "",
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
