import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';
import 'package:hotel_booking/presentation/controllers/filter_controller.dart';
import 'package:hotel_booking/presentation/pages/filter/widgets/distance_filter_widget.dart';
import 'package:hotel_booking/presentation/pages/filter/widgets/facilities_option_raw.dart';
import 'package:hotel_booking/presentation/pages/filter/widgets/filter_section_header.dart';
import 'package:hotel_booking/presentation/pages/filter/widgets/price_range_widget.dart';
import 'package:hotel_booking/presentation/pages/filter/widgets/promotion_widget.dart';
import 'package:hotel_booking/presentation/pages/filter/widgets/star_rating_group.dart';

class FilterBottomSheet extends GetView<FilterController> {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        children: [
          const SizedBox(height: 12),
          // Pill for drag indicator
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "Filters",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const FilterSectionHeader(title: "Price Range"),
                  PriceRangeFilter(),
                  const FilterSectionHeader(title: "Distance From Center"),
                  const DistanceFilterWidget(),
                  const FilterSectionHeader(title: "Star Rating"),
                  const StarRatingGroup(),
                  const FilterSectionHeader(title: "Facilities"),
                  const FacilitiesOptionRow(),
                  const FilterSectionHeader(title: "Promotion % Discount"),
                  const PromotionWidget(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
          // Bottom Navigation Buttons
          Container(
            padding: const EdgeInsets.only(
              bottom: 32,
              top: 12,
              left: 16,
              right: 16,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.05),
                  offset: const Offset(0, -4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: ButtonText(
                    text: "Clear all",
                    isOutline: true,
                    onPressed: () {},
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ButtonText(
                    text: "Show 15 results",
                    onPressed: () => Get.back(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
