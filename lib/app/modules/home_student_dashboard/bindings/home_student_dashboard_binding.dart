import 'package:get/get.dart';

import '../controllers/home_student_dashboard_controller.dart';

class HomeStudentDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeStudentDashboardController>(
      () => HomeStudentDashboardController(),
    );
  }
}
