import 'package:flutter/material.dart';

class LocationSearchWidget extends StatefulWidget {
  const LocationSearchWidget({super.key});

  @override
  State<LocationSearchWidget> createState() => _LocationSearchWidgetState();
}

class _LocationSearchWidgetState extends State<LocationSearchWidget> {
  String? _selectedCity;
  String? _selectedDistrict;
  String? _selectedWard;
  final TextEditingController _streetController = TextEditingController();

  final List<String> _cities = [
    "Hà Nội",
    "Hồ Chí Minh",
    "Đà Nẵng",
    "Nha Trang",
  ];
  final List<String> _districts = [
    "Quận 1",
    "Quận 2",
    "Quận 3",
    "Cầu Giấy",
    "Đống Đa",
  ];
  final List<String> _wards = [
    "Phường 1",
    "Phường 2",
    "Phường Bến Nghé",
    "Phường Dịch Vọng",
  ];

  @override
  void dispose() {
    _streetController.dispose();
    super.dispose();
  }

  Widget _buildDropdown(
    String hint,
    IconData icon,
    String? value,
    List<String> items,
    Function(String?) onChanged,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: value,
          hint: Row(
            children: [
              const SizedBox(width: 16),
              Icon(icon, color: Colors.grey, size: 20),
              const SizedBox(width: 12),
              Text(
                hint,
                style: TextStyle(color: Colors.grey.shade400, fontSize: 14),
              ),
            ],
          ),
          icon: const Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
          ),
          isExpanded: true,
          items: items.map((String val) {
            return DropdownMenuItem<String>(
              value: val,
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Icon(icon, color: const Color(0xFFB4D333), size: 20),
                  const SizedBox(width: 12),
                  Text(val, style: const TextStyle(fontSize: 14)),
                ],
              ),
            );
          }).toList(),
          onChanged: onChanged,
        ),
      ),
    );
  }

  Widget _buildTextField(
    String hint,
    IconData icon,
    TextEditingController controller,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.02),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Icon(icon, color: Colors.grey, size: 20),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 40,
            minHeight: 40,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 0,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Where to?",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _selectedCity = "Hồ Chí Minh";
                  _selectedDistrict = "Quận 1";
                  _selectedWard = "Phường Bến Nghé";
                  _streetController.text = "65 Lê Lợi";
                });
              },
              child: const Row(
                children: [
                  Icon(Icons.my_location, size: 14, color: Color(0xFFB4D333)),
                  SizedBox(width: 4),
                  Text(
                    "Current location",
                    style: TextStyle(
                      color: Color(0xFFB4D333),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // City / Province
        _buildDropdown(
          "Tỉnh / Thành phố",
          Icons.location_city_outlined,
          _selectedCity,
          _cities,
          (val) {
            setState(() {
              _selectedCity = val;
              _selectedDistrict =
                  null; // Reset district and ward when city changes
              _selectedWard = null;
            });
          },
        ),

        // District
        _buildDropdown(
          "Quận / Huyện",
          Icons.map_outlined,
          _selectedDistrict,
          _districts,
          (val) {
            setState(() {
              _selectedDistrict = val;
              _selectedWard = null; // Reset ward when district changes
            });
          },
        ),

        // Ward
        _buildDropdown(
          "Phường / Xã",
          Icons.holiday_village_outlined,
          _selectedWard,
          _wards,
          (val) {
            setState(() {
              _selectedWard = val;
            });
          },
        ),

        // Street address
        _buildTextField(
          "Số nhà, Tên đường (không bắt buộc)",
          Icons.edit_road_outlined,
          _streetController,
        ),
      ],
    );
  }
}
