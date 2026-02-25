import 'package:flutter/material.dart';

class UserInfoCard extends StatelessWidget {
  final String name;
  final String email;
  final String imageUrl;
  final VoidCallback? onMorePressed;

  const UserInfoCard({
    super.key,
    required this.name,
    required this.email,
    required this.imageUrl,
    this.onMorePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 1. Avatar bọc trong ClipRRect để bo góc
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              width: 52,
              height: 52,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 52,
                height: 52,
                color: Colors.grey[200],
                child: const Icon(Icons.person),
              ),
            ),
          ),

          const SizedBox(width: 16),

          // 2. Thông tin User (Dùng Expanded để chiếm phần trống giữa)
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // 3. Nút hành động bên phải
          IconButton(
            onPressed: onMorePressed,
            icon: const Icon(Icons.more_horiz),
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
