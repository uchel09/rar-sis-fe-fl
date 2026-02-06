import 'dart:convert';
import 'package:get/get.dart' hide Response;
import 'package:rar_sis_fe_fl/app/modules/profile/controllers/profile_controller.dart';
import '../../providers/base_api_service.dart';
import '../db/database.dart';
import './teacher_subject_model.dart';
import 'teacher_subject_local_service.dart';

class TeacherSubjectService extends GetxService {
  final BaseApiService _api = Get.find<BaseApiService>();
  late final TeacherSubjectLocalService _localService;

  @override
  void onInit() {
    super.onInit();
    _localService = TeacherSubjectLocalService(Get.find<AppDatabase>());
  }

  String get currentSchoolId => Get.find<ProfileController>().schoolId.value;

  /// [GET ALL] Ambil semua data Guru-Mapel di satu sekolah
  /// Berguna untuk rekap admin atau sinkronisasi awal
  Future<List<TeacherSubjectResponse>> getAll({
    bool forceRefresh = false,
  }) async {
    List<TeacherSubjectResponse> localData = [];

    try {
      localData = await _localService
          .getAllLocal(); // Pastikan method ini ada di local_service
    } catch (e) {
      print("LOKAL DB READ ERROR: $e");
    }

    if (forceRefresh || localData.isEmpty) {
      try {
        print("INFO: Mengambil semua data Teacher-Subject API...");
        // Endpoint ini biasanya untuk list semua tanpa filter level
        final response = await _api.dio.get(
          '/teacher-subjects/$currentSchoolId/school',
        );

        final List list = response.data['data'] ?? [];
        final apiResults = list
            .map((item) => TeacherSubjectResponse.fromJson(item))
            .toList();

        // Simpan massal ke local
        await _localService.bulkInsert(apiResults);

        return apiResults;
      } catch (e) {
        print("API ERROR: $e");
        return localData;
      }
    }
    return localData;
  }

  /// [GET BY LEVEL] Spesifik per kelas (Fase A/B/C)
  Future<List<TeacherSubjectResponse>> getBySchoolLevel({
    bool forceRefresh = false,
    required String schoolLevelId,
  }) async {
    List<TeacherSubjectResponse> localData = [];

    try {
      localData = await _localService.getBySchoolLevelLocal(schoolLevelId);
    } catch (e) {
      print("LOKAL DB READ ERROR: $e");
    }

    if (forceRefresh || localData.isEmpty) {
      try {
        final response = await _api.dio.get(
          '/teacher-subjects/$currentSchoolId/school/$schoolLevelId/level',
        );

        final List list = response.data['data'] ?? [];
        final apiResults = list
            .map((item) => TeacherSubjectResponse.fromJson(item))
            .toList();

        await _localService.bulkInsertBySchoolLevelId(apiResults);
        return apiResults;
      } catch (e) {
        return localData;
      }
    }
    return localData;
  }

  Future<List<TeacherSubjectResponse>> getByTeacherId({
    bool forceRefresh = false,
    required String teacherId,
  }) async {
    List<TeacherSubjectResponse> localData = [];

    try {
      localData = await _localService.getByTeacherIdLocal(teacherId);
    } catch (e) {
      print("LOKAL DB READ ERROR: $e");
    }

    if (forceRefresh || localData.isEmpty) {
      try {
        final response = await _api.dio.get(
          '/teacher-subjects/$teacherId/tacher',
        );

        final List list = response.data['data'] ?? [];
        final apiResults = list
            .map((item) => TeacherSubjectResponse.fromJson(item))
            .toList();

        await _localService.bulkInsertByTeacherId(apiResults);
        return apiResults;
      } catch (e) {
        return localData;
      }
    }
    return localData;
  }

  /// [CREATE]
  Future<void> create(CreateTeacherSubjectRequest request) async {
    try {
      await _api.dio.post('/teacher-subjects', data: request.toJson());
    } catch (e) {
      rethrow;
    }
  }

  /// [UPDATE]
  Future<void> updateTeacherSubject(
    String id,
    UpdateTeacherSubjectRequest request,
  ) async {
    try {
      await _api.dio.put('/teacher-subjects/$id', data: request.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<TeacherSubjectResponse?> getByIdLocal(String id) async {
    return await _localService.getByIdLocal(id);
  }

  Future<List<TeacherSubjectResponse>> getAllSubjectNameIsParentLocal(
    String name,
    bool isParent,
  ) async {
    return await _localService.getAllSubjectNameIsParentLocal(name, isParent);
  }

  /// [DELETE]
  Future<void> delete(String id) async {
    try {
      await _api.dio.delete('/teacher-subjects/$id');
    } catch (e) {
      rethrow;
    }
  }
}
