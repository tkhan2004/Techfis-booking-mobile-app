import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/presentation/controllers/onboarding_controller.dart';
import 'package:hotel_booking/presentation/pages/onboarding/widgets/onboarding_item.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnboardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: controller.onboardingPages.length,
            itemBuilder: (context, index) {
              final data = controller.onboardingPages[index];
              return OnboardingItem(data: data);
            }, // navigation
            onPageChanged: (value) {
              controller.currentPage.value = value; // lưu current page index
            },
          ),
        ],
      ),
    );
  }
}
