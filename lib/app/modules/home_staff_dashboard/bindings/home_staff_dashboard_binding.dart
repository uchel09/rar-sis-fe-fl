import 'package:get/get.dart';

import '../controllers/home_staff_dashboard_controller.dart';
import '../../../core/base/base_dashboard_binding.dart';

class HomeStaffDashboardBinding extends BaseDashboardBinding {
  @override
  void injectController() {
    // Lu cuma perlu tulis lazyPut controllernya di sini
    Get.lazyPut<HomeStaffDashboardController>(
      () => HomeStaffDashboardController(),
    );
  }
}
