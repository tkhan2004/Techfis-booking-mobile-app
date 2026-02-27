import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/routes/app_routes.dart';
import 'package:hotel_booking/component/appbar_component/custom_app_bar.dart';
import 'package:hotel_booking/component/card_product_component/favorite_room_card.dart';
import 'package:hotel_booking/component/helper_component/app_scaffold.dart';
import 'package:hotel_booking/component/input_component/custom_search_bar.dart';
import 'package:hotel_booking/presentation/controllers/favorite_controller.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavoriteController());
    return AppScaffold(
      appBar: const CustomAppBar(
        title: "Favorite",
        isBack: false,
        glassmorphism: false,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 12),
              child: CustomSearchBar(
                hintText: 'Search hotel name...',
                onChanged: controller.onSearchChanged,
                backgroundColor: Colors.white,
                iconColor: Colors.grey,
                hintColor: Colors.grey,
                hasBorder: true,
                borderColor: AppColors.primary,
              ),
            ),

            Expanded(
              child: Obx(
                () => controller.favoriteHotels.isEmpty
                    ? const Center(
                        child: Text(
                          "No favorite saved yet",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      )
                    : GridView.builder(
                        padding: const EdgeInsets.only(
                          left: 16,
                          right: 16,
                          bottom: 120, // space for bottom nav bar
                        ),
                        physics: const BouncingScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.72,
                            ),
                        itemCount: controller.favoriteHotels.length,
                        itemBuilder: (context, index) {
                          final hotel = controller.favoriteHotels[index];
                          return SizedBox(
                            child: FavoriteRoomCard(
                              image: hotel.image,
                              title: hotel.name,
                              location: hotel.location,
                              price: hotel.price.toStringAsFixed(0),
                              rating: hotel.rating,
                              onFavoriteTap: () =>
                                  controller.toggleFavorite(hotel),
                              onTap: () {
                                Get.toNamed(
                                  AppRoutes.ROOM_DETAIL,
                                  arguments: hotel,
                                );
                              },
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
