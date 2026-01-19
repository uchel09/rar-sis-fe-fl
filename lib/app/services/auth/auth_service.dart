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
    // 1. Bersihkan data lama sesuai request lu
    box.remove('profile');
    print("AuthService: App dibuka, storage 'profile' dibersihkan.");

    // 2. TUNGGU sampai BaseApiService benar-benar siap
    // Kita pastikan cookieJar sudah selesai loading dari disk
    // Jika di BaseApiService init() lu return 'this', ini akan sangat efektif.
    await _api.init();

    // 3. Baru jalankan fetchMe setelah cookie dipastikan ter-load
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

      // Simpan ke Storage agar persistent (anti-null pas pindah page)
      await box.write('profile', rawDataMap);
      print(
        "AuthService: Data user dimuat & disimpan di Storage -> ${rawData.fullName}",
      );
    } finally {
      GlobalLoadingController.to.hide();
    }
  }

  Future<void> logout() async {
    try {
      GlobalLoadingController.to.show();
      await _api.dio.post('/auth/logout');
    } finally {
      // Tambahkan ini: Hapus data profile di storage saat logout
      box.remove('profile');
      box.remove('isLoggedIn');
      box.remove('role');
      await _api.cookieJar.deleteAll();
      GlobalLoadingController.to.hide();
      Get.offAllNamed("/login");
    }
  }
}
