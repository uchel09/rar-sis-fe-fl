import 'package:get/get.dart';

import '../controllers/supad_curriculum_controller.dart';

class SupadCurriculumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupadCurriculumController>(
      () => SupadCurriculumController(),
    );
  }
}
