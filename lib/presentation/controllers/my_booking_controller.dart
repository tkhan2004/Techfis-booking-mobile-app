import 'package:get/get.dart';
import 'package:hotel_booking/domain/entities/booking_item.dart';

class MyBookingController extends GetxController {
  final tabs = ['Upcoming', 'Pending', 'Completed', 'Cancelled'];
  var currentTabIndex = 0.obs;

  var bookings = <BookingItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    _loadMockData();
  }

  void _loadMockData() {
    bookings.assignAll([
      BookingItem(
        id: '#BK-11111',
        hotelName: 'Vung Tau Luxury Hotel',
        dateRange: 'Jun 01 - Jun 03, 2026',
        price: 500000,
        image:
            'https://images.unsplash.com/photo-1551882547-ff40c0d51259?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
        status: BookingStatus.upcoming,
      ),
      BookingItem(
        id: '#BK-23111',
        hotelName: 'Vung Tau Luxury Hotel',
        dateRange: 'Jun 01 - Jun 03, 2026',
        price: 500000,
        image:
            'https://images.unsplash.com/photo-1566073771259-6a8506099945?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
        status: BookingStatus.pending,
      ),
      BookingItem(
        id: '#BK-23112',
        hotelName: 'Vung Tau Luxury Hotel',
        dateRange: 'Jun 01 - Jun 03, 2026',
        price: 500000,
        image:
            'https://images.unsplash.com/photo-1517840901100-8179e982acb7?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
        status: BookingStatus.pending,
      ),
      BookingItem(
        id: '#BK-11112',
        hotelName: 'Da Lat Resort',
        dateRange: 'Aug 10 - Aug 12, 2026',
        price: 1500000,
        image:
            'https://images.unsplash.com/photo-1571003123894-1f0594d2b5d9?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
        status: BookingStatus.completed,
      ),
      BookingItem(
        id: '#BK-11113',
        hotelName: 'Phu Quoc Villa',
        dateRange: 'Dec 01 - Dec 05, 2026',
        price: 2500000,
        image:
            'https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
        status: BookingStatus.cancelled,
      ),
    ]);
  }

  void setTab(int index) {
    currentTabIndex.value = index;
  }

  List<BookingItem> get filteredBookings {
    BookingStatus targetStatus;
    switch (currentTabIndex.value) {
      case 0:
        targetStatus = BookingStatus.upcoming;
        break;
      case 1:
        targetStatus = BookingStatus.pending;
        break;
      case 2:
        targetStatus = BookingStatus.completed;
        break;
      case 3:
      default:
        targetStatus = BookingStatus.cancelled;
        break;
    }
    return bookings.where((b) => b.status == targetStatus).toList();
  }

  void onActionPressed(BookingItem item) {
    if (item.status == BookingStatus.pending) {
      // payment flow
    } else if (item.status == BookingStatus.upcoming) {
      // view ticket
    }
  }
}
