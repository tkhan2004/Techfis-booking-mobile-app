import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/presentation/controllers/booking_controller.dart';

class PaymentMethodController extends GetxController {
  final allPaymentMethods = <PaymentCard>[
    const PaymentCard(
      id: 'visa_2424',
      number: '2424',
      type: 'VISA CARD',
      expiry: '12/26',
      iconColor: Color(0xFF1A1A2E),
      iconType: PaymentIconType.creditCard,
      category: PaymentCategory.bankCard,
    ),
    const PaymentCard(
      id: 'master_3232',
      number: '3232',
      type: 'MASTER CARD',
      expiry: '12/28',
      iconColor: Color(0xFF1565C0),
      iconType: PaymentIconType.creditCard,
      category: PaymentCategory.bankCard,
    ),
    const PaymentCard(
      id: 'momo',
      type: 'MOMO Wallet',
      subtitle: 'NGUYEN THANH KHANG',
      iconColor: Color(0xFFD82D8B),
      iconType: PaymentIconType.momoWallet,
      category: PaymentCategory.eWallet,
    ),
    const PaymentCard(
      id: 'momo_link',
      type: 'ADD LINK MOMO CONNECT',
      iconColor: Color(0xFFEE4D9B),
      iconType: PaymentIconType.momoLink,
      category: PaymentCategory.eWallet,
      isNavigate: true,
    ),
    const PaymentCard(
      id: 'bank_transfer',
      type: 'BANK TRANSFER',
      iconColor: Color(0xFF2196F3),
      iconType: PaymentIconType.bankTransfer,
      category: PaymentCategory.other,
      isNavigate: true,
    ),
  ];

  // Chỉ các item có thể chọn (không phải navigate)
  List<PaymentCard> get selectableItems =>
      allPaymentMethods.where((c) => !c.isNavigate).toList();

  late final RxString selectedPaymentId;

  @override
  void onInit() {
    super.onInit();
    try {
      selectedPaymentId =
          Get.find<BookingController>().selectedPaymentId.value.obs;
    } catch (_) {
      selectedPaymentId = 'visa_2424'.obs;
    }
  }

  void selectPayment(String cardId) {
    selectedPaymentId.value = cardId;
  }

  /// Xác nhận → update BookingController → back
  void confirmSelection() {
    try {
      Get.find<BookingController>().selectPayment(selectedPaymentId.value);
    } catch (_) {}
    Get.back();
  }
}
