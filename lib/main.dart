import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'utils/constants/app_styles.dart';
import 'routes/app_pages.dart';
import 'routes/app_routes.dart';

void main() {
  // Techfis Rule: Đảm bảo Flutter framework được khởi tạo trước khi chạy các logic khác
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'IKIGAI VN HOTEL',

      debugShowCheckedModeBanner: false,

      // Theme chuẩn từ Figma đã setup (Bo góc 12, Padding 16, Font Inter)
      theme: AppTheme.lightTheme,

      // điều hướng đầu tiên
      initialRoute: AppPages.INITIAL,

      getPages: AppPages.routes,

      locale: const Locale('vi', 'VN'),
      fallbackLocale: const Locale('en', 'US'),

      // Transition (Hiệu ứng chuyển màn hình cho mượt)
      defaultTransition: Transition.cupertino,
    );
  }
}
