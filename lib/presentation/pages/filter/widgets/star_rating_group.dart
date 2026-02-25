import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class StarRatingGroup extends StatefulWidget {
  const StarRatingGroup({super.key});

  @override
  State<StarRatingGroup> createState() => _StarRatingGroupState();
}

class _StarRatingGroupState extends State<StarRatingGroup> {
  // Mặc định chọn "Any"
  String selectedRating = "Any";

  final List<String> ratings = [
    "Any",
    "1 Star",
    "2 Star",
    "3 Star",
    "4 Star",
    "5 Star",
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8, // Khoảng cách ngang giữa các chip
      runSpacing: 8, // Khoảng cách dọc khi xuống hàng
      children: ratings.map((rating) {
        final isSelected = selectedRating == rating;
        final Color bgColor = isSelected
            ? AppColors.primary
            : const Color(0xFFF8FBE9);
        final Color borderColor = isSelected
            ? AppColors.primary
            : Colors.transparent;
        final Color iconColor = isSelected ? Colors.white : AppColors.primary;
        final Color textColor = isSelected ? Colors.white : Colors.black;

        return GestureDetector(
          onTap: () {
            setState(() {
              selectedRating = rating;
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: bgColor,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: borderColor),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (rating == "Any")
                  Icon(Icons.star, size: 16, color: iconColor),
                if (rating == "Any") const SizedBox(width: 4),
                Text(
                  rating,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
