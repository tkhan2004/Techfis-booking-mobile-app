import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class CounterButtonWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final bool enabled;

  const CounterButtonWidget({
    super.key,
    required this.icon,
    required this.onTap,
    required this.enabled,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enabled ? onTap : null,
      child: Container(
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: enabled ? AppColors.primary : Colors.grey.shade300,
            width: 1.5,
          ),
        ),
        child: Icon(
          icon,
          size: 18,
          color: enabled ? AppColors.secondary : Colors.grey.shade400,
        ),
      ),
    );
  }
}
