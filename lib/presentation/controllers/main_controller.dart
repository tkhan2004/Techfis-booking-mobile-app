import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/presentation/controllers/search_controller.dart';

class MainController extends GetxController {
  final RxInt currentIndex = 0.obs;

  final List<String> pageNames = [
    'Home',
    'Search',
    'Booking',
    'Favourite',
    'Profile',
  ];

  /// Chuyển tab thông thường (từ bottom nav)
  void changeTab(int index) {
    if (currentIndex.value != index) {
      HapticFeedback.lightImpact();
      currentIndex.value = index;
    }
  }

  /// Switch sang Search tab + auto-filter theo category
  /// Gọi từ HomePage khi user tap "See all"
  void switchToSearch(String? category) {
    changeTab(1); // Search = index 1
    Future.delayed(const Duration(milliseconds: 50), () {
      try {
        Get.find<HotelSearchController>().setCategory(category);
      } catch (_) {}
    });
  }

  bool isCurrentTab(int index) => currentIndex.value == index;

  @override
  void onInit() => super.onInit();
}
