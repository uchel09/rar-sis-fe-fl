import 'package:get/get.dart' hide Response;
import 'package:rar_sis_fe_fl/app/modules/profile/controllers/profile_controller.dart';
import '../../providers/base_api_service.dart';
import './subject_model.dart';
import 'subject_local_service.dart';
import '../db/database.dart';

class SubjectService extends GetxService {
  final BaseApiService _api = Get.find<BaseApiService>();

  // Inisialisasi Local Service
  late final SubjectLocalService _localService;

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi local service dengan database instance
    _localService = SubjectLocalService(Get.find<AppDatabase>());
  }

  // Ambil schoolId dari ProfileController secara reaktif
  String get currentSchoolId => Get.find<ProfileController>().schoolId.value;

  /// GET ALL: Fetch dari API -> Simpan ke Drift -> Return data
  Future<List<SubjectResponse>> getAll({bool forceRefresh = false}) async {
    List<SubjectResponse> localData = [];

    // 1. Coba ambil data lokal dulu sebagai fallback
    try {
      localData = await _localService.getAllLocal();
    } catch (e) {
      print("LOKAL DB READ ERROR: $e");
    }

    // 2. Jika forceRefresh true ATAU data lokal kosong, ambil dari API
    if (forceRefresh || localData.isEmpty) {
      try {
        print("INFO: Mengambil data dari API untuk School: $currentSchoolId");

        // Sesuaikan endpoint jika perlu, di sini saya mengikuti struktur Anda
        final response = await _api.dio.get(
          '/subjects/$currentSchoolId/school',
        );

        // Mapping manual sesuai keinginan Anda
        final List list = response.data['data'] ?? [];
        final apiResults = list
            .map((item) => SubjectResponse.fromJson(item))
            .toList();

        // 3. Simpan hasil API ke DB Lokal (Bulk Insert otomatis hapus lama & simpan baru)
        await _localService.bulkInsert(apiResults);

        return apiResults;
      } catch (apiError) {
        print("API ERROR: $apiError");
        // Jika API gagal, kembalikan data lokal yang ada (meskipun kosong)
        return localData;
      }
    }

    print("INFO: Mengambil data dari Lokal...");
    return localData;
  }

  Future<List<SubjectResponse>> getAllBySchoolLevel({
    bool forceRefresh = false,
    String schoolLevelId = "",
  }) async {
    List<SubjectResponse> localData = [];

    // Ambil data lokal terlebih dahulu sebagai fallback
    try {
      localData = await _localService.getAllBySchoolLevelLocal(schoolLevelId);
    } catch (e) {
      print("LOKAL DB READ ERROR: $e");
    }

    if (forceRefresh) {
      try {
        print("INFO: Mengambil data dari API...");
        final response = await _api.dio.get(
          '/subjects/$currentSchoolId/school/$schoolLevelId/level',
        );
        final List list = response.data['data'];
        final apiResults = list
            .map((item) => SubjectResponse.fromJson(item))
            .toList();
        print(response.data);
        // Simpan hasil API ke DB Lokal (Gunakan fungsi bulk yang baru)
        await _localService
            .bulkInsertBySchoolLevel(apiResults, schoolLevelId)
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

  /// CREATE
  Future<void> create(CreateSubjectRequest request) async {
    try {
      await _api.dio.post('/subjects', data: request.toJson());
      // Refresh data lokal setelah create sukses agar Drift terupdate
    } catch (e) {
      rethrow; // Biarkan Controller menangani error UI
    }
  }

  /// UPDATE
  Future<void> updateSubject(String id, UpdateSubjectRequest request) async {
    try {
      await _api.dio.put('/subjects/$id', data: request.toJson());
      // Refresh data lokal agar data di Drift sinkron dengan server
    } catch (e) {
      rethrow;
    }
  }

  /// GET BY ID LOCAL
  Future<SubjectResponse?> getSubjectByIdLocal(String id) async {
    return await _localService.getById(id);
  }

  /// DELETE
  Future<void> deleteSubject(String id) async {
    try {
      await _api.dio.delete('/subjects/$id');
      // Refresh data lokal setelah delete sukses agar ID yang dihapus hilang dari Drift
      await getAll(forceRefresh: true);
    } catch (e) {
      rethrow;
    }
  }
}
