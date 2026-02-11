import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  // Observable state
  final RxInt currentIndex = 0.obs;

  // Danh sách tên pages để debug
  final List<String> pageNames = [
    'Home',
    'Search',
    'Booking',
    'Favourite',
    'Profile',
  ];

  /// Chuyển tab với haptic feedback
  void changeTab(int index) {
    if (currentIndex.value != index) {
      // Haptic feedback
      HapticFeedback.lightImpact();

      // Update state
      currentIndex.value = index;

      // Log để debug (có thể bỏ trong production)
      print('📱 Switched to ${pageNames[index]} tab');
    }
  }

  /// Check xem tab hiện tại có phải là tab được chỉ định không
  bool isCurrentTab(int index) => currentIndex.value == index;

  @override
  void onInit() {
    super.onInit();
    print('🎮 MainController initialized');
  }

  @override
  void onClose() {
    print('🎮 MainController disposed');
    super.onClose();
  }
}
