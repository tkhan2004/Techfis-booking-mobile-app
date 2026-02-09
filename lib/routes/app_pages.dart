import 'package:hotel_booking/presentation/pages/onboarding/onboarding_page.dart';
import 'package:hotel_booking/routes/app_routes.dart';
import 'package:hotel_booking/routes/app_pages.dart';
import 'package:get/route_manager.dart';
import 'package:hotel_booking/presentation/pages/splash/splash_page.dart';

class AppPages {
  static const INITIAL = AppRoutes.SPLASH;
  static final routes = [
    GetPage(name: AppRoutes.SPLASH, page: () => const OnboardingPage()),
  ];
}
