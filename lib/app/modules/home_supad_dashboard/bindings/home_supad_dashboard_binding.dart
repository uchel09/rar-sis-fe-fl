import 'package:get/get.dart';

import '../../../core/base/base_dashboard_binding.dart';

import '../controllers/home_supad_dashboard_controller.dart';

class HomeSupadDashboardBinding extends BaseDashboardBinding {
  @override
  void injectController() {
    // Lu cuma perlu tulis lazyPut controllernya di sini
    Get.lazyPut<HomeSupadDashboardController>(
      () => HomeSupadDashboardController(),
    );
  }
}
