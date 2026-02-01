import 'package:get/get.dart';

import '../controllers/sub_curriculum_controller.dart';

class SubCurriculumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SubCurriculumController>(
      () => SubCurriculumController(),
    );
  }
}
