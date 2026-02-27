import 'package:get/get.dart';
import 'package:hotel_booking/domain/entities/booking_item.dart';

class BookingDetailController extends GetxController {
  late final BookingItem bookingItem;

  @override
  void onInit() {
    super.onInit();
    bookingItem = Get.arguments as BookingItem;
  }
}
