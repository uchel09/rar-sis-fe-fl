import 'package:get/get.dart';

import '../controllers/home_staff_dashboard_controller.dart';

class HomeStaffDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeStaffDashboardController>(
      () => HomeStaffDashboardController(),
    );
  }
}
