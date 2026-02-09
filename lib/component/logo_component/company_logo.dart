import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class CompanyLogo extends StatelessWidget {
  final double width;

  const CompanyLogo({super.key, this.width = 200});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100), // bo tròn viên thuốc
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // hiệu ứng mờ nền
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            border: Border.all(color: Colors.white.withOpacity(0.2), width: 2),
          ),
          child: Image.asset(
            "assets/images/logo.png",
            width: width,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
