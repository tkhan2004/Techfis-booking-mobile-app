import 'package:flutter/material.dart';

class FilterChipGroup extends StatefulWidget {
  final List<String> options;
  final bool isMultiple;

  const FilterChipGroup({
    super.key,
    required this.options,
    this.isMultiple = false,
  });

  @override
  _FilterChipGroupState createState() => _FilterChipGroupState();
}

class _FilterChipGroupState extends State<FilterChipGroup> {
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: widget.options.map((option) {
        bool isSelected = selectedOptions.contains(option);
        return GestureDetector(
          onTap: () {
            setState(() {
              if (widget.isMultiple) {
                isSelected
                    ? selectedOptions.remove(option)
                    : selectedOptions.add(option);
              } else {
                selectedOptions = [option];
              }
            });
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFFB4D333)
                  : const Color(0xFFF8FBE9),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isSelected
                    ? const Color(0xFFB4D333)
                    : Colors.transparent,
              ),
            ),
            child: Text(
              option,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
