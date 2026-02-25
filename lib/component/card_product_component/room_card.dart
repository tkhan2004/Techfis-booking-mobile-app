import 'package:flutter/material.dart';
import 'package:hotel_booking/component/button_component/favorite_button.dart';

class RoomCard extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final String price;
  final String rating;
  final VoidCallback? onTap;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;
  const RoomCard({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.price,
    required this.rating,
    this.onTap,
    this.isFavorite = false,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 224,
        width: 212, // Chiều rộng Card để lộ một phần card tiếp theo
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey.shade200, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(24),
                  ),
                  child: Image.network(
                    image,
                    height: 112,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => Container(
                      height: 120,
                      color: Colors.grey[300],
                      child: const Icon(Icons.image, color: Colors.grey),
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: 0,
                  bottom: 64,
                  child: FavoriteButton(
                    isFavorite: isFavorite,
                    onTap: onFavoriteTap,
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16, // Giảm font size
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2), // Giảm spacing
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 12,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          location,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8), // Giảm spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: price + " VNĐ",
                          style: TextStyle(
                            fontSize: 16, // Giảm font size
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          children: [
                            TextSpan(
                              text: "/night",
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Rating
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 16,
                          ),
                          const SizedBox(width: 2),
                          Text(
                            rating,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
