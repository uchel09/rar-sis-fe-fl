import 'package:get/get.dart';
// Import BaseDashboardController yang kita buat tadi
import '../../../core/base/base_dashboard_controller.dart';
import '../../../routes/app_pages.dart';
import 'package:flutter/material.dart';

class HomeStudentDashboardController extends BaseDashboardController {
  var openMenuId = "".obs;
  @override
  void onInit() {
    super.onInit();
    activeMenuKey.value = "1";

    // 2. Paksa Router Outlet internal pindah ke rute overview
    // Kita panggil di akhir frame supaya gak tabrakan sama proses build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.rootDelegate.toNamed(Routes.HOME_SUPAD_OVERVIEW);
    });
    fetchDashboardStats();
    _syncMenuWithUrl();
  }

  // --- LOGIKA SPESIFIK ADMIN ---
  void _syncMenuWithUrl() {
    final currentPath = Get.rootDelegate.currentConfiguration?.location ?? '';
    if (currentPath.contains('student'))
      activeMenuKey.value = "2-1";
    else if (currentPath.contains('teacher'))
      activeMenuKey.value = "2-2";
    else if (currentPath.contains('class'))
      activeMenuKey.value = "2-3";
    else
      activeMenuKey.value = "1";
  }

  void onMenuSelected(String key, String route) {
    activeMenuKey.value = key;
    Get.rootDelegate.toNamed(route); // Navigasi ke route anak
  }

  Future<void> fetchDashboardStats() async {
    try {
      // var response = await _dio.get('/admin/stats');
    } catch (e) {
      print("Error fetching stats: $e");
    }
  }
}
