import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/appbar_component/custom_app_bar.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';
import 'package:hotel_booking/component/payment/payment_method_card.dart';
import 'package:hotel_booking/presentation/controllers/booking_controller.dart';
import 'package:hotel_booking/presentation/controllers/payment_method_controller.dart';
import 'package:hotel_booking/component/helper_component/app_scaffold.dart';
import 'package:hotel_booking/presentation/pages/payment/widgets/add_card_button_widget.dart';
import 'package:hotel_booking/presentation/pages/payment/widgets/section_title_widget.dart';

class PaymentMethodPage extends GetView<PaymentMethodController> {
  const PaymentMethodPage({super.key});

  List<Widget> _buildSection(List<PaymentCard> items) {
    return [
      for (final card in items) ...[
        PaymentMethodCard(
          cardId: card.id,
          cardType: card.type,
          cardNumber: card.number,
          expiry: card.expiry,
          subtitle: card.subtitle,
          iconColor: card.iconColor,
          iconType: card.iconType,
          isNavigate: card.isNavigate,
          isSelected: controller.selectedPaymentId.value == card.id,
          onSelect: card.isNavigate ? null : controller.selectPayment,
          onNavigate: card.isNavigate ? () {} : null,
        ),
        const SizedBox(height: 10),
      ],
    ];
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: 'Payment Methods'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 32),
        child: ButtonText(
          text: 'Select & Continue',
          onPressed: controller.confirmSelection,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 8),

              SectionTitle('Payment Method'),
              const SizedBox(height: 12),
              ..._buildSection(
                controller.allPaymentMethods
                    .where((c) => c.category == PaymentCategory.bankCard)
                    .toList(),
              ),
              const SizedBox(height: 8),
              AddNewCardButton(),
              const SizedBox(height: 24),

              SectionTitle('E-Wallets'),
              const SizedBox(height: 12),
              // ... là cách hiển thị 1 list
              ..._buildSection(
                controller.allPaymentMethods
                    .where((c) => c.category == PaymentCategory.eWallet)
                    .toList(),
              ),
              const SizedBox(height: 24),

              SectionTitle('Other Payment Methods'),
              const SizedBox(height: 12),
              ..._buildSection(
                controller.allPaymentMethods
                    .where((c) => c.category == PaymentCategory.other)
                    .toList(),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
