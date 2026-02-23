import 'package:flutter/material.dart';

class FavoriteButton extends StatelessWidget {
  final bool isFavorite;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final double iconSize;

  const FavoriteButton({
    super.key,
    required this.isFavorite,
    this.onTap,
    this.backgroundColor = Colors.white,
    this.iconSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: iconSize + 16,
        height: iconSize + 16,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          size: iconSize,
          color: isFavorite ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}
