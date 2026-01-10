import 'package:get/get.dart';

import '../controllers/home_admin_overview_controller.dart';

class HomeAdminOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeAdminOverviewController>(
      () => HomeAdminOverviewController(),
    );
  }
}
