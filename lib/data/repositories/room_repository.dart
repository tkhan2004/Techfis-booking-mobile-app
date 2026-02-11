import 'package:hotel_booking/data/datasources/mock_room_service.dart';
import 'package:hotel_booking/domain/entities/hotel_entity.dart';

class RoomRepository {
  final MockRoomService mockRoomService;

  RoomRepository(this.mockRoomService);

  Future<List<HotelEntity>> getListHotel() async {
    return mockRoomService.generateList(10);
  }
}
