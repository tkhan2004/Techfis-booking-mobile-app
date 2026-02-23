import 'package:flutter/material.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';

Widget buildPriceCard() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: const Color(0xFFF8FBE9),
      borderRadius: BorderRadius.circular(16),
    ),
    child: Row(
      children: [
        Expanded(
          child: RichText(
            text: const TextSpan(
              text: "500.000 VND",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: "/night",
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 160,
          child: ButtonText(text: "Check Availability", onPressed: () {}),
        ),
      ],
    ),
  );
}
