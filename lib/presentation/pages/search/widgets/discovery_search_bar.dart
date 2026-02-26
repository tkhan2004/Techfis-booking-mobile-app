import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/input_component/custom_search_bar.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';
import 'package:hotel_booking/presentation/controllers/search_controller.dart';

class DiscoverySearchBar extends GetView<HotelSearchController> {
  const DiscoverySearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: CustomSearchBar(
              hintText: 'Search hotel name...',
              onChanged: controller.onSearch,
              backgroundColor: Colors.white,
              iconColor: Colors.grey,
              hintColor: Colors.grey,
              hasBorder: true,
              borderColor: AppColors.primary,
            ),
          ),
          const SizedBox(width: 4),
        ],
      ),
    );
  }
}
