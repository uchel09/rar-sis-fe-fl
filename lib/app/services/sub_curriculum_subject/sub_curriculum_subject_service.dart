import 'package:get/get.dart' hide Response;
import '../../providers/base_api_service.dart';
import '../db/database.dart';
import 'sub_curriculum_subject_model.dart';
import 'sub_curriculum_subject_local_service.dart';

class SubCurriculumSubjectService extends GetxService {
  final BaseApiService _api = Get.find<BaseApiService>();
  late final SubCurriculumSubjectLocalService _localService;

  @override
  void onInit() {
    super.onInit();
    _localService = SubCurriculumSubjectLocalService(Get.find<AppDatabase>());
  }

  Future<List<SubCurriculumSubjectResponse>> getAllBySubCurriculum(
    String subCurriculumId, {
    bool forceRefresh = false,
  }) async {
    // 1. Cek Lokal
    var localData = await _localService.getAllLocal();
    var filtered = localData
        .where((e) => e.subCurriculumId == subCurriculumId)
        .toList();

    if (forceRefresh || filtered.isEmpty) {
      try {
        // Sesuaikan endpoint API Anda
        final response = await _api.dio.get(
          '/sub-curriculum-subjects/sub-curriculum/$subCurriculumId',
        );
        final List list = response.data['data'] ?? [];
        final apiResults = list
            .map((item) => SubCurriculumSubjectResponse.fromJson(item))
            .toList();

        // 2. Simpan ke Lokal
        await _localService.bulkInsert(apiResults);
        return apiResults;
      } catch (e) {
        return filtered;
      }
    }
    return filtered;
  }

  Future<void> create(CreateSubCurriculumSubjectRequest request) async {
    await _api.dio.post('/sub-curriculum-subjects', data: request.toJson());
    await getAllBySubCurriculum(request.subCurriculumId, forceRefresh: true);
  }

  Future<void> update(
    String id,
    UpdateSubCurriculumSubjectRequest request,
  ) async {
    await _api.dio.put('/sub-curriculum-subjects/$id', data: request.toJson());
    if (request.subCurriculumId != null) {
      await getAllBySubCurriculum(request.subCurriculumId!, forceRefresh: true);
    }
  }

  Future<void> delete(String id, String subCurriculumId) async {
    await _api.dio.delete('/sub-curriculum-subjects/$id');
    await getAllBySubCurriculum(subCurriculumId, forceRefresh: true);
  }
}
