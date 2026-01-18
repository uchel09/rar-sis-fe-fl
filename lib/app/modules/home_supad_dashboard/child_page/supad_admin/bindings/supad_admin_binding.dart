import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/services/school_admin/school_admin_service.dart';

import '../controllers/supad_admin_controller.dart';

class SupadAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchoolAdminService>(() => SchoolAdminService());
    Get.lazyPut<SupadAdminController>(() => SupadAdminController());
  }
}
