import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget buildSocialLoginButton() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _socialButton(iconPath: "assets/icon/google.svg", onTap: () {}),
      const SizedBox(width: 16),
      _socialButton(iconPath: "assets/icon/apple.svg", onTap: () {}),
    ],
  );
}

//InkWell trong Flutter là một widget Material Design giúp bao bọc các thành phần giao diện (như Container, Image, Text) để nhận biết cử chỉ chạm (tap) và hiển thị hiệu ứng gợn sóng (ripple effect/splash) đặc trưng khi người dùng nhấn vào.
Widget _socialButton({required String iconPath, required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(12),
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.withValues(alpha: 0.3),
        ), // Viền xám nhạt
        borderRadius: BorderRadius.circular(12),
      ),
      child: SvgPicture.asset(
        iconPath,
        width: 24, // Size chuẩn
        height: 24,
      ),
    ),
  );
}
