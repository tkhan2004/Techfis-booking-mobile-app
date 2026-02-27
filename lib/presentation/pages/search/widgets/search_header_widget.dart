import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/presentation/controllers/search_controller.dart';
import 'package:hotel_booking/presentation/controllers/filter_controller.dart';
import 'package:hotel_booking/presentation/pages/filter/filter_page.dart';
import 'package:hotel_booking/presentation/pages/filter/widgets/location_search_widget.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class SearchHeaderWidget extends StatelessWidget {
  final HotelSearchController controller;
  const SearchHeaderWidget({super.key, required this.controller});

  void _showLocationBottomSheet() {
    Get.bottomSheet(
      Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.only(bottom: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            LocationSearchWidget(
              onLocationSelected: (city, district, ward) {
                // Formatting selected location text
                String newLocation = "Select location...";
                if (city != null) {
                  newLocation = city;
                  if (district != null) newLocation = "$district, $newLocation";
                  if (ward != null) newLocation = "$ward, $newLocation";
                }
                controller.selectedLocation.value = newLocation;
              },
            ),
            const SizedBox(height: 24),
            ButtonText(text: "Apply Location", onPressed: () => Get.back()),
            const SizedBox(height: 16),
          ],
        ),
      ),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  void _showFilterBottomSheet() {
    if (!Get.isRegistered<FilterController>()) {
      Get.put(FilterController());
    }

    Get.bottomSheet(
      const FilterBottomSheet(),
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: controller.onSearch,
                    cursorColor: AppColors.primary,
                    decoration: const InputDecoration(
                      hintText: 'Search hotel name...',
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 4),
                Padding(
                  padding: const EdgeInsets.only(right: 4.0),
                  child: IconButton(
                    icon: const Icon(
                      Icons.filter_alt_rounded,
                      color: Colors.grey,
                      size: 24,
                    ),
                    onPressed: _showFilterBottomSheet,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          GestureDetector(
            onTap: _showLocationBottomSheet,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.location_on,
                    color: AppColors.primary,
                    size: 16,
                  ),
                ),
                const SizedBox(width: 8),
                Obx(
                  () => Text(
                    controller.selectedLocation.value,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
