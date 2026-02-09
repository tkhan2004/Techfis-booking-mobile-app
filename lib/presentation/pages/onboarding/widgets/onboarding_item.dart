import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';
import 'package:hotel_booking/models/onboarding_model.dart';

import '../../../../component/logo_component/company_logo.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel data;
  const OnboardingItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Image.asset(data.image, fit: BoxFit.cover)),

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
        Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 48),
                  child: CompanyLogo(width: 200),
                ),
                Column(
                  spacing: 12,
                  children: [
                    Text(
                      data.title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineMedium
                          ?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      data.description,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.white.withOpacity(0.8),
                      ),
                    ),
                    Column(
                      spacing: 8,
                      children: [
                        ButtonText(
                          text: "Continue",
                          onPressed: () {},
                          isOutline: false,
                        ),
                        ButtonText(
                          text: "Skip for now",
                          onPressed: () {},
                          isOutline: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
    throw UnimplementedError();
  }
}
