import 'package:get/get.dart';

import '../controllers/home_teacher_dashboard_controller.dart';

class HomeTeacherDashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeTeacherDashboardController>(
      () => HomeTeacherDashboardController(),
    );
  }
}
