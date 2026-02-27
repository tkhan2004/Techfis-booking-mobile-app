import 'package:flutter/material.dart';

class InteractiveStarRating extends StatelessWidget {
  final int maxRating;
  final int currentRating;
  final ValueChanged<int> onRatingChanged;
  final double starSize;
  final Color filledColor;
  final Color emptyColor;

  const InteractiveStarRating({
    super.key,
    this.maxRating = 5,
    required this.currentRating,
    required this.onRatingChanged,
    this.starSize = 36.0,
    this.filledColor = Colors.orange,
    this.emptyColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(maxRating, (index) {
        final starValue = index + 1;
        return GestureDetector(
          onTap: () => onRatingChanged(starValue),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Icon(
              Icons.star_rounded,
              color: starValue <= currentRating ? filledColor : emptyColor,
              size: starSize,
            ),
          ),
        );
      }),
    );
  }
}
