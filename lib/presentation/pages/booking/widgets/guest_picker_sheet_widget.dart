import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';
import 'package:hotel_booking/presentation/controllers/booking_controller.dart';
import 'package:hotel_booking/presentation/pages/booking/widgets/guest_row_widget.dart';

/// Bottom sheet chọn số lượng khách — gọi bằng showGuestPickerSheet(context)
void showGuestPickerSheet(BuildContext context) {
  final c = Get.find<BookingController>();
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 40),
      child: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Handle bar
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Select Guests',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 24),
            GuestRowWidget(
              label: 'Adults',
              sublabel: 'Age 13+',
              value: c.adults.value,
              onMinus: () => c.changeAdults(-1),
              onPlus: () => c.changeAdults(1),
            ),
            const Divider(height: 32),
            GuestRowWidget(
              label: 'Children',
              sublabel: 'Age 2–12',
              value: c.children.value,
              onMinus: () => c.changeChildren(-1),
              onPlus: () => c.changeChildren(1),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ButtonText(text: 'Done', onPressed: () => Get.back()),
            ),
          ],
        ),
      ),
    ),
  );
}
