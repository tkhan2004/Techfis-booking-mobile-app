import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: 'Inter',

      textTheme: const TextTheme(
        headlineMedium: TextStyle( // Header 3 - 28px
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: AppColors.textMain,
        ),
        titleMedium: TextStyle( // Top Nav Title - 20px
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: AppColors.textMain,
        ),
        bodyLarge: TextStyle( // Button Text - 16px
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: AppColors.textMain,
        ),
        bodyMedium: TextStyle( // Small Title - 14px
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.textMain,
        ),
        labelSmall: TextStyle( // Super Mini Title - 10px
          fontSize: 10,
          color: AppColors.textSub,
        ),
      ),

      // Setup Button chuẩn Techfis (Radius 8/12, Padding 16)
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.primaryDark,
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Bo góc 12px theo Style Guide
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),

      // Setup Input chuẩn UI Kit
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.all(16), // Padding 16px chuẩn công ty
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}