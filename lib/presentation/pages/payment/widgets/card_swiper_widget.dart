import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class CardSwiper extends StatelessWidget {
  final List<String> listCard;

  CardSwiper({super.key, required this.listCard});

  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return Image.asset(listCard[index], fit: BoxFit.fitHeight, width: 20);
      },
      itemCount: listCard.length,
      viewportFraction: 0.7,
      scale: 0.7, // độ scale 2 bên
    );
  }
}
