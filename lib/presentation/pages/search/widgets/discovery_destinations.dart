import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:hotel_booking/component/card_product_component/destination_card.dart';
import 'package:hotel_booking/presentation/pages/search/widgets/search_section_header.dart';
import 'package:hotel_booking/routes/app_routes.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class DiscoveryDestinations extends StatelessWidget {
  const DiscoveryDestinations({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        SizedBox(
          height: 220,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              DestinationCard(
                location: "Ha Noi",
                subLocation: "101, Tran Hung Dao",
                image:
                    "https://images.unsplash.com/photo-1599708153386-62fd03eaaf1a?h=600&auto=format&fit=crop",
              ),
              DestinationCard(
                location: "An Giang",
                subLocation: "101, Tran Hung Dao",
                image:
                    "https://images.unsplash.com/photo-1559599189-bc8ceb3240e3?h=600&auto=format&fit=crop",
              ),
              DestinationCard(
                location: "Da Lat",
                subLocation: "101, Tran Hung Dao",
                image:
                    "https://images.unsplash.com/photo-1583417319070-4a69db38a482?h=600&auto=format&fit=crop",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
