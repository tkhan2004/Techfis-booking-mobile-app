import 'package:flutter/material.dart';

class StatusBadgeWidget extends StatelessWidget {
  final String status;
  const StatusBadgeWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFD6E6A5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        status,
        style: const TextStyle(
          color: Color(0xFF5D8A2E),
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
      ),
    );
  }
}
