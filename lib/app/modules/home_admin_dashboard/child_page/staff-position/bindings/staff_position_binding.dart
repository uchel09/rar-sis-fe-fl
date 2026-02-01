import 'package:get/get.dart';

import '../controllers/staff_position_controller.dart';

class StaffPositionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaffPositionController>(
      () => StaffPositionController(),
    );
  }
}
