import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:rar_sis_fe_fl/app/controllers/global_loading_controller.dart';
import 'package:rar_sis_fe_fl/app/services/auth/auth_model.dart';
import '../../providers/base_api_service.dart';
import 'package:get_storage/get_storage.dart';

class AuthService extends GetxService {
  final BaseApiService _api = Get.find<BaseApiService>();
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    // 1. Saat aplikasi dibuka pertama kali, hapus data lama (Sesuai request lu)
    _initAuth();
  }

  Future<void> _initAuth() async {
    if (box.read('isLoggedIn') == true) {
      print("AuthService: Cookie siap, menjalankan fetchMe...");
      await fetchMe();
    }
  }

  Future<Response> login({
    required String email,
    required String password,
  }) async {
    final response = await _api.dio.post(
      '/auth/login',
      data: {'email': email, 'password': password},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      await fetchMe(forceRefresh: true);
    }
    return response;
  }

  Future<void> fetchMe({bool forceRefresh = false}) async {
    try {
      GlobalLoadingController.to.show();
      final response = await _api.dio.get('/users/me');

      // Manual mapping
      final rawDataMap = response.data["data"];
      final rawData = UserProfileModel.fromJson(rawDataMap);
      if (response.statusCode == 200) {
        await box.remove('profile');
        await box.remove('role');
      }
      // Simpan ke Storage agar persistent (anti-null pas pindah page)
      print(
        "AuthService: Data user dimuat & disimpan di Storage -> ${rawData.fullName}",
      );
      await box.write('role', rawData.role);
      await box.write('profile', rawDataMap);
    } finally {
      GlobalLoadingController.to.hide();
    }
  }

  Future<void> logout() async {
    try {
      GlobalLoadingController.to.show();
      var res = await _api.dio.post('/auth/logout');
      if (res.statusCode == 200 || res.statusCode == 201) {
        box.remove('isLoggedIn');
        box.remove('profile');
        box.remove('role');
        await _api.cookieJar.deleteAll();
        Get.offAllNamed("/login");
      }
    } finally {
      // Tambahkan ini: Hapus data profile di storage saat logout
      GlobalLoadingController.to.hide();
    }
  }
}
