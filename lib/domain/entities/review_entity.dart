import 'dart:ui';

class ReviewEntity {
  final String id;
  final String fullName;
  final String image;
  final DateTime date;
  final String content;
  final double rating;
  final VoidCallback? onTap;
  const ReviewEntity({
    required this.id,
    required this.fullName,
    required this.image,
    required this.date,
    required this.content,
    required this.rating,
    this.onTap,
  });
}
