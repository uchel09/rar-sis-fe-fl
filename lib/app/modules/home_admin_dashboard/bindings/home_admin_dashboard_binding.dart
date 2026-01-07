import 'package:get/get.dart';

import '../controllers/home_admin_dashboard_controller.dart';

class HomeAdminDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeAdminDashboardController>(
      () => HomeAdminDashboardController(),
    );
  }
}
