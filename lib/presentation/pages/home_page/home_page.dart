import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/card_product_component/destination_card.dart';
import 'package:hotel_booking/component/card_product_component/room_card.dart';
import 'package:hotel_booking/component/card_product_component/travel_blog_card.dart';
import 'package:hotel_booking/presentation/controllers/home_page_controller.dart';
import 'package:hotel_booking/presentation/controllers/main_controller.dart';
import 'package:hotel_booking/presentation/controllers/search_controller.dart';
import 'package:hotel_booking/presentation/pages/home_page/widgets/home_background.dart';
import 'package:hotel_booking/presentation/pages/home_page/widgets/home_header.dart';
import 'package:hotel_booking/presentation/pages/home_page/widgets/home_search_bar.dart';
import 'package:hotel_booking/presentation/pages/home_page/widgets/home_section_header.dart';
import 'package:hotel_booking/presentation/pages/home_page/widgets/promo_carousel.dart';
import 'package:hotel_booking/routes/app_routes.dart';

class HomePage extends GetView<HomePageController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Fixed Background Logo (không scroll, luôn hiển thị)
        Positioned.fill(
          child: Image.asset(
            "assets/images/background_logo.png",
            fit: BoxFit.fitWidth,
            alignment: Alignment.centerRight,
          ),
        ),

        // Scrollable Content
        SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Column(
            children: [
              Stack(children: const [HomeBackground(), HomeSearchBar()]),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeSectionHeader(
                      title: "Promotion",
                      onSeeAllPressed: () => Get.find<MainController>()
                          .switchToSearch(SearchCategory.promotion),
                    ),
                    const SizedBox(height: 4),

                    const PromoCarousel(),

                    const SizedBox(height: 4),

                    HomeSectionHeader(
                      title: "Popular Hotel",
                      text: "See all",
                      onSeeAllPressed: () => Get.find<MainController>()
                          .switchToSearch(SearchCategory.popular),
                    ),
                    const SizedBox(height: 4),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Obx(
                        () => Row(
                          children: [
                            for (var hotel in controller.popularHotelList)
                              Obx(
                                () => RoomCard(
                                  image: hotel.image,
                                  title: hotel.name,
                                  location: hotel.location,
                                  price: hotel.price.toString(),
                                  rating: hotel.rating.toString(),
                                  isFavorite: controller.isFavorite.value,
                                  onFavoriteTap: () =>
                                      controller.isFavorite.toggle(),
                                  onTap: () {
                                    Get.toNamed(
                                      AppRoutes.ROOM_DETAIL,
                                      arguments: hotel,
                                    ); // phải truyền argument để truy cập vào dữ liệu trong room detail
                                  },
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    HomeSectionHeader(
                      title: "Top Destination",
                      text: "See all",
                      onSeeAllPressed: () => Get.find<MainController>()
                          .switchToSearch(SearchCategory.destination),
                    ),
                    const SizedBox(height: 4),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Obx(
                        () => Row(
                          children: [
                            for (var hotel in controller.popularHotelList)
                              DestinationCard(
                                image: hotel.image,
                                location: hotel.name,
                                subLocation: hotel.location,
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 4),
                    HomeSectionHeader(
                      title: "Travel Blog",
                      text: "Read all",
                      onSeeAllPressed: () => Get.find<MainController>()
                          .switchToSearch(SearchCategory.all),
                    ),
                    const SizedBox(height: 4),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Obx(
                        () => Row(
                          children: [
                            for (var hotel in controller.popularHotelList)
                              TravelBlogCard(
                                image: hotel.image,
                                title: hotel.name,
                                subTitle: hotel.description,
                                publishedAt: hotel.date,
                              ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 200),
                  ],
                ),
              ),
            ],
          ),
        ),

        // Fixed Header
        const HomeHeader(),
      ],
    );
  }

  Widget _buildPlaceholderCard({required double height, required String text}) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(color: Colors.grey[600], fontSize: 16),
        ),
      ),
    );
  }
}
