import 'package:flutter/material.dart';
import 'facility_option_widget.dart'; // Import widget lẻ bạn đã tạo

class FacilitiesOptionRow extends StatefulWidget {
  const FacilitiesOptionRow({super.key});

  @override
  State<FacilitiesOptionRow> createState() => _FacilitiesOptionRowState();
}

class _FacilitiesOptionRowState extends State<FacilitiesOptionRow> {
  final List<String> _selectedItems = [];

  void _toggle(String label) {
    setState(() {
      if (_selectedItems.contains(label)) {
        _selectedItems.remove(label);
      } else {
        _selectedItems.add(label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildExpandedItem('assets/icons/facilities/facility_pool.svg', 'Pool'),
        _buildExpandedItem(
          'assets/icons/facilities/facility_sunset.svg',
          'Sunset',
        ),
        _buildExpandedItem('assets/icons/facilities/facility_gym.svg', 'Gym'),
        _buildExpandedItem(
          'assets/icons/facilities/facility_workstation.svg',
          'Work',
        ),
      ],
    );
  }

  // Bọc Expanded bên ngoài để mỗi item chiếm 1/4 chiều ngang
  Widget _buildExpandedItem(String path, String label) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 4,
        ), // Khoảng cách nhỏ giữa các nút
        child: FacilityOptionWidget(
          assetPath: path,
          label: label,
          isSelected: _selectedItems.contains(label),
          onTap: () => _toggle(label),
        ),
      ),
    );
  }
}
