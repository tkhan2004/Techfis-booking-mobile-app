import 'package:flutter/material.dart';
import 'package:hotel_booking/component/appbar_component/custom_app_bar.dart';
import 'package:hotel_booking/component/helper_component/app_scaffold.dart';
import 'package:hotel_booking/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/presentation/controllers/my_booking_controller.dart';
import 'package:hotel_booking/presentation/pages/my_booking/widgets/custom_booking_tab_bar.dart';
import 'package:hotel_booking/component/card_product_component/my_booking_card.dart';

class MyBookingPage extends GetView<MyBookingController> {
  const MyBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyBookingController());

    return AppScaffold(
      appBar: const CustomAppBar(
        title: "My Booking",
        isBack: false,
        glassmorphism: false,
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            CustomBookingTabBar(
              tabs: controller.tabs,
              currentIndex: controller.currentTabIndex,
              onTabChanged: controller.setTab,
            ),

            Expanded(
              child: Obx(() {
                final list = controller.filteredBookings;
                if (list.isEmpty) {
                  return const Center(
                    child: Text(
                      "No booking found.",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  );
                }
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 120),
                  itemCount: list.length,
                  itemBuilder: (context, index) {
                    final item = list[index];
                    return MyBookingCard(
                      item: item,
                      onPressed: () => controller.onActionPressed(item),
                      onTap: () => Get.toNamed(
                        AppRoutes.BOOKING_DETAIL,
                        arguments: item,
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
