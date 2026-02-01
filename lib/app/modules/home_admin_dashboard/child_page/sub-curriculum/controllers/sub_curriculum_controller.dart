import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/core/base/master_controller.dart';
import 'package:rar_sis_fe_fl/app/services/curriculum/curriculum_model.dart';

class SubCurriculumController extends GetxController {
  //TODO: Implement SubCurriculumController
  final MasterController masterController = Get.find<MasterController>();
  var selectedCurriculumId = "".obs;

  @override
  void onInit() {
    super.onInit();
    // Saat render pertama kali, cek data master
    // Jika sudah ada data, ambil ID index 0
    if (masterController.allCurriculumActive.isNotEmpty) {
      selectedCurriculumId.value =
          masterController.allCurriculumActive.first.id;
    }

    // Opsional: Jika data kurikulum di-load secara asinkron (delay)
    ever(masterController.allCurriculumActive, (List curriculums) {
      if (curriculums.isNotEmpty && selectedCurriculumId.value.isEmpty) {
        selectedCurriculumId.value = curriculums.first.id;
      }
    });
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
