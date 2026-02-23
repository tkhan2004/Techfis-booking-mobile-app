import 'package:flutter/material.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class ButtonRoomDetailWidget extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ButtonRoomDetailWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 296,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            foregroundColor: const Color.fromARGB(255, 42, 27, 27),

            side: const BorderSide(color: Colors.black, width: 1),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.symmetric(vertical: 16),
            elevation: 0,
          ),
          child: Text(
            text,
            style: Theme.of(
              context,
            ).textTheme.labelLarge?.copyWith(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
