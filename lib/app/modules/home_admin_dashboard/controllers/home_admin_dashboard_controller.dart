import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';

class HomeAdminDashboardController extends GetxController {
  // 1. UI STATE (Replikasi State dari Next.js)
  var isCollapsed = false.obs; // Replikasi [collapsed, setCollapsed]
  var themeColor = 'putih'.obs; // Replikasi [themeColor, setThemeColor]
  var activeMenuKey = '1'.obs; // Replikasi selectedKeys [pathname]

  // 2. THEME DATA (Data warna yang Anda kirim dari Next.js)
  final Map<String, Map<String, Color>> themes = {
    'putih': {
      'header': const Color(0xFFffffff),
      'sidebar': const Color(0xFFffffff),
      'sidebarCard': const Color(0xFF90caf9),
      'text': const Color(0xFF212121),
      'hover': const Color(0xFFe3f2fd),
      'selected': const Color(0xFF64b5f6),
    },
    'hijau': {
      'header': const Color(0xFF11d868),
      'sidebar': const Color(0xFFffffff),
      'sidebarCard': const Color(0xFF66bb6a),
      'text': const Color(0xFF2e7d32),
      'hover': const Color(0xFFc8e6c9),
      'selected': const Color(0xFF388e3c),
    },
    'pink': {
      'header': const Color(0xFFf97fce),
      'sidebar': const Color(0xFFffffff),
      'sidebarCard': const Color(0xFFf06292),
      'text': const Color(0xFFad1457),
      'hover': const Color(0xFFf8bbd0),
      'selected': const Color(0xFFd81b60),
    },
    'biru': {
      'header': const Color(0xFF90caf9),
      'sidebar': const Color(0xFFffffff),
      'sidebarCard': const Color(0xFF64b5f6),
      'text': const Color(0xFF1565c0),
      'hover': const Color(0xFFbbdefb),
      'selected': const Color(0xFF1976d2),
    },
  };

  // 3. GETTER UNTUK UI
  Map<String, Color> get currentTheme => themes[themeColor.value]!;

  // 4. API & LOGIC (Menggunakan Dio)
  final Dio _dio =
      Get.find<Dio>(); // Asumsi Dio sudah di-inject di InitialBinding

  @override
  void onInit() {
    super.onInit();
    fetchDashboardStats();
  }

  void toggleSidebar() => isCollapsed.value = !isCollapsed.value;

  void changeTheme(String? val) {
    if (val != null) themeColor.value = val;
  }

  void onMenuSelected(String key) {
    activeMenuKey.value = key;
    // Logika navigasi bisa ditaruh di sini
  }

  // REPLIKASI handleLogout
  Future<void> logout() async {
    try {
      // Panggil API logout jika perlu
      // await _dio.post('/auth/logout');

      Get.offAllNamed('/login'); // Kembali ke login
      Get.snackbar(
        "Sukses",
        "Anda telah Logout",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      print("Logout error: $e");
    }
  }

  // Contoh Fetch Data untuk Widget Statistik
  Future<void> fetchDashboardStats() async {
    try {
      // Respon API sekolah Anda
      // var response = await _dio.get('/admin/stats');
    } catch (e) {
      print("Error fetching stats: $e");
    }
  }
}
