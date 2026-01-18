import 'package:get/get.dart';

import '../controllers/home_supad_overview_controller.dart';

class HomeSupadOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeSupadOverviewController>(
      () => HomeSupadOverviewController(),
    );
  }
}
