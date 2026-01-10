import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../app/providers/api_provider.dart';

abstract class BaseDashboardController extends GetxController {
  // --- UI STATE (Sama untuk semua User) ---
  var isCollapsed = false.obs;
  var themeColor = 'putih'.obs;
  var activeMenuKey = '1'.obs;

  // --- THEME DATA (Global agar konsisten) ---
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
    try {
      var res = await ApiProvider.dio.post('/auth/logout');
      print(res);
    } catch (e) {
      print("Logout API error: $e");
    } finally {
      Get.offAllNamed("/login");
    }
  }
}
