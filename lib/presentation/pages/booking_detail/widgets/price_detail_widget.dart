import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class PriceDetailWidget extends StatelessWidget {
  final double price;

  const PriceDetailWidget({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat('#,##0', 'vi_VN');
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
            'Payment Details',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          _buildDetailRow(
            'Room Price (1 night)',
            '${formatCurrency.format(price)} VND',
          ),
          const SizedBox(height: 10),
          _buildDetailRow(
            'Taxes & Fees',
            '${formatCurrency.format(price * 0.1)} VND',
          ),
          const SizedBox(height: 10),
          _buildDetailRow(
            'Discount',
            '- ${formatCurrency.format(0)} VND',
            isDiscount: true,
          ),
          const Divider(height: 24, thickness: 1, color: Color(0xFFEEEEEE)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total Payment',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                '${formatCurrency.format(price + price * 0.1)} VND',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(
    String title,
    String value, {
    bool isDiscount = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade600),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isDiscount ? AppColors.error : Colors.black,
          ),
        ),
      ],
    );
  }
}
