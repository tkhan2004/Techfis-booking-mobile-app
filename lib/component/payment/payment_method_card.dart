import 'package:flutter/material.dart';
import 'package:hotel_booking/domain/entities/payment_card.dart';

/// Card tái sử dụng cho tất cả loại thanh toán:
/// - Bank card (rectangular icon, expiry, radio)
/// - E-wallet (circle icon, subtitle, radio)
/// - Navigate items (circle icon, arrow >) — không có radio
class PaymentMethodCard extends StatelessWidget {
  final String cardId;
  final String cardNumber;
  final String cardType;
  final String expiry;
  final String subtitle;
  final Color iconColor;
  final PaymentIconType iconType;
  final bool isSelected;
  final bool isNavigate;
  final Function(String)? onSelect;
  final VoidCallback? onNavigate;

  const PaymentMethodCard({
    super.key,
    required this.cardId,
    required this.cardType,
    required this.isSelected,
    this.cardNumber = '',
    this.expiry = '',
    this.subtitle = '',
    this.iconColor = Colors.black,
    this.iconType = PaymentIconType.creditCard,
    this.isNavigate = false,
    this.onSelect,
    this.onNavigate,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isNavigate) {
          onNavigate?.call();
        } else {
          onSelect?.call(cardId);
        }
      },
      child: Container(
        width: double.infinity,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(35),
          border: Border.all(
            color: isSelected && !isNavigate
                ? const Color(0xFFB4D333)
                : Colors.grey.withValues(alpha: 0.3),
            width: isSelected && !isNavigate ? 2 : 1.5,
          ),
        ),
        child: Row(
          children: [
            _buildIcon(),
            const SizedBox(width: 14),
            Expanded(child: _buildInfo()),
            _buildTrailing(),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    switch (iconType) {
      case PaymentIconType.creditCard:
        return Container(
          width: 45,
          height: 35,
          decoration: BoxDecoration(
            color: iconColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(Icons.credit_card, color: Colors.white, size: 20),
        );
      case PaymentIconType.momoWallet:
        return _CircleIcon(
          color: iconColor,
          child: const Text(
            'mo\nmo',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 9,
              fontWeight: FontWeight.w800,
              height: 1.1,
            ),
          ),
        );
      case PaymentIconType.momoLink:
        return _CircleIcon(
          color: iconColor,
          child: const Icon(Icons.link, color: Colors.white, size: 22),
        );
      case PaymentIconType.bankTransfer:
        return _CircleIcon(
          color: iconColor,
          child: const Icon(
            Icons.account_balance,
            color: Colors.white,
            size: 20,
          ),
        );
    }
  }

  Widget _buildInfo() {
    final bool isCard = iconType == PaymentIconType.creditCard;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isCard && cardNumber.isNotEmpty
              ? '••••  ••••  ••••  $cardNumber'
              : cardType,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: isNavigate ? 13 : 15,
            color: isNavigate && iconType == PaymentIconType.momoLink
                ? const Color(0xFFD82D8B)
                : Colors.black,
            letterSpacing: isCard ? 0.5 : 0.3,
          ),
        ),
        if (isCard && expiry.isNotEmpty) ...[
          const SizedBox(height: 2),
          Text(
            'EXPIRES $expiry',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ] else if (!isCard && subtitle.isNotEmpty) ...[
          const SizedBox(height: 2),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 11,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildTrailing() {
    if (isNavigate) {
      return Icon(Icons.chevron_right, color: Colors.grey.shade400, size: 22);
    }
    return _RadioDot(isSelected: isSelected);
  }
}

class _CircleIcon extends StatelessWidget {
  final Color color;
  final Widget child;
  const _CircleIcon({required this.color, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Center(child: child),
    );
  }
}

class _RadioDot extends StatelessWidget {
  final bool isSelected;
  const _RadioDot({required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected
              ? const Color(0xFFB4D333)
              : Colors.grey.withValues(alpha: 0.5),
          width: 2,
        ),
      ),
      child: isSelected
          ? Center(
              child: Container(
                width: 12,
                height: 12,
                decoration: const BoxDecoration(
                  color: Color(0xFFB4D333),
                  shape: BoxShape.circle,
                ),
              ),
            )
          : null,
    );
  }
}
