import 'package:get/get.dart';
import 'package:hotel_booking/data/datasources/mock_room_service.dart';
import 'package:hotel_booking/data/repositories/room_repository.dart';
import 'package:hotel_booking/models/hotel_model.dart';

class HomePageController extends GetxController {
  var popularHotelList = <HotelModel>[].obs;
  late RoomRepository roomRepository;

  @override
  void onInit() {
    super.onInit();
    roomRepository = RoomRepository(MockRoomService());
    roomRepository.getListHotel().then((hotels) {
      popularHotelList.assignAll(
        hotels.map((e) => HotelModel.fromEntity(e)).toList(),
      );
      print(popularHotelList.first.image);
      print(popularHotelList.length);
      print(popularHotelList.first.price);
    });
  }
}
