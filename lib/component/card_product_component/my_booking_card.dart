import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hotel_booking/domain/entities/booking_item.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';

class MyBookingCard extends StatelessWidget {
  final BookingItem item;
  final VoidCallback onPressed;
  final VoidCallback? onTap;

  const MyBookingCard({
    super.key,
    required this.item,
    required this.onPressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color getStatusTextColor() {
      switch (item.status) {
        case BookingStatus.upcoming:
        case BookingStatus.completed:
          return AppColors.secondary;
        case BookingStatus.pending:
          return Colors.orange.shade700;
        case BookingStatus.cancelled:
          return AppColors.error;
      }
    }

    Color getStatusBgColor() {
      switch (item.status) {
        case BookingStatus.upcoming:
        case BookingStatus.completed:
          return AppColors.limeLightest;
        case BookingStatus.pending:
          return Colors.orange.shade50;
        case BookingStatus.cancelled:
          return AppColors.error.withValues(alpha: 0.1);
      }
    }

    String getStatusText() {
      switch (item.status) {
        case BookingStatus.upcoming:
          return 'CONFIRMED'; // Match screenshot
        case BookingStatus.pending:
          return 'PENDING';
        case BookingStatus.completed:
          return 'COMPLETED';
        case BookingStatus.cancelled:
          return 'CANCELLED';
      }
    }

    String getButtonText() {
      switch (item.status) {
        case BookingStatus.upcoming:
        case BookingStatus.completed:
          return 'View Ticket';
        case BookingStatus.pending:
          return 'Complete Payment';
        case BookingStatus.cancelled:
          return 'Details';
      }
    }

    bool isMainAction() {
      return item.status == BookingStatus.upcoming ||
          item.status == BookingStatus.completed;
    }

    final formatCurrency = NumberFormat('#,##0', 'vi_VN');

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        padding: const EdgeInsets.all(16),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: getStatusBgColor(),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    getStatusText(),
                    style: TextStyle(
                      color: getStatusTextColor(),
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  item.id,
                  style: TextStyle(
                    color: getStatusTextColor(),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.hotelName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.dateRange,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${formatCurrency.format(item.price)} VND',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    item.image,
                    width: 90,
                    height: 60,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      width: 90,
                      height: 60,
                      color: Colors.grey[300],
                      child: const Icon(Icons.hotel, color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Action button
            ButtonText(
              text: getButtonText(),
              onPressed: onPressed,
              isOutline:
                  !isMainAction(), // Using outline style if it's not the main action
            ),
          ],
        ),
      ),
    );
  }
}
