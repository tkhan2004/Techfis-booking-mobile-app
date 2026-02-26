import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/appbar_component/custom_app_bar.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';
import 'package:hotel_booking/component/card_product_component/room_card_tag.dart';
import 'package:hotel_booking/component/helper_component/app_scaffold.dart';
import 'package:hotel_booking/presentation/controllers/room_detail_controller.dart';
import 'package:hotel_booking/presentation/pages/write_review/widgets/add_photo_section.dart';
import 'package:hotel_booking/presentation/pages/write_review/widgets/interactive_star_rating.dart';
import 'package:hotel_booking/presentation/pages/write_review/widgets/review_text_field.dart';
import 'package:hotel_booking/presentation/pages/write_review/widgets/sub_rating_card.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class WriteReviewPage extends GetView<RoomDetailController> {
  const WriteReviewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: "Write Review"),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(32, 4, 32, 16),
        child: ButtonText(
          text: "Submit Review",
          onPressed: () => controller.submitReview(),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      RoomCardConfirm(
                        image: controller.hotelEntity.image,
                        title: controller.hotelEntity.name,
                        location: controller.hotelEntity.location,
                        price: controller.hotelEntity.price.toStringAsFixed(0),
                        rating: controller.hotelEntity.rating,
                      ),
                      const SizedBox(height: 16),

                      // Overall Rating
                      const Text(
                        "How was your stay?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryDark,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Obx(
                        () => InteractiveStarRating(
                          currentRating: controller.overallRating.value,
                          onRatingChanged: (val) =>
                              controller.overallRating.value = val,
                          starSize: 40,
                        ),
                      ),
                      const SizedBox(height: 24),

                      // Sub Ratings Card
                      SubRatingCard(
                        criteria: {
                          'Cleanliness': controller.cleanlinessRating,
                          'Service': controller.serviceRating,
                          'Location': controller.locationRating,
                        },
                      ),
                      const SizedBox(height: 16),

                      // Review Text Field
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Share your experience",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      ReviewTextField(reviewText: controller.reviewText),
                      const SizedBox(height: 16),
                      // Add Photos
                      AddPhotoSection(photos: controller.uploadedPhotos),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
