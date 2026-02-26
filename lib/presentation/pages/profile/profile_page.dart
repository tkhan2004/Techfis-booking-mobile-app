import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hotel_booking/component/appbar_component/custom_app_bar.dart';
import 'package:hotel_booking/component/helper_component/app_scaffold.dart';
import 'package:hotel_booking/presentation/pages/profile/widgets/profile_header.dart';
import 'package:hotel_booking/presentation/pages/profile/widgets/profile_menu_section.dart';
import 'package:hotel_booking/presentation/pages/profile/widgets/profile_menu_item.dart';
import 'package:hotel_booking/routes/app_routes.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: "My Profile",
        isBack: false,
        glassmorphism: true,
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),

        child: Column(
          children: [
            const ProfileHeader(),
            const Text(
              "Nguyen Thanh Khang",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "thanhkhangdev@gmail.com",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(width: 8),
                Container(width: 1, height: 12, color: Colors.black26),
                const SizedBox(width: 8),
                const Text(
                  "+84 0912345567",
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ProfileMenuSection(
              items: [
                ProfileMenuItem(
                  icon: Icons.maps_home_work_outlined,
                  title: "VNhotel application history",
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.shield_outlined,
                  title: "Terms and condition",
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.local_activity_outlined,
                  title: "My voucher",
                  onTap: () {},
                ),
              ],
            ),
            ProfileMenuSection(
              items: [
                ProfileMenuItem(
                  icon: Icons.settings_outlined,
                  title: "Setting",
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.mail_outline_rounded,
                  title: "Send mail for us",
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.phone_callback_outlined,
                  title: "Contact us",
                  onTap: () {},
                ),
              ],
            ),
            ProfileMenuSection(
              items: [
                ProfileMenuItem(
                  icon: Icons.logout_rounded,
                  title: "Logout",
                  color: Colors.redAccent,
                  onTap: () {
                    Get.offAllNamed(AppRoutes.LOGIN);
                  },
                ),
              ],
            ),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
