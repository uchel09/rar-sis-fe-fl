import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/controllers/school_controller.dart';
import 'package:rar_sis_fe_fl/app/services/school/school_service.dart'; // Import service

class HomeController extends GetxController {
  final schoolController = TextEditingController();
  final isLoading = false.obs;

  // 1. Inject Service & Global Controller
  final SchoolService _schoolService = Get.put(SchoolService());
  final school = Get.find<SchoolController>();

  void submitSchool() async {
    final code = schoolController.text.trim();

    if (code.isEmpty) {
      Get.snackbar(
        'Error',
        'Kode sekolah wajib diisi',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      // 2. Panggil Service (Logika API & Mapping Manual ada di dalam sini)
      final success = await _schoolService.checkSchoolCode(code);

      if (success) {
        // 3. Simpan secara lokal jika berhasil
        school.saveSchoolCode(code);

        // 4. Navigasi ke login
        Get.offAllNamed('/login');
      }
    } catch (e) {
      // Error handling sudah dicover oleh Interceptor di BaseApiService
      // Jika ingin log tambahan bisa di sini
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    schoolController.dispose();
    super.onClose();
  }
}
