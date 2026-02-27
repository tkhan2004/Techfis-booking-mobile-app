import 'package:flutter/material.dart';
import 'package:hotel_booking/domain/entities/booking_item.dart';

class BookingSummaryWidget extends StatelessWidget {
  final BookingItem bookingItem;

  const BookingSummaryWidget({super.key, required this.bookingItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Booking Details',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildDetailRow('Dates', bookingItem.dateRange),
          const Divider(height: 24, thickness: 1, color: Color(0xFFEEEEEE)),
          _buildDetailRow('Room Type', 'Deluxe Ocean View'),
          const Divider(height: 24, thickness: 1, color: Color(0xFFEEEEEE)),
          _buildDetailRow('Guests', '2 Adults, 1 Child'),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
