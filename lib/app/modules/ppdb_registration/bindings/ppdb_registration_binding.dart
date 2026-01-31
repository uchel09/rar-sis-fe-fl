import 'package:get/get.dart';

import '../controllers/ppdb_registration_controller.dart';

class PpdbRegistrationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PpdbRegistrationController>(
      () => PpdbRegistrationController(),
    );
  }
}
