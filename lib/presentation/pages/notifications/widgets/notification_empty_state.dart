import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class NotificationEmptyState extends StatelessWidget {
  const NotificationEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 60),
          Image.asset(
            "assets/images/Frame 1171276260.png",
            width: 250,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 24),
          const Text(
            "Opps!!",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w900,
              color: AppColors.primaryDark,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            "No notification yet",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 12),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text(
              "All notification we send will appear here, so you can view them easily anytime.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black45,
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
