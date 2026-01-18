import 'package:get/get.dart';

import '../controllers/home_supad_dashboard_controller.dart';

class HomeSupadDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeSupadDashboardController>(
      () => HomeSupadDashboardController(),
    );
  }
}
