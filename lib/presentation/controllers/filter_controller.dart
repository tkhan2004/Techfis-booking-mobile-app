import 'package:get/get.dart';

class FilterController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }
}

class FilterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FilterController(), fenix: true);
  }
}
