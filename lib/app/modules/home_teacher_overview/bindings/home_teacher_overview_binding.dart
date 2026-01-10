import 'package:get/get.dart';

import '../controllers/home_teacher_overview_controller.dart';

class HomeTeacherOverviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeTeacherOverviewController>(
      () => HomeTeacherOverviewController(),
    );
  }
}
