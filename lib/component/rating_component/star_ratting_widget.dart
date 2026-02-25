import 'package:flutter/material.dart';

class BuildStars extends StatelessWidget {
  const BuildStars({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < rating.floor()
              ? Icons.star
              : (index < rating ? Icons.star_half : Icons.star_border),
          color: const Color(0xFFFEC62E),
          size: 8,
        );
      }),
    );
  }
}
