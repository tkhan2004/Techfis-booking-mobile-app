import 'package:flutter/material.dart';
import 'package:hotel_booking/domain/entities/booking_item.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class BookingStatusHeader extends StatelessWidget {
  final BookingItem bookingItem;

  const BookingStatusHeader({super.key, required this.bookingItem});

  @override
  Widget build(BuildContext context) {
    String getStatusText() {
      switch (bookingItem.status) {
        case BookingStatus.upcoming:
        case BookingStatus.completed:
          return 'Confirmed';
        case BookingStatus.pending:
          return 'Pending';
        case BookingStatus.cancelled:
          return 'Cancelled';
      }
    }

    Color getStatusColor() {
      switch (bookingItem.status) {
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
      switch (bookingItem.status) {
        case BookingStatus.upcoming:
        case BookingStatus.completed:
          return AppColors.limeLightest;
        case BookingStatus.pending:
          return Colors.orange.shade50;
        case BookingStatus.cancelled:
          return AppColors.error.withValues(alpha: 0.1);
      }
    }

    IconData getStatusIcon() {
      switch (bookingItem.status) {
        case BookingStatus.upcoming:
        case BookingStatus.completed:
          return Icons.check_circle_outline;
        case BookingStatus.pending:
          return Icons.access_time;
        case BookingStatus.cancelled:
          return Icons.cancel_outlined;
      }
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking ID',
              style: TextStyle(
                color: Colors.grey.shade500,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              bookingItem.id,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: Colors.black,
              ),
            ),
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            color: getStatusBgColor(),
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(getStatusIcon(), color: getStatusColor(), size: 16),
              const SizedBox(width: 6),
              Text(
                getStatusText(),
                style: TextStyle(
                  color: getStatusColor(),
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
