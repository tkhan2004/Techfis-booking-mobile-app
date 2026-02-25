import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/domain/entities/hotel_entity.dart';
import 'package:intl/intl.dart';

enum PaymentCategory { bankCard, eWallet, other }

enum PaymentIconType { creditCard, momoWallet, momoLink, bankTransfer }

class PaymentCard {
  final String id;
  final String number;
  final String type;
  final String subtitle;
  final String expiry;
  final Color iconColor;
  final PaymentIconType iconType;
  final PaymentCategory category;
  final bool isNavigate;

  const PaymentCard({
    required this.id,
    this.number = '',
    required this.type,
    this.subtitle = '',
    this.expiry = '',
    this.iconColor = Colors.black,
    this.iconType = PaymentIconType.creditCard,
    this.category = PaymentCategory.bankCard,
    this.isNavigate = false,
  });
}

class BookingController extends GetxController {
  late HotelEntity hotel;

  final paymentMethods = <PaymentCard>[
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
  ];
  final selectedPaymentId = 'visa_2424'.obs;

  final checkIn = DateTime.now().obs;
  final checkOut = DateTime.now().add(const Duration(days: 2)).obs;

  int get nights =>
      checkOut.value.difference(checkIn.value).inDays.clamp(1, 365);

  String get datesDisplay {
    final fmt = DateFormat('d MMM');
    return '${fmt.format(checkIn.value)} - ${fmt.format(checkOut.value)}';
  }

  Future<void> pickDates(context) async {
    final now = DateTime.now();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
      initialDateRange: DateTimeRange(
        start: checkIn.value,
        end: checkOut.value,
      ),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFFB4D333),
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      checkIn.value = picked.start;
      checkOut.value = picked.end;
    }
  }

  final adults = 2.obs;
  final children = 0.obs;

  String get guestsDisplay {
    final parts = <String>[];
    if (adults.value > 0)
      parts.add('${adults.value} Adult${adults.value > 1 ? 's' : ''}');
    if (children.value > 0)
      parts.add('${children.value} Child${children.value > 1 ? 'ren' : ''}');
    return parts.isNotEmpty ? parts.join(', ') : '0 Guests';
  }

  void changeAdults(int delta) {
    final next = adults.value + delta;
    if (next >= 1 && next <= 10) adults.value = next;
  }

  void changeChildren(int delta) {
    final next = children.value + delta;
    if (next >= 0 && next <= 10) children.value = next;
  }

  PaymentCard? get selectedCard {
    try {
      return paymentMethods.firstWhere((c) => c.id == selectedPaymentId.value);
    } catch (_) {
      return paymentMethods.isNotEmpty ? paymentMethods.first : null;
    }
  }

  @override
  void onInit() {
    super.onInit();
    hotel = Get.arguments as HotelEntity;
  }

  void selectPayment(String cardId) {
    selectedPaymentId.value = cardId;
  }
}
