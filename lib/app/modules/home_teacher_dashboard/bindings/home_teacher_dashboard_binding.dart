import 'package:get/get.dart';

import '../../../core/base/base_dashboard_binding.dart';

import '../controllers/home_teacher_dashboard_controller.dart';

class HomeTeacherDashboardBinding extends BaseDashboardBinding {
  @override
  void injectController() {
    Get.lazyPut<HomeTeacherDashboardController>(
      () => HomeTeacherDashboardController(),
    );
  }
}
