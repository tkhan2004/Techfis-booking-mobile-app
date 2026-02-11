import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isPassword;
  final Function(String) onChanged;
  final String? errorText; // Thêm parameter này
  final Widget? suffixIcon;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.isPassword = false,
    required this.onChanged,
    this.errorText, // Optional error text
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.black)),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            fillColor: const Color(0xFFF3F4F6),
            filled: true,
            // Hiển thị error text
            errorText: errorText,
            errorStyle: const TextStyle(color: Colors.red, fontSize: 12),
            suffixIcon: errorText != null
                ? const Icon(Icons.error_outline, color: Colors.red)
                : suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: errorText != null ? Colors.red : AppColors.primary,
              ),
            ),
          ),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
