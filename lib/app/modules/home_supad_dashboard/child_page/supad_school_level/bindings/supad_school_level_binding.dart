import 'package:get/get.dart';

import '../controllers/supad_school_level_controller.dart';

class SupadSchoolLevelBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupadSchoolLevelController>(
      () => SupadSchoolLevelController(),
    );
  }
}
