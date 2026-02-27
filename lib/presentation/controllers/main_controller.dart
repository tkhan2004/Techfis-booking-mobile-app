import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/presentation/controllers/search_controller.dart';
import 'package:hotel_booking/domain/entities/search_category.dart';

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

  void switchToSearch(String? category) {
    if (category != null) {
      Get.find<HotelSearchController>().setCategory(category);
    }
    Get.toNamed('/search-result');
  }

  /// Tìm kiếm theo địa điểm (từ Top Destination card)
  void searchByLocation(String location) {
    final searchController = Get.find<HotelSearchController>();
    searchController.setCategory(SearchCategory.all);
    searchController.onSearch(location);
    Get.toNamed('/search-result');
  }

  bool isCurrentTab(int index) => currentIndex.value == index;

  @override
  void onInit() => super.onInit();
}
