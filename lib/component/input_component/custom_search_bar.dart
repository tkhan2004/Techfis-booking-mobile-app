import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final ValueChanged<String>? onChanged;
  final Color backgroundColor;
  final Color iconColor;
  final Color hintColor;
  final bool hasBorder;
  final Color borderColor;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    this.onChanged,
    this.backgroundColor = AppColors.bottomNav,
    this.iconColor = AppColors.primaryDark,
    this.hintColor = Colors.black54,
    this.hasBorder = false,
    this.borderColor = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        onChanged: onChanged,
        cursorColor: AppColors.primary,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: hintColor, fontSize: 14),
          prefixIcon: Icon(Icons.search_rounded, color: iconColor),
          border: hasBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: borderColor),
                )
              : InputBorder.none,
          focusedBorder: hasBorder
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: borderColor),
                )
              : InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 16,
          ),
        ),
      ),
    );
  }
}
