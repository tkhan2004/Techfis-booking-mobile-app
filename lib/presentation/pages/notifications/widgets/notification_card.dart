import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/controllers/notifications_controller.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class NotificationCard extends StatelessWidget {
  final NotificationItem item;

  const NotificationCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors
            .limeLightest, // Màu nền của card notification theo thiết kế
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon ticket màu xanh lá
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.bottomNav,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.confirmation_num_outlined,
              color: AppColors.primaryDark,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          item.time,
                          style: const TextStyle(
                            fontSize: 10,
                            color: AppColors.primary,
                          ),
                        ),
                        if (!item.isRead) ...[
                          const SizedBox(width: 4),
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: AppColors.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  item.description,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
