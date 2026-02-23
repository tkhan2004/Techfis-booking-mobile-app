import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/button_component/favorite_button.dart';
import 'package:hotel_booking/component/card_product_component/room_card.dart';
import 'package:hotel_booking/models/hotel_model.dart';
import 'package:hotel_booking/presentation/controllers/room_detail_controller.dart';
import 'package:hotel_booking/presentation/pages/room_detail/widgets/button_appbar_widget.dart';
import 'package:hotel_booking/presentation/pages/room_detail/widgets/button_room_detail_widget.dart';
import 'package:hotel_booking/presentation/pages/room_detail/widgets/divider_widget.dart';
import 'package:hotel_booking/presentation/pages/room_detail/widgets/facility_item_widget.dart';
import 'package:hotel_booking/presentation/pages/room_detail/widgets/review_card_widget.dart';
import 'package:hotel_booking/routes/app_routes.dart';

class RoomDetailPage extends GetView<RoomDetailController> {
  const RoomDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HotelModel hotel = Get.arguments as HotelModel;
    // final ReviewModel review = Get.arguments as ReviewModel;

    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: buildPriceCard(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 360,
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            pinned: true,
            centerTitle: true,
            title: const Text(
              "Room Detail",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            leading: GestureDetector(
              onTap: () => Get.back(),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.8),
                    width: 1.5,
                  ),
                ),
                child: const Icon(
                  Icons.arrow_back_ios_new,
                  color: Colors.black,
                  size: 18,
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Obx(
                  () => FavoriteButton(
                    isFavorite: controller.isFavorite.value,
                    onTap: () => controller.isFavorite.toggle(),
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                hotel.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey[300],
                  child: const Icon(Icons.image, color: Colors.grey, size: 64),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hotel.name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 14,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          hotel.location,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.orange, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        hotel.rating.toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "(${hotel.reviews} reviews)",
                        style: TextStyle(color: Colors.grey[500], fontSize: 12),
                      ),
                    ],
                  ),
                  buildDivider(),
                  Text(
                    "Description",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    hotel.description,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ButtonRoomDetailWidget(text: "Read more", onPressed: () {}),
                  buildDivider(),
                  Text(
                    "Facilities",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const FacilitiesRowWidget(),
                  buildDivider(),
                  Text(
                    "Location",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Image.asset("assets/images/map.png"),
                  const SizedBox(height: 8),
                  Text(
                    hotel.location,
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                  const SizedBox(height: 8),
                  ButtonRoomDetailWidget(
                    text: "Check Location",
                    onPressed: () {},
                  ),
                  buildDivider(),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Reviews & Ratings",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Text(
                        "4.9",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: List.generate(
                              5,
                              (i) => Icon(
                                i < 4 ? Icons.star : Icons.star_half,
                                color: const Color(0xFFFEC62E),
                                size: 14,
                              ),
                            ),
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            "5,432 REVIEWS",
                            style: TextStyle(
                              fontSize: 10,
                              color: Color(0xFF8F8E8E),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 111,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ReviewCardWidget(
                          image: '',
                          fullName: 'Nguyen Khang',
                          date: DateTime(2026, 6, 1),
                          content:
                              'Cho phép chấm điểm riêng cho từng hạng mục như: Sạch sẽ, Dịch vụ, và Vị trí. Điều này giúp đánh giá trở nên chất lượng hơn.',
                          rating: 5,
                        ),
                        ReviewCardWidget(
                          image: '',
                          fullName: 'Tran Linh',
                          date: DateTime(2026, 5, 15),
                          content:
                              'Khách sạn rất đẹp, phòng sạch sẽ và tiện nghi. View biển cực đẹp, nhân viên rất thân thiện và nhiệt tình.',
                          rating: 4.5,
                        ),
                        ReviewCardWidget(
                          image: '',
                          fullName: 'Le Minh',
                          date: DateTime(2026, 4, 22),
                          content:
                              'Vị trí thuận lợi, gần bãi biển. Phòng sạch, dịch vụ tốt. Sẽ quay lại lần sau.',
                          rating: 4,
                        ),
                        ReviewCardWidget(
                          image: '',
                          fullName: 'Pham Anh',
                          date: DateTime(2026, 3, 10),
                          content:
                              'Excellent stay! The pool area is fantastic and the breakfast buffet has great variety. Highly recommended.',
                          rating: 5,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  ButtonRoomDetailWidget(
                    text: "Write a Review",
                    onPressed: () {},
                  ),
                  buildDivider(),
                  const Text(
                    "Similar Rooms",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    height: 224,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Obx(
                        () => Row(
                          children: [
                            for (final similarHotel in controller.hotelList)
                              RoomCard(
                                image: similarHotel.image,
                                title: similarHotel.name,
                                location: similarHotel.location,
                                price: similarHotel.price.toStringAsFixed(0),
                                rating: similarHotel.rating.toString(),
                                isFavorite: controller.isFavorite.value,
                                onFavoriteTap: () =>
                                    controller.isFavorite.toggle(),
                                onTap: () {
                                  Get.toNamed(
                                    AppRoutes.ROOM_DETAIL,
                                    arguments: similarHotel,
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
