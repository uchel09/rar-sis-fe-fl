import 'package:get/get.dart';

import '../controllers/home_staff_overview_controller.dart';

class HomeStaffOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeStaffOverviewController>(
      () => HomeStaffOverviewController(),
    );
  }
}
