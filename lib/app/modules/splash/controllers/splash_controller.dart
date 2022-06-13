import 'package:get/get.dart';

import '../../../core/base/base_controller.dart';
import '../../../routes/app_pages.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    super.onInit();
  }

  navigateToNext() {
    // Get.toNamed(AppRoutes.loginPage);
    Future.delayed(const Duration(seconds: 8), () {
      Get.toNamed(Routes.DASHBOARD);
    });
  }
}
