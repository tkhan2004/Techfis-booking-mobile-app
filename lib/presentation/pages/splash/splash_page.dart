import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/controllers/splash_controller.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/background_logo.png",
              fit: BoxFit.fitWidth, // phủ trái
              alignment: Alignment.centerRight,
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/images/logo_company.png",
                  width: 500,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                ),
                Text(
                  "VN HOTEL",
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: AppColors.primaryDark,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
