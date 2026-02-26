import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReviewTextField extends StatelessWidget {
  final RxString reviewText;

  const ReviewTextField({super.key, required this.reviewText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: TextField(
        style: const TextStyle(fontSize: 12),
        maxLines: 6,
        onChanged: (val) => reviewText.value = val,
        decoration: const InputDecoration(
          hintText: "Tell us about your stay...",
          hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16),
        ),
      ),
    );
  }
}
