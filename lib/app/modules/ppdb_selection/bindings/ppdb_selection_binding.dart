import 'package:get/get.dart';

import '../controllers/ppdb_selection_controller.dart';

class PpdbSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PpdbSelectionController>(
      () => PpdbSelectionController(),
    );
  }
}
