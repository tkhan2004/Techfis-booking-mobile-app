import 'package:flutter/material.dart';

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
