import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:hotel_booking/component/card_product_component/room_card.dart';
import 'package:hotel_booking/presentation/controllers/home_page_controller.dart';
import 'package:hotel_booking/presentation/pages/home_page/widgets/home_background.dart';
import 'package:hotel_booking/presentation/pages/home_page/widgets/home_header.dart';
import 'package:hotel_booking/presentation/pages/home_page/widgets/home_search_bar.dart';
import 'package:hotel_booking/presentation/pages/home_page/widgets/home_section_header.dart';
import 'package:hotel_booking/presentation/pages/home_page/widgets/promo_carousel.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.put(HomePageController());

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
                      onSeeAllPressed: () {
                        // Navigate to promotions page
                      },
                    ),
                    const SizedBox(height: 4),

                    const PromoCarousel(),

                    const SizedBox(height: 4),

                    HomeSectionHeader(
                      title: "Popular Hotel",
                      text: "See all",
                      onSeeAllPressed: () {
                        // Navigate to popular hotels page
                      },
                    ),
                    const SizedBox(height: 4),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (
                            int i = 0;
                            i < controller.popularHotelList.length;
                            i++
                          )
                            Obx(
                              () => RoomCard(
                                image: controller.popularHotelList[i].image,
                                title: controller.popularHotelList[i].name,
                                location:
                                    controller.popularHotelList[i].location,
                                price: controller.popularHotelList[i].price
                                    .toString(),
                                rating: controller.popularHotelList[i].rating
                                    .toString(),
                              ),
                            ), // Padding để nội dung không bị che bởi bottom nav
                        ],
                      ),
                    ),
                    const SizedBox(height: 4),
                    HomeSectionHeader(
                      title: "Top Destination",
                      text: "See all",
                      onSeeAllPressed: () {
                        // Navigate to popular hotels page
                      },
                    ),
                    const SizedBox(height: 4),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (
                            int i = 0;
                            i < controller.popularHotelList.length;
                            i++
                          )
                            Obx(
                              () => RoomCard(
                                image: controller.popularHotelList[i].image,
                                title: controller.popularHotelList[i].name,
                                location:
                                    controller.popularHotelList[i].location,
                                price: controller.popularHotelList[i].price
                                    .toString(),
                                rating: controller.popularHotelList[i].rating
                                    .toString(),
                              ),
                            ), // Padding để nội dung không bị che bởi bottom nav
                        ],
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
            color: Colors.black.withOpacity(0.05),
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
