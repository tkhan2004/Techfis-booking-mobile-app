import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';
import 'package:hotel_booking/component/logo_component/company_logo.dart';
import 'package:hotel_booking/presentation/controllers/onboarding_controller.dart';
import 'package:hotel_booking/presentation/pages/onboarding/widgets/onboarding_item.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class OnboardingPage extends GetView<OnboardingController> {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: controller.pageController,
            itemCount: controller.onboardingPages.length,
            itemBuilder: (context, index) {
              final data = controller.onboardingPages[index];
              return OnboardingItem(data: data);
            },
            onPageChanged: (value) {
              controller.currentPage.value = value;
            },
          ),
          Positioned.fill(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 48),
                    child: const CompanyLogo(width: 200),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        Obx(
                          () => Column(
                            children: [
                              Text(
                                controller
                                    .onboardingPages[controller
                                        .currentPage
                                        .value]
                                    .title,
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium
                                    ?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                              const SizedBox(height: 12), // Added spacing
                              Text(
                                controller
                                    .onboardingPages[controller
                                        .currentPage
                                        .value]
                                    .description,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.bodyMedium
                                    ?.copyWith(
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              controller.onboardingPages.length,
                              (index) => AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                height: 8,
                                width: controller.currentPage.value == index
                                    ? 24
                                    : 8, // Chấm hiện tại sẽ dài ra
                                decoration: BoxDecoration(
                                  color: controller.currentPage.value == index
                                      ? AppColors.primary
                                      : Colors.white.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 12),
                        Column(
                          children: [
                            ButtonText(
                              text: "Continue",
                              onPressed: controller.nextPage,
                              isOutline: false,
                            ),
                            const SizedBox(height: 8),
                            ButtonText(
                              text: "Skip for now",
                              onPressed: controller.skip,
                              isOutline: true,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
