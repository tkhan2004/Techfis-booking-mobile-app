import 'package:get/get.dart';
import 'package:hotel_booking/routes/app_routes.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    // Bắt đầu đếm ngược 3s để chuyển màn
    _startNextPage();
  }

  /// - User không thể back về Splash screen
  void _startNextPage() async {
    await Future.delayed(const Duration(seconds: 3));

    print('Chuyển sang onboarding');

    Get.offNamed(AppRoutes.ONBOARDING);
  }
}
