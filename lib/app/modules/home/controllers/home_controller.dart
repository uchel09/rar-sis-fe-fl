import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:dio/dio.dart';
import 'package:rar_sis_fe_fl/app/controllers/school_controller.dart';
import '../../../providers/api_provider.dart';

class HomeController extends GetxController {
  final schoolController = TextEditingController();
  final isLoading = false.obs;

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
      // 🔥 VALIDASI KE BACKEND
      await ApiProvider.dio.post('/schools/check', data: {'code': code});

      // ✅ kalau lolos, simpan

      school.saveSchoolCode(code);
      // ➡️ ke login
      Get.offAllNamed('/login');
    } on DioException catch (e) {
      Get.snackbar(
        'Gagal',
        e.response?.data['message'] ?? 'Kode sekolah tidak valid',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
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
