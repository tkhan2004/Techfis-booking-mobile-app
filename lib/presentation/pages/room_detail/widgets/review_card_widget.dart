import 'package:flutter/material.dart';
import 'package:hotel_booking/component/rating_component/star_ratting_widget.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class ReviewCardWidget extends StatelessWidget {
  final String image;
  final String fullName;
  final DateTime date;
  final String content;
  final double rating;
  final VoidCallback? onTap;

  const ReviewCardWidget({
    super.key,
    required this.image,
    required this.fullName,
    required this.date,
    required this.content,
    required this.rating,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 244,
        height: 160,
        margin: const EdgeInsets.only(right: 12),
        decoration: BoxDecoration(
          color: AppColors.limeLightest,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: const Color(0xFFDDE8B8), width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.06),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.25),
                          blurRadius: 4,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: image.isNotEmpty
                          ? Image.network(
                              image,
                              fit: BoxFit.cover,
                              errorBuilder: (_, __, ___) =>
                                  _buildDefaultAvatar(fullName),
                            )
                          : _buildDefaultAvatar(fullName),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          fullName,
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: Color(0xFF000000),
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _formatDate(date),
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                            color: Color(0xFF8F8E8E),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Stars
                  BuildStars(rating: rating),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Text(
                  '" $content "',
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
                    color: Color(0xFF8F8E8E),
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDefaultAvatar(String name) {
    return Container(
      color: const Color(0xFFAFCA31),
      child: Center(
        child: Text(
          name.isNotEmpty ? name[0].toUpperCase() : '?',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];
    return '${months[date.month - 1]} ${date.day.toString().padLeft(2, '0')}, ${date.year}';
  }
}
