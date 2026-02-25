import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class PriceSummaryCard extends StatelessWidget {
  final double roomPrice;
  final int nights;
  final double serviceFee;
  final double tax;

  const PriceSummaryCard({
    super.key,
    required this.roomPrice,
    required this.nights,
    required this.serviceFee,
    required this.tax,
  });

  double get total => roomPrice + serviceFee + tax;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F1F1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          _buildPriceRow(
            'Room price ($nights nights)',
            roomPrice.toStringAsFixed(2) + ' VNĐ',
          ),
          const SizedBox(height: 12),
          _buildPriceRow('Service fee', serviceFee.toStringAsFixed(2) + ' VNĐ'),
          const SizedBox(height: 12),
          _buildPriceRow('Tax', tax.toStringAsFixed(2) + ' VNĐ'),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Divider(height: 1, color: Colors.grey),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                total.toStringAsFixed(1) + ' VNĐ',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textMain,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            color: Color(0xFF666666),
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
