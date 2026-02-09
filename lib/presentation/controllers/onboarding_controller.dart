import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/models/onboarding_model.dart';
import 'package:hotel_booking/routes/app_routes.dart';

class OnboardingController extends GetxController {
  var currentPage = 0.obs;
  final pageController = PageController();
  final List<OnboardingModel> onboardingPages = [
    OnboardingModel(
      title: 'Start Your Adventure Today',
      description:
          'Discover thousands of luxury hotels, cozy resorts, and unique homestays tailored to your travel style.',
      image: 'assets/images/onboarding1.png',
    ),
    OnboardingModel(
      title: 'Find Your Perfect Stay Easily',
      description:
          'Smart filters help you sort by price, amenities, and location to find the room that fits your needs in seconds.',
      image: 'assets/images/onboarding2.png',
    ),
    OnboardingModel(
      title: 'Claim Your Member Perks',
      description:
          'Smart filters help you sort by price, amenities, and location to find the room that fits your needs in seconds.',
      image: 'assets/images/onboarding3.png',
    ),
  ];

  void nextPage() {
    if (currentPage.value < onboardingPages.length - 1) {
      pageController.nextPage(
        duration: 300.milliseconds,
        curve: Curves.ease,
      ); // curves giúp mượt mà về timing cho chuyển cảnh
    } else {
      Get.offNamed(AppRoutes.LOGIN);
    }
  }

  void skip() => Get.offNamed(AppRoutes.LOGIN);
}
