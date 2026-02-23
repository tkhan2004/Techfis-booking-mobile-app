import 'package:hotel_booking/domain/entities/hotel_entity.dart';

class HotelModel extends HotelEntity {
  HotelModel({
    required super.id,
    required super.name,
    required super.location,
    required super.image,
    required super.price,
    required super.rating,
    required super.reviews,
    required super.description,
    required super.date,
    required super.time,
  });

  factory HotelModel.fromJson(Map<String, dynamic> json) {
    return HotelModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      image: json['image'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      rating: (json['rating'] ?? 0).toDouble(),
      reviews: json['reviews'] ?? 0,
      description: json['description'] ?? '',
      date: json['date'] != null
          ? DateTime.parse(json['date'])
          : DateTime.now(),
      time: json['time'] != null
          ? DateTime.parse(json['time'])
          : DateTime.now(),
    );
  }

  factory HotelModel.fromEntity(HotelEntity entity) {
    return HotelModel(
      id: entity.id,
      name: entity.name,
      location: entity.location,
      image: entity.image,
      price: entity.price,
      rating: entity.rating,
      reviews: entity.reviews,
      description: entity.description,
      date: entity.date,
      time: entity.time,
    );
  }
}
