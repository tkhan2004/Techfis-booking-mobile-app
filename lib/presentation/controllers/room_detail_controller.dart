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
    hotelEntity = Get.arguments as HotelEntity;
    print(hotelEntity.name);
    _loadSimilarRooms();
  }

  void _loadSimilarRooms() {
    hotelList.assignAll(_mockRoomService.generateList(5));
  }
}
