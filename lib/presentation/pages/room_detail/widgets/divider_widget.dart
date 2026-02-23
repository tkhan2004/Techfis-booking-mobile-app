import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildDivider() {
  return Container(
    height: 1, // Độ cao của thanh gạch
    width: Get.width, // Độ dày
    margin: const EdgeInsets.symmetric(
      horizontal: 0,
      vertical: 16,
    ), // Khoảng cách 2 bên
    color: Colors.grey[300], // Màu sắc thanh gạch
  );
}
