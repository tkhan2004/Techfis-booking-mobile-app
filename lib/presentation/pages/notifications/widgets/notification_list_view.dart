import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/controllers/notifications_controller.dart';
import 'package:hotel_booking/presentation/pages/notifications/widgets/notification_card.dart';

class NotificationListView extends StatelessWidget {
  final NotificationsController controller;

  const NotificationListView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      children: [
        if (controller.notificationsToday.isNotEmpty) ...[
          const Text(
            "TODAY",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          ...controller.notificationsToday.map(
            (item) => NotificationCard(item: item),
          ),
        ],
        if (controller.notificationsEarlier.isNotEmpty) ...[
          const SizedBox(height: 8),
          const Text(
            "EARLIER",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          ...controller.notificationsEarlier.map(
            (item) => NotificationCard(item: item),
          ),
        ],
      ],
    );
  }
}
