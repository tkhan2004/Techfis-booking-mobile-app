import 'package:get/get.dart';
import 'package:hotel_booking/presentation/controllers/room_detail_controller.dart';

class RoomDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RoomDetailController());
  }
}
