import 'package:get/get.dart';

class NotificationItem {
  final String title;
  final String description;
  final String time;
  final bool isRead;

  NotificationItem({
    required this.title,
    required this.description,
    required this.time,
    this.isRead = false,
  });
}

class NotificationsController extends GetxController {
  final notificationsToday = <NotificationItem>[].obs;
  final notificationsEarlier = <NotificationItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadMockData();
  }

  void _loadMockData() {
    // Để test empty state, bạn có thể comment hết các add() này lại
    notificationsToday.addAll([
      NotificationItem(
        title: "Booking confirmed",
        description:
            "Located in Vung Tau, less than 1 km from Bai Sau Beach Seaview Apartment - Free Pool & Near Beach offers accommodation with an outdoor swimming pool, private parking, a fitness center and a garden.",
        time: "21h ago",
      ),
      NotificationItem(
        title: "Booking confirmed",
        description:
            "Located in Vung Tau, less than 1 km from Bai Sau Beach Seaview Apartment - Free Pool & Near Beach offers accommodation with an outdoor swimming pool, private parking, a fitness center and a garden.",
        time: "21h ago",
      ),
    ]);

    notificationsEarlier.addAll([
      NotificationItem(
        title: "Booking confirmed",
        description:
            "Located in Vung Tau, less than 1 km from Bai Sau Beach Seaview Apartment - Free Pool & Near Beach offers accommodation with an outdoor swimming pool, private parking, a fitness center and a garden.",
        time: "21h ago",
      ),
      NotificationItem(
        title: "Booking confirmed",
        description:
            "Located in Vung Tau, less than 1 km from Bai Sau Beach Seaview Apartment - Free Pool & Near Beach offers accommodation with an outdoor swimming pool, private parking, a fitness center and a garden.",
        time: "21h ago",
      ),
      NotificationItem(
        title: "Booking confirmed",
        description:
            "Located in Vung Tau, less than 1 km from Bai Sau Beach Seaview Apartment - Free Pool & Near Beach offers accommodation with an outdoor swimming pool, private parking, a fitness center and a garden.",
        time: "21h ago",
      ),
    ]);
  }

  bool get isEmpty =>
      notificationsToday.isEmpty && notificationsEarlier.isEmpty;

  void markAllAsRead() {
    // Thực hiện logic mark all as read
    // Hiện tại là mock nên chỉ cần print
    print("Marked all as read");
  }
}
