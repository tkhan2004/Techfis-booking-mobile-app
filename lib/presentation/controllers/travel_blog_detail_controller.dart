import 'package:get/get.dart';
import 'package:hotel_booking/models/hotel_model.dart';

class TravelBlogDetailController extends GetxController {
  late HotelModel blogData;

  @override
  void onInit() {
    super.onInit();
    // Reusing HotelModel for blog data passing just to quickly mock the content
    // In a real scenario, this would be a BlogModel.
    if (Get.arguments != null && Get.arguments is HotelModel) {
      blogData = Get.arguments as HotelModel;
    } else {
      blogData = HotelModel(
        id: "mock",
        name: "Mock Title",
        location: "Mock Location",
        description: "Mock Description",
        price: 0.0,
        rating: 0.0,
        reviews: "0",
        image: "https://picsum.photos/seed/picsum/800/600",
        date: DateTime.now(),
        time: DateTime.now(),
      );
    }
  }
}
