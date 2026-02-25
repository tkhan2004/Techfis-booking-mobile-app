import 'package:flutter/material.dart';
import 'package:hotel_booking/presentation/pages/filter/widgets/filter_section_header.dart';

class PriceRangeFilter extends StatefulWidget {
  @override
  _PriceRangeFilterState createState() => _PriceRangeFilterState();
}

class _PriceRangeFilterState extends State<PriceRangeFilter> {
  RangeValues _currentRangeValues = const RangeValues(1500000, 3500000);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Price per night",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        RangeSlider(
          values: _currentRangeValues,
          min: 0,
          max: 5000000,
          divisions: 50,
          activeColor: const Color(0xFFB4D333),
          inactiveColor: Colors.grey[300],
          labels: RangeLabels(
            _currentRangeValues.start.round().toString(),
            _currentRangeValues.end.round().toString(),
          ),
          onChanged: (RangeValues values) {
            setState(() => _currentRangeValues = values);
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "${_currentRangeValues.start.toInt()}",
              style: const TextStyle(
                color: Color(0xFF5D8A2E),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "${_currentRangeValues.end.toInt()}",
              style: const TextStyle(
                color: Color(0xFF5D8A2E),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
