import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class DiscoveryRecentSearches extends StatelessWidget {
  const DiscoveryRecentSearches({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0),
          child: Text(
            "RECENT SEARCHES",
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 40,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildRecentSearchChip("Da Lat, Lam Dong"),
              const SizedBox(width: 12),
              _buildRecentSearchChip("Da Nang"),
              const SizedBox(width: 12),
              _buildRecentSearchChip("Ho Chi Minh City"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRecentSearchChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.limeLightest,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.history, size: 16, color: AppColors.secondary),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
