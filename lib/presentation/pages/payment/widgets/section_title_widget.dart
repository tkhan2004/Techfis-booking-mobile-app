import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      ),
    );
  }
}
