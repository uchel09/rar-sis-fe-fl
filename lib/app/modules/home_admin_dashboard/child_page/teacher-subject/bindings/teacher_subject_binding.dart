import 'package:get/get.dart';

import '../controllers/teacher_subject_controller.dart';

class TeacherSubjectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeacherSubjectController>(
      () => TeacherSubjectController(),
    );
  }
}
