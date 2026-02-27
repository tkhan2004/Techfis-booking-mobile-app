import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/presentation/controllers/travel_blog_list_controller.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';
import 'package:hotel_booking/domain/entities/travel_blog_category.dart';

class FilterChipsWidget extends StatelessWidget {
  final TravelBlogListController controller;
  const FilterChipsWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView.separated(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: TravelBlogCategory.values.length,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (_, i) {
            final cat = TravelBlogCategory.values[i];
            return Obx(() {
              final isActive = controller.activeCategory.value == cat;
              return GestureDetector(
                onTap: () => controller.setCategory(cat),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: isActive ? AppColors.primary : Colors.transparent,
                    border: Border.all(
                      color: isActive
                          ? AppColors.primary
                          : Colors.grey.shade300,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    TravelBlogCategory.label(cat),
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: isActive ? Colors.black : Colors.grey.shade600,
                    ),
                  ),
                ),
              );
            });
          },
        ),
      ),
    );
  }
}
