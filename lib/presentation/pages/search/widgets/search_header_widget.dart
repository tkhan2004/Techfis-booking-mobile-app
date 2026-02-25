import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/controllers/search_controller.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class SearchHeaderWidget extends StatelessWidget {
  final HotelSearchController controller;
  const SearchHeaderWidget({super.key, required this.controller});

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
                      hintText: 'Search by name or location...',
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
                    onPressed: () {},
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
