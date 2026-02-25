import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/appbar_component/custom_app_bar.dart';
import 'package:hotel_booking/component/button_component/sub_button.dart';
import 'package:hotel_booking/component/card_product_component/room_card_tag.dart';
import 'package:hotel_booking/component/helper_component/app_scaffold.dart';
import 'package:hotel_booking/component/helper_component/divider_widget.dart';
import 'package:hotel_booking/component/payment/payment_method_card.dart';
import 'package:hotel_booking/presentation/controllers/booking_controller.dart';
import 'package:hotel_booking/presentation/pages/booking/widgets/booking_field_widget.dart';
import 'package:hotel_booking/presentation/pages/booking/widgets/booking_section_widget.dart';
import 'package:hotel_booking/component/helper_component/confirm_dialog_widget.dart';
import 'package:hotel_booking/presentation/pages/booking/widgets/guest_picker_sheet_widget.dart';
import 'package:hotel_booking/presentation/pages/booking/widgets/price_summary_widget.dart';
import 'package:hotel_booking/presentation/pages/room_detail/widgets/button_appbar_widget.dart';
import 'package:hotel_booking/presentation/pages/booking/widgets/user_infor_card_widget.dart';
import 'package:hotel_booking/routes/app_routes.dart';

class BookingPage extends GetView<BookingController> {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: 'Confirm Booking'),
      bottomNavigationBar: buildPriceCard(
        controller.hotel,
        buttonText: 'Confirm & Pay',
        onPressed: () => showConfirmDialog(
          context,
          title: 'Confirm Payment',
          message: 'Are you sure you want to pay for this booking?',
          confirmText: 'Confirm & Pay',
          icon: Icons.payment_rounded,
          onConfirm: () => Get.toNamed(AppRoutes.PAYMENT_SUCCESS),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            UserInfoCard(
              name: 'Thanh Khang',
              email: 'thanhkhang@gmail.com',
              imageUrl: 'https://picsum.photos/seed/174/600',
              onMorePressed: () {},
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoomCardConfirm(
                    image: controller.hotel.image,
                    title: controller.hotel.name,
                    location: controller.hotel.location,
                    price: controller.hotel.price.toString(),
                    rating: controller.hotel.rating,
                  ),
                  buildDivider(),
                  const Text(
                    'Room Detail',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                  Obx(
                    () => BookingFieldWidget(
                      title: 'Dates',
                      subtitle: controller.datesDisplay,
                      action: SubButton(
                        text: 'Edit Dates',
                        onPressed: () => controller.pickDates(context),
                      ),
                    ),
                  ),
                  Obx(
                    () => BookingFieldWidget(
                      title: 'Guests',
                      subtitle: controller.guestsDisplay,
                      action: SubButton(
                        text: 'Edit Guests',
                        onPressed: () => showGuestPickerSheet(context),
                      ),
                    ),
                  ),
                  buildDivider(),
                  Obx(
                    () => PriceSummaryCard(
                      roomPrice: controller.hotel.price,
                      nights: controller.nights,
                      serviceFee: 10,
                      tax: 5,
                    ),
                  ),
                  buildDivider(),
                  BookingSectionWidget(
                    title: 'Payment Method',
                    text: 'Change Card',
                    onSeeAllPressed: () =>
                        Get.toNamed(AppRoutes.PAYMENT_METHOD),
                  ),
                  Obx(() {
                    final card = controller.selectedCard;
                    if (card == null) return const SizedBox.shrink();
                    return PaymentMethodCard(
                      cardId: card.id,
                      cardType: card.type,
                      cardNumber: card.number,
                      expiry: card.expiry,
                      subtitle: card.subtitle,
                      iconColor: card.iconColor,
                      iconType: card.iconType,
                      isSelected: true,
                      onSelect: (_) {},
                    );
                  }),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
