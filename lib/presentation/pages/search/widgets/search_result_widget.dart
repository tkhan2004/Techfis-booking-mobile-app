import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/presentation/pages/search/widgets/search_room_card.dart';
import 'package:hotel_booking/presentation/controllers/search_controller.dart';
import 'package:hotel_booking/routes/app_routes.dart';
import 'package:hotel_booking/domain/entities/search_category.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class SearchResultWidget extends StatelessWidget {
  final HotelSearchController controller;
  const SearchResultWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        );
      }

      final hotels = controller.filteredHotels;

      if (hotels.isEmpty) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.search_off_rounded,
                size: 64,
                color: Colors.grey.shade300,
              ),
              const SizedBox(height: 12),
              Text(
                'No hotels found',
                style: TextStyle(fontSize: 16, color: Colors.grey.shade500),
              ),
            ],
          ),
        );
      }
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(
              () => Row(
                children: [
                  Text(
                    '${hotels.length} results',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    SearchCategory.label(
                      controller.activeCategory.value ?? SearchCategory.all,
                    ),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.secondary,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
              itemCount: hotels.length,
              separatorBuilder: (_, __) => const SizedBox(height: 12),
              itemBuilder: (_, i) {
                final hotel = hotels[i];
                return SearchRoomCard(
                  image: hotel.image,
                  title: hotel.name,
                  location: hotel.location,
                  price: hotel.price.toStringAsFixed(0),
                  rating: hotel.rating.toString(),
                  isFavorite: false,
                  onFavoriteTap: () {},
                  onTap: () =>
                      Get.toNamed(AppRoutes.ROOM_DETAIL, arguments: hotel),
                  onBookNowTap: () =>
                      Get.toNamed(AppRoutes.BOOKING, arguments: hotel),
                );
              },
            ),
          ),
        ],
      );
    });
  }
}
