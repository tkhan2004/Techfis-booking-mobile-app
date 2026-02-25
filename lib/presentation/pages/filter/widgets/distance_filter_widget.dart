import 'package:flutter/material.dart';

class DistanceFilterWidget extends StatefulWidget {
  const DistanceFilterWidget({super.key});

  @override
  State<DistanceFilterWidget> createState() => _DistanceFilterWidgetState();
}

class _DistanceFilterWidgetState extends State<DistanceFilterWidget> {
  double _currentDistance = 3.0; // Giá trị mặc định là 3km

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Maximum Distance",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),

        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: const Color(0xFFB4D333),
            inactiveTrackColor: Colors.grey[300],
            thumbColor: Colors.white,
            overlayColor: const Color(0xFFB4D333).withValues(alpha: 0.2),
            valueIndicatorColor: const Color(0xFFB4D333),
            thumbShape: const RoundSliderThumbShape(
              enabledThumbRadius: 10,
              elevation: 3,
            ),
          ),
          child: Slider(
            value: _currentDistance,
            min: 1.0,
            max: 5.0,
            divisions: 2, // Chia làm các mốc: 1km, 3km, 5km
            onChanged: (value) {
              setState(() {
                _currentDistance = value;
              });
            },
          ),
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _DistanceLabel(label: "< 1 km"),
              _DistanceLabel(label: "< 3 km"),
              _DistanceLabel(label: "5 km +"),
            ],
          ),
        ),
      ],
    );
  }
}

class _DistanceLabel extends StatelessWidget {
  final String label;
  const _DistanceLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 5, width: 1, color: Colors.black54), // Vạch kẻ nhỏ
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            color: Color(0xFF5D8A2E),
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
