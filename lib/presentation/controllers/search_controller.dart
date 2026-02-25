import 'package:get/get.dart';
import 'package:hotel_booking/data/datasources/mock_room_service.dart';
import 'package:hotel_booking/data/repositories/room_repository.dart';
import 'package:hotel_booking/models/hotel_model.dart';

/// Các category filter — dùng String để dễ extend
class SearchCategory {
  static const String all = 'all';
  static const String popular = 'popular';
  static const String luxury = 'luxury';
  static const String destination = 'destination';
  static const String promotion = 'promotion';

  static const List<String> values = [
    all,
    popular,
    luxury,
    destination,
    promotion,
  ];

  static String label(String cat) {
    switch (cat) {
      case popular:
        return 'Popular';
      case luxury:
        return 'Luxury';
      case destination:
        return 'Top Destination';
      case promotion:
        return 'Promotion';
      default:
        return 'All';
    }
  }
}

class HotelSearchController extends GetxController {
  final _allHotels = <HotelModel>[].obs;
  final searchQuery = ''.obs;
  final activeCategory = Rx<String?>(SearchCategory.all);
  final isLoading = true.obs;

  late final RoomRepository _repository;

  @override
  void onInit() {
    super.onInit();
    _repository = RoomRepository(MockRoomService());
    _loadHotels();
  }

  void _loadHotels() {
    isLoading.value = true;
    _repository.getListHotel().then((hotels) {
      _allHotels.assignAll(hotels.map((e) => HotelModel.fromEntity(e)));
      isLoading.value = false;
    });
  }

  /// Được gọi từ MainController.switchToSearch()
  void setCategory(String? category) {
    activeCategory.value = category ?? SearchCategory.all;
    searchQuery.value = ''; // reset search khi filter từ Home
  }

  void onSearch(String query) {
    searchQuery.value = query;
  }

  List<HotelModel> get filteredHotels {
    var list = _allHotels.toList();

    // Filter by category
    switch (activeCategory.value) {
      case SearchCategory.popular:
        list = list.where((h) => h.rating >= 4.0).toList()
          ..sort((a, b) => b.rating.compareTo(a.rating));
        break;
      case SearchCategory.luxury:
        list = list.where((h) => h.price >= 200).toList()
          ..sort((a, b) => b.price.compareTo(a.price));
        break;
      case SearchCategory.destination:
        list = list..sort((a, b) => b.reviews.compareTo(a.reviews));
        break;
      case SearchCategory.promotion:
        list = list.where((h) => h.price < 100).toList()
          ..sort((a, b) => a.price.compareTo(b.price));
        break;
    }

    // Filter by search text
    final q = searchQuery.value.trim().toLowerCase();
    if (q.isNotEmpty) {
      list = list.where((h) {
        return h.name.toLowerCase().contains(q) ||
            h.location.toLowerCase().contains(q);
      }).toList();
    }

    return list;
  }
}
