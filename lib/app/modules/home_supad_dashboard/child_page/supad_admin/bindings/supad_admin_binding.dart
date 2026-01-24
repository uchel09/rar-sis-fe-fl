import 'package:get/get.dart';

import '../controllers/supad_admin_controller.dart';

class SupadAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupadAdminController>(() => SupadAdminController());
  }
}
