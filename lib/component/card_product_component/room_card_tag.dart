import 'package:flutter/material.dart';
import 'package:hotel_booking/component/rating_component/star_ratting_widget.dart';

class RoomCardConfirm extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String price;
  final double rating;
  final VoidCallback? onTap;

  const RoomCardConfirm({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 360,
        height: 100,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.grey.withValues(alpha: 0.2),
          ), // Thêm viền nhẹ
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.03),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                image,
                width: 120,
                height: 92,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 120,
                  height: 92,
                  color: Colors.grey[200],
                  child: const Icon(Icons.hotel),
                ),
              ),
            ),

            const SizedBox(width: 12),

            Expanded(
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 14,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 2),
                          Expanded(
                            child: Text(
                              location,
                              style: const TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          text: price + " VNĐ",
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                          children: const [
                            TextSpan(
                              text: "/night",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  PositionAtTopRight(child: BuildStars(rating: rating)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Widget phụ trợ để căn chỉnh Rating
class PositionAtTopRight extends StatelessWidget {
  final Widget child;
  const PositionAtTopRight({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: child,
      heightFactor: 0.5,
    );
  }
}
