import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/presentation/pages/write_review/widgets/interactive_star_rating.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class SubRatingCard extends StatelessWidget {
  final Map<String, RxInt> criteria;

  const SubRatingCard({super.key, required this.criteria});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.limeLightest, // Màu xanh nhạt vàng nhạt theo design
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: criteria.entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  entry.key,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                  ),
                ),
                Obx(
                  () => InteractiveStarRating(
                    currentRating: entry.value.value,
                    onRatingChanged: (rating) => entry.value.value = rating,
                    starSize: 20, // Kích thước sao nhỏ hơn cho sub criteria
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
