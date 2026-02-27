enum BookingStatus { upcoming, pending, completed, cancelled }

class BookingItem {
  final String id;
  final String hotelName;
  final String dateRange;
  final double price;
  final String image;
  final BookingStatus status;

  BookingItem({
    required this.id,
    required this.hotelName,
    required this.dateRange,
    required this.price,
    required this.image,
    required this.status,
  });
}
