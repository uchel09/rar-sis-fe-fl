import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/modules/profile/controllers/profile_controller.dart';
import 'package:rar_sis_fe_fl/app/services/auth/auth_service.dart'; // Sesuaikan path ini

abstract class BaseDashboardController extends GetxController {
  // --- AMBIL INSTANCE SERVICE ---
  // Karena di main.dart kamu pakai Get.putAsync<BaseApiService>,
  // kita panggil di sini supaya logout() bisa akses .dio
  ProfileController get profile => Get.find<ProfileController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var profileOffset = const Offset(16, 16).obs;
  var parentActive = "".obs;
  var isHovered = false.obs();
  void updateOffset(Offset newPos) {
    profileOffset.value = newPos;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    // Panggil API di sini agar lebih stabil setelah UI muncul
  }

  final AuthService _authService = Get.put(AuthService());

  // --- UI STATE ---
  var isCollapsed = false.obs;
  var themeColor = 'putih'.obs;
  var activeMenuKey = '1'.obs;

  // Future<void> loadDashboardData() async {
  //   try {
  //     // Panggil fetchMe yang sudah ada mapping manualnya
  //     final userData = await _authService.fetchMe();
  //     // print();
  //     // Update state untuk ditampilkan di UI
  //   } catch (e) {
  //     print("Error loading dashboard data: $e");
  //     // Jika error 401 atau token expired, biasanya ditangani interceptor dio
  //   }
  // }

  // --- THEME DATA ---
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

  Map<String, Color> get currentTheme => themes[themeColor.value]!;

  void toggleSidebar() => isCollapsed.value = !isCollapsed.value;

  void changeTheme(String? val) {
    if (val != null) themeColor.value = val;
  }

  Future<void> logout() async {
    await _authService.logout();
  }
}
