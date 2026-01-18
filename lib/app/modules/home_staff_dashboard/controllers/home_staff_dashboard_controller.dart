import 'package:get/get.dart';
// Import BaseDashboardController yang kita buat tadi
import '../../../core/base/base_dashboard_controller.dart';

class HomeStaffDashboardController extends BaseDashboardController {
  var openMenuId = "".obs;
  @override
  void onInit() {
    super.onInit();
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
