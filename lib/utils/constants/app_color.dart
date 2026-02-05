import 'package:flutter/material.dart';

class AppColors {
  // Brand Colors (Cột Lime Green và Deep Green)
  static const Color primary = Color(0xFFAFCA31);      // Xanh mạ chính (Button)
  static const Color primaryDark = Color(0xFF004831);  // Xanh đậm chính (Header/Logo)

  // Lime Green Scale (Cột trái)
  static const Color limeLightest = Color(0xFFF7FAEA); // Màu nền chuẩn IKIGAI
  static const Color limeDarker = Color(0xFF586519);

  // Deep Green Scale (Cột phải)
  static const Color greenLight = Color(0xFF4D7F6F);   // Dùng cho Text phụ
  static const Color greenDarkest = Color(0xFF002419);

  // Functional Colors (Theo chuẩn công ty)
  static const Color background = limeLightest;
  static const Color surface = Colors.white;
  static const Color error = Color(0xFFE74C3C);        // Màu đỏ lỗi (chuẩn UI Kit)
  static const Color textMain = primaryDark;
  static const Color textSub = greenLight;
}