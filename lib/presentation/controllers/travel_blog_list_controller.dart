import 'package:get/get.dart';
import 'package:hotel_booking/models/hotel_model.dart';
import 'package:hotel_booking/presentation/controllers/home_page_controller.dart';
import 'package:hotel_booking/domain/entities/travel_blog_category.dart';

class TravelBlogListController extends GetxController {
  final blogList = <HotelModel>[].obs;
  final activeCategory = Rx<String?>(TravelBlogCategory.all);

  @override
  void onInit() {
    super.onInit();
    if (Get.isRegistered<HomePageController>()) {
      blogList.assignAll(Get.find<HomePageController>().popularHotelList);
    }
  }

  void setCategory(String category) {
    activeCategory.value = category;
  }
}
