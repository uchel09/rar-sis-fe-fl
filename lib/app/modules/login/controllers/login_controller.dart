import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:rar_sis_fe_fl/app/controllers/school_controller.dart';
import '../../../providers/api_provider.dart';
import 'package:rar_sis_fe_fl/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;

  final school = Get.find<SchoolController>();

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  Future<void> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Error',
        'Email dan password wajib diisi',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      final response = await ApiProvider.dio.post(
        '/auth/login',
        data: {'email': email, 'password': password},
      );

      // ✅ Login berhasil, backend sudah set cookie 'access_token'
      final user = response.data['user'];
      Get.snackbar(
        'Sukses',
        'Login berhasil',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );

      // ➡️ Redirect ke dashboard sesuai role
      switch (user['role']) {
        case 'SCHOOL_ADMIN':
          Get.offAllNamed('/home-admin-dashboard');
          break;
        case 'TEACHER':
          Get.offAllNamed('/home-teacher-dashboard');
          break;
        case 'STUDENT':
          Get.offAllNamed("/home-student-dashboard");
          break;
        default:
          Get.offAllNamed('/login');
      }
    } on DioException catch (e) {
      Get.snackbar(
        'Gagal',
        e.response?.data['message'] ?? 'Login gagal',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
