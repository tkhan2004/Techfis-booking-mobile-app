import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class PhoneTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final Function(String) onChanged; // Callback khi text thay đổi
  final bool isPassword;
  final String? errorText; // Thêm parameter cho error message

  const PhoneTextField({
    super.key,
    required this.label,
    required this.hintText,
    required this.onChanged, // Bắt buộc phải có callback
    required this.isPassword,
    this.errorText, // Optional error text
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 14, color: Colors.black)),
        const SizedBox(height: 8),
        TextField(
          onChanged: onChanged, // Gọi callback khi user gõ
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            fillColor: const Color(0xFFF3F4F6),
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),

            // Hiển thị error text
            errorText: errorText,
            errorStyle: const TextStyle(color: Colors.red, fontSize: 12),

            // Icon lỗi ở cuối (suffixIcon)
            suffixIcon: errorText != null
                ? const Icon(Icons.error_outline, color: Colors.red)
                : null,

            prefixIcon: IntrinsicWidth(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(width: 12),
                  const Text("🇻🇳", style: TextStyle(fontSize: 24)),
                  const SizedBox(width: 8),
                  const Text(
                    "+84",
                    style: TextStyle(color: Colors.black87, fontSize: 14),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    width: 1,
                    height: 24,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  const SizedBox(width: 12),
                ],
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),

            // Border đỏ khi có lỗi, xanh khi focus bình thường
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
