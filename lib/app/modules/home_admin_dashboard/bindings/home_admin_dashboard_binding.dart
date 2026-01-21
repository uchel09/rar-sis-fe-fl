import 'package:get/get.dart';

import '../controllers/home_admin_dashboard_controller.dart';
import '../../../core/base/base_dashboard_binding.dart';

class HomeAdminDashboardBinding extends BaseDashboardBinding {
  @override
  void injectController() {
    // Lu cuma perlu tulis lazyPut controllernya di sini
    Get.lazyPut<HomeAdminDashboardController>(
      () => HomeAdminDashboardController(),
    );
  }
}
