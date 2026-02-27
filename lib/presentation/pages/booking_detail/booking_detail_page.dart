import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/appbar_component/custom_app_bar.dart';
import 'package:hotel_booking/component/helper_component/app_scaffold.dart';
import 'package:hotel_booking/presentation/controllers/booking_detail_controller.dart';
import 'package:hotel_booking/presentation/pages/booking_detail/widgets/booking_status_header.dart';
import 'package:hotel_booking/presentation/pages/booking_detail/widgets/booking_summary_widget.dart';
import 'package:hotel_booking/presentation/pages/booking_detail/widgets/price_detail_widget.dart';
import 'package:hotel_booking/component/card_product_component/room_card_tag.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';
import 'package:hotel_booking/domain/entities/booking_item.dart';

class BookingDetailPage extends GetView<BookingDetailController> {
  const BookingDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: "Booking Detail",
        isBack: true,
        onBack: () => Get.back(),
        glassmorphism: false,
      ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BookingStatusHeader(bookingItem: controller.bookingItem),
              const SizedBox(height: 20),

              RoomCardConfirm(
                image: controller.bookingItem.image,
                title: controller.bookingItem.hotelName,
                location: controller
                    .bookingItem
                    .hotelName, // Use hotelName for location if address isn't in item
                price: controller.bookingItem.price.toStringAsFixed(0),
                rating: 5.0, // Mock rating
              ),
              const SizedBox(height: 20),

              BookingSummaryWidget(bookingItem: controller.bookingItem),
              const SizedBox(height: 20),

              PriceDetailWidget(price: controller.bookingItem.price),
              const SizedBox(height: 30),

              _buildActionButtons(controller.bookingItem.status),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BookingStatus status) {
    if (status == BookingStatus.pending) {
      return Column(
        children: [
          ButtonText(text: 'Go to Payment', onPressed: () {}),
          const SizedBox(height: 12),
          ButtonText(text: 'Cancel Booking', isOutline: true, onPressed: () {}),
        ],
      );
    } else if (status == BookingStatus.upcoming ||
        status == BookingStatus.completed) {
      return Column(
        children: [
          ButtonText(text: 'View Electronic Ticket', onPressed: () {}),
          const SizedBox(height: 12),
          if (status == BookingStatus.completed)
            ButtonText(text: 'Write Review', isOutline: true, onPressed: () {}),
        ],
      );
    }
    return const SizedBox();
  }
}
