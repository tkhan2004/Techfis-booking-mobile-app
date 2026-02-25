import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/button_component/button_text.dart';
import 'package:hotel_booking/domain/entities/hotel_entity.dart';
import 'package:hotel_booking/routes/app_routes.dart';

/// Bottom price bar tái sử dụng:
/// - [buttonText] : text trên nút, mặc định "Check Availability"
/// - [onPressed]  : action khi ấn nút, mặc định navigate sang BOOKING
Widget buildPriceCard(
  HotelEntity hotel, {
  String buttonText = 'Check Availability',
  VoidCallback? onPressed,
}) {
  return Hero(
    tag: 'price_bar',
    child: Material(
      color: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFF8FBE9),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            // Expanded trong Flutter là một widget dùng để lấp đầy khoảng trống còn lại trên trục chính (chiều ngang của Row hoặc dọc của Column)
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: "${hotel.price.toStringAsFixed(0)} VND",
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  children: const [
                    TextSpan(
                      text: "/night",
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 160,
              child: ButtonText(
                text: buttonText,
                onPressed:
                    onPressed ??
                    () => Get.toNamed(AppRoutes.BOOKING, arguments: hotel),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
