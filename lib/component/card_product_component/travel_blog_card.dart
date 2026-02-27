import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TravelBlogCard extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final DateTime publishedAt;
  final VoidCallback? onTap;
  final double? width;
  final EdgeInsetsGeometry? margin;

  const TravelBlogCard({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
    required this.publishedAt,
    this.onTap,
    this.width,
    this.margin,
  });

  /// Tính "đăng được bao lâu" so với thời điểm hiện tại
  String get _timeAgo {
    final diff = DateTime.now().difference(publishedAt);

    if (diff.inSeconds < 60) return 'Vừa đăng';
    if (diff.inMinutes < 60) return '${diff.inMinutes} phút trước';
    if (diff.inHours < 24) return '${diff.inHours} giờ trước';
    if (diff.inDays < 7) return '${diff.inDays} ngày trước';
    if (diff.inDays < 30) return '${(diff.inDays / 7).floor()} tuần trước';
    if (diff.inDays < 365) return '${(diff.inDays / 30).floor()} tháng trước';
    return '${(diff.inDays / 365).floor()} năm trước';
  }

  /// Ngày đăng dạng "23 Feb 2026"
  String get _formattedDate => DateFormat('dd MMM yyyy').format(publishedAt);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 210,
        width: width ?? 320,
        margin: margin ?? const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey.shade200, width: 1),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh thumbnail
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
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF0F7E6),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "ADVENTURE",
                              style: const TextStyle(
                                color: Color(0xFF5D8A2E),
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          _buildDivider(),
                          const SizedBox(width: 4),
                          Container(
                            child: Text(
                              _timeAgo,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 11,
                              ),
                            ),
                          ),
                          _buildDivider(),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.calendar_today_outlined,
                            size: 11,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _formattedDate,
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16, // Giảm font size
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          subTitle,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDivider() {
  return Container(
    height: 10, // Độ cao của thanh gạch
    width: 1, // Độ dày
    margin: const EdgeInsets.symmetric(horizontal: 8), // Khoảng cách 2 bên
    color: Colors.grey[300], // Màu sắc thanh gạch
  );
}
