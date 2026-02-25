import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class AddCardTextFlield extends StatelessWidget {
  final String label;
  final String placeholder;
  final double? width;
  const AddCardTextFlield({
    super.key,
    required this.label,
    required this.placeholder,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 16, color: Colors.black)),
          const SizedBox(height: 4),
          TextField(
            cursorColor: AppColors.primary,
            decoration: InputDecoration(
              fillColor: const Color(0xFFF3F4F6),
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
                borderSide: BorderSide(color: AppColors.primary),
              ),
              hintText: placeholder,
              hintStyle: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
