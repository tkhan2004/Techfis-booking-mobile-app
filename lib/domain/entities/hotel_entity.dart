class HotelEntity {
  final String id;
  final String name;
  final String location;
  final String image;
  final double price;
  final double rating;
  final String reviews;
  final String description;
  final DateTime date;
  final DateTime time;

  HotelEntity({
    required this.id,
    required this.name,
    required this.location,
    required this.image,
    required this.price,
    required this.rating,
    required this.reviews,
    required this.description,
    required this.date,
    required this.time,
  });
}
