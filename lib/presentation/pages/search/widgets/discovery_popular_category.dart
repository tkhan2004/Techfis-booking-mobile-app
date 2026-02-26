import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hotel_booking/presentation/pages/search/widgets/search_section_header.dart';
import 'package:hotel_booking/routes/app_routes.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class DiscoveryPopularCategory extends StatelessWidget {
  const DiscoveryPopularCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        SizedBox(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCategoryItem(Icons.nature_people, "Camping"),
              const SizedBox(width: 24),
              _buildCategoryItem(Icons.beach_access, "Beach"),
              const SizedBox(width: 24),
              _buildCategoryItem(Icons.star_border, "Luxury"),
              const SizedBox(width: 24),
              _buildCategoryItem(Icons.landscape, "Hiking"),
              const SizedBox(width: 24),
              _buildCategoryItem(Icons.favorite_border, "Love"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            color: AppColors.bottomNav,
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: Colors.black, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}
