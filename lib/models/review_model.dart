import 'dart:ui';

class ReviewModel {
  final String id;
  final String fullName;
  final String image;
  final DateTime date;
  final String content;
  final double rating;
  final VoidCallback? onTap;
  const ReviewModel({
    required this.id,
    required this.fullName,
    required this.image,
    required this.date,
    required this.content,
    required this.rating,
    this.onTap,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['id'] ?? '',
      fullName: json['fullName'] ?? '',
      image: json['image'] ?? '',
      date: json['date'] != null
          ? DateTime.parse(json['date'])
          : DateTime.now(),
      content: json['content'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(),
    );
  }
}
