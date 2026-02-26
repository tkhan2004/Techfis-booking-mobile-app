import 'package:get/get.dart';
import 'package:hotel_booking/data/datasources/mock_room_service.dart';
import 'package:hotel_booking/domain/entities/hotel_entity.dart';

class FavoriteController extends GetxController {
  final _mockRoomService = MockRoomService();
  var favoriteHotels = <HotelEntity>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadFavorites();
  }

  void _loadFavorites() {
    // Generate some mock hotels and pretend they are favorites
    favoriteHotels.assignAll(_mockRoomService.generateList(6));
  }

  void onSearchChanged(String query) {
    searchQuery.value = query;
    // In a real app, you would filter the favoriteHotels list here.
  }

  void toggleFavorite(HotelEntity hotel) {
    favoriteHotels.remove(hotel);
    // Remove from mock favorites
  }
}
