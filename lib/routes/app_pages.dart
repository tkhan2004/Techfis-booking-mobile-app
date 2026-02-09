import 'package:get/instance_manager.dart';
import 'package:hotel_booking/presentation/controllers/onboarding_controller.dart';
import 'package:hotel_booking/presentation/controllers/splash_controller.dart';
import 'package:hotel_booking/presentation/controllers/welcome_controller.dart';
import 'package:hotel_booking/presentation/pages/onboarding/onboarding_page.dart';
import 'package:hotel_booking/presentation/pages/welcome/welcome_page.dart';
import 'package:hotel_booking/routes/app_routes.dart';
import 'package:hotel_booking/routes/app_pages.dart';
import 'package:get/route_manager.dart';
import 'package:hotel_booking/presentation/pages/splash/splash_page.dart';

class AppPages {
  static const INITIAL = AppRoutes.WELCOME;

  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => const SplashPage(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
    ),
    GetPage(
      name: AppRoutes.ONBOARDING,
      page: () => const OnboardingPage(),
      binding: BindingsBuilder(() {
        Get.put(OnboardingController());
      }),
    ),
    GetPage(
      name: AppRoutes.WELCOME,
      page: () => const WelcomePage(),
      binding: BindingsBuilder(() {
        Get.put(WelcomeController());
      }),
    ),
  ];
}
