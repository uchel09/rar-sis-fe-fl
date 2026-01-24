import 'package:get/get.dart' hide Response;
import 'package:rar_sis_fe_fl/app/modules/profile/controllers/profile_controller.dart';
import '../../providers/base_api_service.dart';
import './school_level_model.dart';
import 'school_level_local_service.dart';
import '../db/database.dart'; // Sesuaikan path database

class SchoolAdminService extends GetxService {
  final BaseApiService _api = Get.find<BaseApiService>();

  // Inisialisasi Local Service
  late final SchoolLevelLocalService _localService;

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi local service dengan database instance
    _localService = SchoolLevelLocalService(Get.find<AppDatabase>());
  }

  // Ambil schoolId dari ProfileController secara reaktif
  String get currentSchoolId => Get.find<ProfileController>().schoolId.value;

  /// GET ALL: Fetch dari API -> Simpan ke Drift -> Return data dari Drift
  Future<List<SchoolLevelResponse>> getAll({bool forceRefresh = false}) async {
    // 1. Coba ambil dari DB Lokal dulu (selalu)
    List<SchoolLevelResponse> localData = [];

    if (forceRefresh) {
      try {
        print("INFO: Mengambil data dari API...");
        final response = await _api.dio.get('/school-levels');
        final List list = response.data['data'];
        final apiResults = list
            .map((item) => SchoolLevelResponse.fromJson(item))
            .toList();

        // Simpan hasil API ke DB Lokal (Background process)
        _localService
            .bulkInsert(apiResults)
            .catchError((e) => print("DB INSERT ERROR: $e"));

        return apiResults; // Return data segar dari API
      } catch (apiError) {
        print("API ERROR: $apiError");
        // Kalau API gagal tapi ada data lokal (meski jadul), kasih yang lokal aja
        return localData;
      }
    } else {
      try {
        localData = await _localService.getAllLocal();
        print("INFO: Mengambil data dari Lokal...");
      } catch (e) {
        print("LOKAL DB READ ERROR: $e");
      }
      return localData;
    }
  }

  /// CREATE
  Future<void> create(CreateSchoolLevelRequest request) async {
    await _api.dio.post('/school-levels', data: request.toJson());
    // Refresh data lokal setelah create sukses
    await getAll(forceRefresh: true);
  }

  /// UPDATE
  Future<void> update(
    String id,
    UpdateSchoolLevelRequest request,
    String schoolId,
  ) async {
    await _api.dio.put('/school-levels/$id', data: request.toJson());
    // Refresh data lokal setelah update sukses
    await getAll(forceRefresh: true);
  }

  /// DELETE
  Future<void> delete(String id, String schoolId) async {
    await _api.dio.delete('/school-levels/$id');
    // Refresh data lokal setelah delete sukses agar ID yang dihapus hilang dari Drift
    await getAll(forceRefresh: true);
  }

  Future<void> deleteLocal(String id) async {
    await _localService.deleteLocal(id);
  }
}
