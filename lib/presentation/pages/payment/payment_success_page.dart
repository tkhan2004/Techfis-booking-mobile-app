import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hotel_booking/component/helper_component/app_scaffold.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';
import 'package:hotel_booking/presentation/pages/payment/widgets/bill_ticket_widget.dart';
import 'package:hotel_booking/routes/app_routes.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 24),

              Container(
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.check_circle,
                  color: AppColors.primary,
                  size: 64,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Booking Successful!',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 6),
              const Text(
                'Your stay at Vung Tau Luxury is confirmed.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: FittedBox(
                  fit: BoxFit.contain,
                  alignment: Alignment.topCenter,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 32,
                    child: const BillTicketWidget(
                      bookingId: '123456789',
                      dates: '23 Jan – 25 Jan 2025',
                      guests: '2 Adults',
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              ButtonText(text: 'View My Booking', onPressed: () {}),
              const SizedBox(height: 10),
              ButtonText(
                text: 'Back to Home',
                isOutline: true,
                onPressed: () => Get.toNamed(AppRoutes.HOME),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
