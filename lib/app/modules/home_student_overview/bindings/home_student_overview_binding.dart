import 'package:get/get.dart';

import '../controllers/home_student_overview_controller.dart';

class HomeStudentOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeStudentOverviewController>(
      () => HomeStudentOverviewController(),
    );
  }
}
