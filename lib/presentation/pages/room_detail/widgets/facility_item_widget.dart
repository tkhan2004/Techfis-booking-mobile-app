import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

/// Model đại diện cho một facility item
class FacilityItem {
  final String assetPath;
  final String label;

  const FacilityItem({required this.assetPath, required this.label});
}

/// 4 facilities đúng theo Figma design
const List<FacilityItem> roomFacilities = [
  FacilityItem(
    assetPath: 'assets/icons/facilities/facility_pool.svg',
    label: 'Infinity Pool',
  ),
  FacilityItem(
    assetPath: 'assets/icons/facilities/facility_sunset.svg',
    label: 'Sunset view',
  ),
  FacilityItem(
    assetPath: 'assets/icons/facilities/facility_gym.svg',
    label: 'Gym center',
  ),
  FacilityItem(
    assetPath: 'assets/icons/facilities/facility_workstation.svg',
    label: 'Work station',
  ),
];

/// Widget hiển thị một facility item: icon tròn nền primary + label bên dưới
class FacilityItemWidget extends StatelessWidget {
  final String assetPath;
  final String label;

  const FacilityItemWidget({
    super.key,
    required this.assetPath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          child: Center(
            child: SvgPicture.asset(
              assetPath,
              width: 24,
              height: 24,
              colorFilter: const ColorFilter.mode(
                Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

class FacilitiesRowWidget extends StatelessWidget {
  final List<FacilityItem> facilities;

  const FacilitiesRowWidget({super.key, this.facilities = roomFacilities});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: facilities
          .map(
            (item) => FacilityItemWidget(
              assetPath: item.assetPath,
              label: item.label,
            ),
          )
          .toList(),
    );
  }
}
