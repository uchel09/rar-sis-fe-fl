import 'package:get/get.dart' hide Response;
import 'package:rar_sis_fe_fl/app/modules/profile/controllers/profile_controller.dart';
import '../../providers/base_api_service.dart';
import './curriculum_model.dart';
import 'curriculum_local_service.dart';
import '../db/database.dart'; // Sesuaikan path database

class CurriculumService extends GetxService {
  final BaseApiService _api = Get.find<BaseApiService>();

  // Inisialisasi Local Service
  late final CurriculumLocalService _localService;

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi local service dengan database instance
    _localService = CurriculumLocalService(Get.find<AppDatabase>());
  }

  // Ambil schoolId dari ProfileController secara reaktif
  String get currentSchoolId => Get.find<ProfileController>().schoolId.value;

  /// GET ALL: Fetch dari API -> Simpan ke Drift -> Return data dari Drift
  Future<List<CurriculumResponse>> getAll({bool forceRefresh = false}) async {
    // 1. Coba ambil dari DB Lokal dulu (selalu)
    List<CurriculumResponse> localData = [];

    if (forceRefresh) {
      try {
        print("INFO: Mengambil data dari API...");
        final response = await _api.dio.get(
          '/curriculums/$currentSchoolId/school',
        );
        final List list = response.data['data'];
        final apiResults = list
            .map((item) => CurriculumResponse.fromJson(item))
            .toList();

        // Simpan hasil API ke DB Lokal (Background process)
        _localService
            .bulkInsert(apiResults)
            .catchError((e) => print("DB INSERT ERROR: $e"));
        print(list);
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
  Future<void> create(CreateCurriculumRequest request) async {
    await _api.dio.post('/curriculums', data: request.toJson());
    // Refresh data lokal setelah create sukses
    await getAll(forceRefresh: true);
  }

  /// UPDATE
  Future<void> update(
    String id,
    UpdateCurriculumRequest request,
    String schoolId,
  ) async {
    await _api.dio.put('/curriculums/$id', data: request.toJson());
    // Refresh data lokal setelah update sukses
    await getAll(forceRefresh: true);
  }

  Future<CurriculumResponse?> getCurriculumByIdLocal(String id) async {
    return await _localService.getById(id);
  }

  /// DELETE
  Future<void> delete(String id, String schoolId) async {
    await _api.dio.delete('/curriculums/$id');
    // Refresh data lokal setelah delete sukses agar ID yang dihapus hilang dari Drift
    await getAll(forceRefresh: true);
  }

  Future<void> deleteLocal() async {
    await _localService.deleteLocal();
  }
}
