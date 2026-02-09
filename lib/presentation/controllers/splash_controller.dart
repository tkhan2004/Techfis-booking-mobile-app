import 'package:get/get.dart';
import 'package:hotel_booking/presentation/pages/onboarding/onboarding_page.dart';
import 'package:hotel_booking/routes/app_pages.dart';
import 'package:hotel_booking/routes/app_routes.dart';


class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    _startNextPage();
  }

  void _startNextPage() async {
    await Future.delayed(const Duration(seconds: 3));
    
    print('Chuyển sang onboarding');
    Get.offNamed(AppRoutes.ONBOARDING);
  }
}
