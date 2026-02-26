import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/appbar_component/custom_app_bar.dart';
import 'package:hotel_booking/component/helper_component/app_scaffold.dart';
import 'package:hotel_booking/presentation/controllers/search_controller.dart';
import 'package:hotel_booking/presentation/pages/search/widgets/discovery_destinations.dart';
import 'package:hotel_booking/presentation/pages/search/widgets/discovery_popular_category.dart';
import 'package:hotel_booking/presentation/pages/search/widgets/discovery_recent_searches.dart';
import 'package:hotel_booking/presentation/pages/search/widgets/discovery_search_bar.dart';
import 'package:hotel_booking/presentation/pages/search/widgets/search_header_widget.dart';
import 'package:hotel_booking/presentation/pages/search/widgets/search_section_header.dart';
import 'package:hotel_booking/routes/app_routes.dart';

class SearchPage extends GetView<HotelSearchController> {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: 'Search Hotels', isBack: false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DiscoverySearchBar(),
              SizedBox(height: 8),
              DiscoveryRecentSearches(),
              SizedBox(height: 8),
              SearchSectionHeader(
                title: "Popular Category",
                text: "View all",
                onSeeAllPressed: () {
                  Get.toNamed(AppRoutes.SEARCH_RESULT);
                },
              ),
              DiscoveryPopularCategory(),
              SizedBox(height: 8),
              SearchSectionHeader(
                title: "Beautiful Destinations",
                text: "View all",
                onSeeAllPressed: () {
                  Get.toNamed(AppRoutes.SEARCH_RESULT);
                },
              ),
              DiscoveryDestinations(),
              SizedBox(height: 100), // Padding cho Bottom Nav
            ],
          ),
        ),
      ),
    );
  }
}
