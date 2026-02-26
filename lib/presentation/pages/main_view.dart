import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/presentation/controllers/main_controller.dart';
import 'package:hotel_booking/presentation/pages/home_page/home_page.dart';
import 'package:hotel_booking/presentation/pages/profile/profile_page.dart';
import 'package:hotel_booking/presentation/pages/search/search_page.dart';
import 'package:hotel_booking/presentation/pages/favorite/favorite_page.dart';
import 'package:hotel_booking/utils/constants/app_color.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/carbon.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      HomePage(),
      const SearchPage(),
      const Center(child: Text("Booking Page", style: TextStyle(fontSize: 24))),
      const FavoritePage(),
      const ProfilePage(),
    ];

    return Scaffold(
      extendBody: true,
      body: Obx(
        () => AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          switchInCurve: Curves.easeInOut,
          switchOutCurve: Curves.easeInOut,
          child: pages[controller.currentIndex.value],
        ),
      ),
      bottomNavigationBar: _buildBottomNav(),
    );
  }

  Widget _buildBottomNav() {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.bottomNav,
        borderRadius: BorderRadius.circular(60),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 20,
            offset: const Offset(0, 10),
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final itemWidth = constraints.maxWidth / 5; // 5 items

            return Stack(
              children: [
                // Layer 1: Sliding Circle Indicator (Vòng tròn trượt)
                Obx(
                  () => AnimatedPositioned(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOutCubic,
                    left: controller.currentIndex.value * itemWidth,
                    top: 0,
                    bottom: 0,
                    width: itemWidth,
                    child: Center(
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          color: AppColors.secondary,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.secondary,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    _buildNavItem(Iconify(Ri.home_5_line, size: 24), "Home", 0),
                    _buildNavItem(
                      Iconify(MaterialSymbols.search_rounded, size: 24),
                      "Search",
                      1,
                    ),
                    _buildNavItem(
                      Iconify(Carbon.ticket, size: 24),
                      "Booking",
                      2,
                    ),
                    _buildNavItem(Iconify(Ph.heart, size: 24), "Favourite", 3),
                    _buildNavItem(Iconify(Ph.user, size: 24), "Profile", 4),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildNavItem(Widget icon, String label, int index) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => controller.changeTab(index),
          splashColor: Colors.white.withValues(alpha: 0.2),
          highlightColor: Colors.transparent,
          borderRadius: BorderRadius.circular(30),
          child: SizedBox(
            height: 70,
            child: Center(
              child: Obx(() {
                final isSelected = controller.isCurrentTab(index);

                return AnimatedScale(
                  scale: isSelected ? 1.0 : 0.9,
                  duration: const Duration(milliseconds: 200),
                  child: SizedBox(width: 28, height: 28, child: icon),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
