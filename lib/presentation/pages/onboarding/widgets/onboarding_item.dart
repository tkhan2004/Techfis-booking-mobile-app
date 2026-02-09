import 'package:flutter/material.dart';
import 'package:hotel_booking/models/onboarding_model.dart';

/// OnboardingItem - Widget hiển thị nội dung của MỖI trang onboarding
///
/// Chỉ chứa các phần tử ĐỘNG (thay đổi theo từng trang):
/// - Background image
/// - Gradient overlay
///
/// Title và Description đã được di chuyển lên OnboardingPage
/// để tránh render lại 3 lần không cần thiết
class OnboardingItem extends StatelessWidget {
  final OnboardingModel data;
  const OnboardingItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ===== BACKGROUND IMAGE =====
        // Hình nền full screen cho từng trang
        Positioned.fill(child: Image.asset(data.image, fit: BoxFit.cover)),

        // ===== GRADIENT OVERLAY =====
        // Lớp phủ gradient để text dễ đọc hơn
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
