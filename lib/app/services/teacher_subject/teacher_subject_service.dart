import 'package:get/get.dart' hide Response;
import '../../providers/base_api_service.dart';
import '../db/database.dart';
import 'teacher_subject_model.dart';
import 'teacher_subject_local_service.dart';

class TeacherSubjectService extends GetxService {
  final BaseApiService _api = Get.find<BaseApiService>();

  // Inisialisasi Local Service
  late final TeacherSubjectLocalService _localService;

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi local service dengan database instance dari Drift
    _localService = TeacherSubjectLocalService(Get.find<AppDatabase>());
  }

  /// GET ALL: Fetch dari API -> Simpan ke Drift -> Return data
  /// Parameter [teacherId] bersifat opsional jika ingin memfilter spesifik guru
  Future<List<TeacherSubjectResponse>> getAll({
    bool forceRefresh = false,
    String? teacherId,
  }) async {
    List<TeacherSubjectResponse> localData = [];

    try {
      localData = await _localService.getAllLocal();
      // Filter lokal jika teacherId disediakan
      if (teacherId != null) {
        localData = localData
            .where((element) => element.teacherId == teacherId)
            .toList();
      }
    } catch (e) {
      print("LOKAL DB READ ERROR: $e");
    }

    if (forceRefresh || localData.isEmpty) {
      try {
        print("INFO: Mengambil data TeacherSubject dari API...");

        // Sesuaikan endpoint API Anda, misal: /teacher-subjects
        final response = await _api.dio.get('/teacher-subjects');

        final List list = response.data['data'] ?? [];
        final apiResults = list
            .map((item) => TeacherSubjectResponse.fromJson(item))
            .toList();

        // Simpan hasil ke Drift (Background process)
        await _localService.bulkInsert(apiResults);

        // Jika sedang filter, return yang sudah difilter dari hasil API
        if (teacherId != null) {
          return apiResults
              .where((element) => element.teacherId == teacherId)
              .toList();
        }

        return apiResults;
      } catch (apiError) {
        print("API ERROR: $apiError");
        return localData;
      }
    }

    return localData;
  }

  /// CREATE
  Future<void> create(CreateTeacherSubjectRequest request) async {
    try {
      await _api.dio.post('/teacher-subjects', data: request.toJson());
      // Refresh data lokal agar sinkron
      await getAll(forceRefresh: true);
    } catch (e) {
      rethrow;
    }
  }

  /// UPDATE
  Future<void> update(String id, UpdateTeacherSubjectRequest request) async {
    try {
      await _api.dio.put('/teacher-subjects/$id', data: request.toJson());
      await getAll(forceRefresh: true);
    } catch (e) {
      rethrow;
    }
  }

  /// DELETE
  Future<void> delete(String id) async {
    try {
      await _api.dio.delete('/teacher-subjects/$id');
      await getAll(forceRefresh: true);
    } catch (e) {
      rethrow;
    }
  }

  /// Helper untuk ambil data lokal secara cepat tanpa hit API
  Future<List<TeacherSubjectResponse>> getLocalData() async {
    return await _localService.getAllLocal();
  }
}
