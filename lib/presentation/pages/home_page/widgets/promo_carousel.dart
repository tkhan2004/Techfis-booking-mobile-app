import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class PromoCarousel extends StatelessWidget {
  const PromoCarousel({super.key});

  // Danh sách các promotion
  final List<PromoItem> _promoItems = const [
    PromoItem(
      imagePath: 'assets/images/promo_banner.png',
      title: 'GET YOUR 20% CASHBACK',
      subtitle: '*Expired 25 Aug 2022',
    ),
    PromoItem(
      imagePath: 'assets/images/promo_banner.png',
      title: 'SPECIAL WEEKEND OFFER',
      subtitle: '*Limited time only',
    ),
    PromoItem(
      imagePath: 'assets/images/promo_banner.png',
      title: 'BOOK NOW & SAVE',
      subtitle: '*Valid until end of month',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // Tính toán height dựa trên width của màn hình
    // Aspect ratio từ Figma: 379:110 ≈ 3.445
    final screenWidth = MediaQuery.of(context).size.width;
    final carouselWidth = screenWidth - 32; // Trừ padding 16 mỗi bên
    final carouselHeight = carouselWidth / 3.445; // Giữ đúng tỷ lệ Figma

    return SizedBox(
      height: carouselHeight,
      child: Swiper(
        itemCount: _promoItems.length,
        autoplay: true, // Tự động chạy
        autoplayDelay: 3000, // 3 giây
        duration: 800, // Animation duration
        // Hiệu ứng: Có nhiều options
        // SwiperLayout.STACK - Xếp chồng 3D
        // SwiperLayout.TINDER - Giống Tinder
        // layout: SwiperLayout.STACK,
        // SwiperLayout.CUSTOM - Custom

        // Viewpoint fraction - hiển thị một phần item bên cạnh
        viewportFraction: 1.0,
        scale: 1.0, // Item bên cạnh nhỏ hơn 15%
        // Pagination - chấm tròn indicator
        pagination: SwiperPagination(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 8),
          builder: DotSwiperPaginationBuilder(
            size: 6,
            activeSize: 8,
            color: Colors.white.withOpacity(0.5),
            activeColor: Colors.white,
            space: 4,
          ),
        ),

        // Item builder
        itemBuilder: (context, index) {
          return _buildPromoCard(index);
        },

        // Callback khi tap
        onTap: (index) {
          debugPrint('Tapped on promo: ${_promoItems[index].title}');
        },
      ),
    );
  }

  Widget _buildPromoCard(int index) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(_promoItems[index].imagePath, fit: BoxFit.cover),
      ),
    );
  }
}

// Model cho promotion item
class PromoItem {
  final String imagePath;
  final String title;
  final String subtitle;

  const PromoItem({
    required this.imagePath,
    required this.title,
    required this.subtitle,
  });
}
