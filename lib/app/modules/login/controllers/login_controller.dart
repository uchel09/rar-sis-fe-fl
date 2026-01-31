import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rar_sis_fe_fl/app/controllers/school_controller.dart';
import 'package:rar_sis_fe_fl/app/controllers/global_loading_controller.dart';
import 'package:rar_sis_fe_fl/app/services/auth/auth_service.dart'; // Sesuaikan path ini
import 'package:rar_sis_fe_fl/app/routes/app_pages.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;
  final box = GetStorage();
  // Gunakan AuthService
  final AuthService _authService = Get.put(AuthService());
  final school = Get.find<SchoolController>();
  final formKey = GlobalKey<ShadFormState>();
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  //cuma test
  void deleteSchoolCode() {
    school.clear();
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
    GlobalLoadingController.to.show();
    isLoading.value = true;

    try {
      // Panggil service (Login)
      final response = await _authService.login(
        email: email,
        password: password,
      );

      // Mapping manual sederhana dari response
      final user = response.data["data"];
      final String role = user['role'] ?? '';

      box.write('isLoggedIn', true);
      box.write('role', role);
      Get.snackbar(
        'Sukses',
        'Login berhasil',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      // Redirect berdasarkan role
      _redirectUser(role);
    } finally {
      isLoading.value = false;
      GlobalLoadingController.to.hide();
    }
  }

  void _redirectUser(String role) {
    switch (role) {
      case 'SCHOOL_ADMIN':
        Get.offAllNamed(
          Routes.HOME_ADMIN_DASHBOARD,
        ); // Gunakan Routes agar lebih aman
        break;
      case 'TEACHER':
        Get.offAllNamed(Routes.HOME_TEACHER_DASHBOARD);
        break;
      case 'STUDENT':
        Get.offAllNamed(Routes.HOME_STUDENT_DASHBOARD);
        break;
      case 'SUPERADMIN':
        Get.offAllNamed(Routes.HOME_SUPAD_DASHBOARD);
        break;
      case 'STAFF':
        Get.offAllNamed(Routes.HOME_STAFF_DASHBOARD);
        break;
      default:
        Get.offAllNamed(Routes.LOGIN);
    }
  }
}
