import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/appbar_component/custom_app_bar.dart';
import 'package:hotel_booking/component/helper_component/app_scaffold.dart';
import 'package:hotel_booking/presentation/controllers/search_controller.dart';
import 'package:hotel_booking/presentation/pages/search/widgets/filter_chips_widget.dart';
import 'package:hotel_booking/presentation/pages/search/widgets/search_header_widget.dart';
import 'package:hotel_booking/presentation/pages/search/widgets/search_result_widget.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';

class SearchResultPage extends GetView<HotelSearchController> {
  const SearchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: const CustomAppBar(title: 'Search Results'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchHeaderWidget(controller: controller),
          FilterChipsWidget(controller: controller),
          Expanded(child: SearchResultWidget(controller: controller)),
        ],
      ),
    );
  }
}
