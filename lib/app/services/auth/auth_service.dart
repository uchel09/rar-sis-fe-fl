import 'package:dio/dio.dart';
// Gunakan hide Response agar tidak bentrok dengan milik GetX
import 'package:get/get.dart' hide Response;
import 'package:rar_sis_fe_fl/app/controllers/global_loading_controller.dart';
import '../../providers/base_api_service.dart'; // Import class baru kamu
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  final BaseApiService _api = Get.find<BaseApiService>();

  // State Profil User - Reaktif agar UI bisa otomatis update
  final box = GetStorage();
  // --- 1. LOGIN ---
  Future<Response> login({
    required String email,
    required String password,
  }) async {
    final response = await _api.dio.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );
    // Jika login sukses, langsung tarik data profil

    return response;
  }

  // --- 2. FIND ME (Initialisasi Profil) ---
  Future<void> fetchMe() async {
    try {
      GlobalLoadingController.to.show();
      final response = await _api.dio.get('/users/me');
      return response.data['data'];
    } finally {
      GlobalLoadingController.to.hide();
    }
  }

  // --- 3. LOGOUT ---
  Future<Response> logout() async {
    try {
      GlobalLoadingController.to.show();
      final response = await _api.dio.post(
        '/auth/logout',
        data: {},
        options: Options(headers: {"Cache-Control": "no-cache"}),
      );
      return response;
    } finally {
      // Clear state apapun yang terjadi
      box.remove('isLoggedIn');
      box.remove('role');
      GlobalLoadingController.to.hide();
    }
  }
}
