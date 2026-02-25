import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/pages/booking/widgets/counter_button_widget.dart';

class GuestRowWidget extends StatelessWidget {
  final String label;
  final String sublabel;
  final int value;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  const GuestRowWidget({
    super.key,
    required this.label,
    required this.sublabel,
    required this.value,
    required this.onMinus,
    required this.onPlus,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                sublabel,
                style: TextStyle(fontSize: 13, color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
        Row(
          children: [
            CounterButtonWidget(
              icon: Icons.remove,
              onTap: onMinus,
              enabled: value > 0,
            ),
            SizedBox(
              width: 40,
              child: Text(
                '$value',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            CounterButtonWidget(
              icon: Icons.add,
              onTap: onPlus,
              enabled: value < 10,
            ),
          ],
        ),
      ],
    );
  }
}
