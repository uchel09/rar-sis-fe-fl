import 'package:get/get.dart';

import '../controllers/home_student_dashboard_controller.dart';
import '../../../core/base/base_dashboard_binding.dart';

class HomeStudentDashboardBinding extends BaseDashboardBinding {
  @override
  void injectController() {
    // Lu cuma perlu tulis lazyPut controllernya di sini
    Get.lazyPut<HomeStudentDashboardController>(
      () => HomeStudentDashboardController(),
    );
  }
}
