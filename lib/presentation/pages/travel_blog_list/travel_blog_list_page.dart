import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/appbar_component/custom_app_bar.dart';
import 'package:hotel_booking/component/card_product_component/travel_blog_card.dart';
import 'package:hotel_booking/component/input_component/custom_search_bar.dart';
import 'package:hotel_booking/presentation/controllers/travel_blog_list_controller.dart';
import 'package:hotel_booking/routes/app_routes.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';
import 'package:hotel_booking/presentation/pages/travel_blog_list/widgets/filter_chips_widget.dart';

class TravelBlogListPage extends GetView<TravelBlogListController> {
  const TravelBlogListPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TravelBlogListController());
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      appBar: CustomAppBar(title: "Travel Blog", onBack: () => Get.back()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: CustomSearchBar(
                hintText: 'Search blog or key...',
                backgroundColor: Colors.white,
                iconColor: Colors.grey,
                hintColor: Colors.grey,
                hasBorder: true,
                borderColor: AppColors.primary,
              ),
            ),
            const SizedBox(height: 16),
            FilterChipsWidget(controller: controller),
            const SizedBox(height: 16),
            Expanded(
              child: Obx(() {
                if (controller.blogList.isEmpty) {
                  return const Center(child: Text("No blogs available"));
                }
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.blogList.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    final blog = controller.blogList[index];
                    return TravelBlogCard(
                      width: double.infinity,
                      margin: EdgeInsets.zero,
                      image: blog.image,
                      title: blog.name,
                      subTitle: blog.description,
                      publishedAt: blog.date,
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.TRAVEL_BLOG_DETAIL,
                          arguments: blog,
                        );
                      },
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
