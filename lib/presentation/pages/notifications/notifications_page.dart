import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/appbar_component/custom_app_bar.dart';
import 'package:hotel_booking/component/helper_component/app_scaffold.dart';
import 'package:hotel_booking/presentation/controllers/notifications_controller.dart';
import 'package:hotel_booking/presentation/pages/notifications/widgets/notification_empty_state.dart';
import 'package:hotel_booking/presentation/pages/notifications/widgets/notification_list_view.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class NotificationsPage extends GetView<NotificationsController> {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: 'Notifications',
        actions: [
          TextButton(
            onPressed: () {
              controller.markAllAsRead();
            },
            child: const Text(
              "Mark all",
              style: TextStyle(
                color: AppColors.secondary,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          Obx(() {
            if (controller.isEmpty) {
              return const NotificationEmptyState();
            } else {
              return NotificationListView(controller: controller);
            }
          }),
        ],
      ),
    );
  }
}
