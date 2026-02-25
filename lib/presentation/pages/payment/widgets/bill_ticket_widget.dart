import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/pages/payment/widgets/dash_separator_widget.dart';
import 'package:hotel_booking/presentation/pages/payment/widgets/icon_row_widget.dart';
import 'package:hotel_booking/presentation/pages/payment/widgets/infor_column_widget.dart';
import 'package:hotel_booking/presentation/pages/payment/widgets/status_badge_widget.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Thêm thư viện qr_flutter vào pubspec.yaml

class BillTicketWidget extends StatelessWidget {
  final String bookingId;
  final String dates;
  final String guests;

  const BillTicketWidget({
    super.key,
    required this.bookingId,
    required this.dates,
    required this.guests,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InforColumnWidget(
                      label: 'BOOKING ID',
                      value: bookingId,
                      color: const Color(0xFFB4D333),
                    ),
                    StatusBadgeWidget(status: 'CONFIRMED'),
                  ],
                ),
                const SizedBox(height: 12),
                IconRowWidget(
                  icon: Icons.access_time_filled,
                  label: 'Dates',
                  value: dates,
                ),
                const SizedBox(height: 12),
                IconRowWidget(
                  icon: Icons.person_pin_rounded,
                  label: 'Guests',
                  value: guests,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: DashSeparator(color: Colors.grey),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    children: [
                      QrImageView(
                        data: bookingId,
                        version: QrVersions.auto,
                        size: 144.0,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        bookingId,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'SCAN AT CHECK-IN',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF666666),
                    letterSpacing: 0.8,
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
