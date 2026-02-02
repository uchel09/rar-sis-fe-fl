import 'package:get/get.dart' hide Response;
import 'package:rar_sis_fe_fl/app/modules/profile/controllers/profile_controller.dart';
import '../../providers/base_api_service.dart';
import './sub_curriculum_model.dart';
import 'sub_curriculum_local_service.dart';
import '../db/database.dart'; // Sesuaikan path database

class SubCurriculumService extends GetxService {
  final BaseApiService _api = Get.find<BaseApiService>();

  // Inisialisasi Local Service
  late final SubCurriculumLocalService _localService;

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi local service dengan database instance
    _localService = SubCurriculumLocalService(Get.find<AppDatabase>());
  }

  // Ambil schoolId dari ProfileController secara reaktif
  String get currentSchoolId => Get.find<ProfileController>().schoolId.value;

  /// GET ALL: Fetch dari API -> Simpan ke Drift -> Return data dari Drift
  Future<List<SubCurriculumResponse>> getAllByCurriculum({
    bool forceRefresh = false,
    String curriculumId = "",
  }) async {
    List<SubCurriculumResponse> localData = [];

    // Ambil data lokal terlebih dahulu sebagai fallback
    try {
      localData = await _localService.getAllByCurriculumLocal(curriculumId);
    } catch (e) {
      print("LOKAL DB READ ERROR: $e");
    }

    if (forceRefresh) {
      try {
        print("INFO: Mengambil data dari API...");
        final response = await _api.dio.get(
          '/sub-curriculums/$curriculumId/curriculum',
        );
        final List list = response.data['data'];
        final apiResults = list
            .map((item) => SubCurriculumResponse.fromJson(item))
            .toList();

        // Simpan hasil API ke DB Lokal (Gunakan fungsi bulk yang baru)
        _localService
            .bulkInsertCurriculum(apiResults, curriculumId)
            .catchError((e) => print("DB INSERT ERROR: $e"));

        return apiResults;
      } catch (apiError) {
        print("API ERROR: $apiError");
        return localData; // Balik ke lokal jika API gagal
      }
    } else {
      print("INFO: Mengambil data dari Lokal...");
      return localData;
    }
  }

  Future<List<SubCurriculumResponse>> getAll({
    bool forceRefresh = false,
  }) async {
    List<SubCurriculumResponse> localData = [];

    try {
      localData = await _localService.getAllLocal();
    } catch (e) {
      print("LOKAL DB READ ERROR: $e");
    }

    if (forceRefresh) {
      try {
        print("INFO: Mengambil data dari API...");
        final response = await _api.dio.get(
          '/sub-curriculums/$currentSchoolId/school',
        );
        final List list = response.data['data'];
        final apiResults = list
            .map((item) => SubCurriculumResponse.fromJson(item))
            .toList();

        _localService
            .bulkInsert(apiResults) // Pastikan bulkInsert (global) sudah ada
            .catchError((e) => print("DB INSERT ERROR: $e"));

        return apiResults;
      } catch (apiError) {
        print("API ERROR: $apiError");
        return localData;
      }
    } else {
      print("INFO: Mengambil data dari Lokal...");
      return localData;
    }
  }

  /// CREATE
  Future<void> create(CreateSubCurriculumRequest request) async {
    await _api.dio.post('/sub-curriculums', data: request.toJson());
    // Refresh data lokal setelah create sukses
    await getAll(forceRefresh: true);
  }

  /// UPDATE
  Future<void> update(String id, UpdateSubCurriculumRequest request) async {
    await _api.dio.put('/sub-curriculums/$id', data: request.toJson());
    // Refresh data lokal setelah update sukses
    await getAll(forceRefresh: true);
  }

  Future<SubCurriculumResponse?> getSubByIdLocal(String id) async {
    return await _localService.getById(id);
  }

  /// DELETE
  Future<void> delete(String id, String schoolId) async {
    await _api.dio.delete('/sub-curriculums/$id');
    // Refresh data lokal setelah delete sukses agar ID yang dihapus hilang dari Drift
    await getAll(forceRefresh: true);
  }

  Future<void> deleteLocal() async {
    await _localService.deleteLocal();
  }
}
