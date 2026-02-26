import 'package:get/get.dart';
import 'package:hotel_booking/data/datasources/mock_room_service.dart';
import 'package:hotel_booking/domain/entities/hotel_entity.dart';

class RoomDetailController extends GetxController {
  var hotelList = <HotelEntity>[].obs;
  late HotelEntity hotelEntity;
  final isFavorite = false.obs;

  final _mockRoomService = MockRoomService();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null && Get.arguments is HotelEntity) {
      hotelEntity = Get.arguments as HotelEntity;
    }
    print(hotelEntity.name);
    _loadSimilarRooms();
  }

  void _loadSimilarRooms() {
    hotelList.assignAll(_mockRoomService.generateList(5));
  }

  // --- REVIEW STATES ---
  final overallRating = 0.obs;
  final cleanlinessRating = 0.obs;
  final serviceRating = 0.obs;
  final locationRating = 0.obs;

  final reviewText = ''.obs;

  // Mock list ảnh review test
  final uploadedPhotos = <String>[
    'assets/images/room_card_image.png',
    'assets/images/room_card_image.png',
  ].obs;

  void submitReview() {
    print("Submit Review Clicked!");
    Get.snackbar("Success", "Your review has been submitted successfully");
    // Quay về màn detail
    Get.back();
  }
}
