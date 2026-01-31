import 'package:get/get.dart' hide Response;
import 'package:rar_sis_fe_fl/app/modules/profile/controllers/profile_controller.dart';
import '../../providers/base_api_service.dart';
import './student_draft_model.dart';

class StudentDraftService extends GetxService {
  final BaseApiService _api = Get.find<BaseApiService>();
  final ProfileController _profile = Get.find<ProfileController>();

  final String academicYearId = "e85bfe53-1a50-4f24-95c6-a5c1cc966226";
  final String levelId = "dd2615c3-ad53-4d7f-8820-397157dc42cf";

  String get currentSchoolId => _profile.schoolId.value;

  Future<StudentDraftPaginationResponse> getAll({
    int page = 1,
    int limit = 30,
    String? search,
  }) async {
    final url =
        "http://localhost:8080/api/student-drafts/"
        "$currentSchoolId/school/"
        "$levelId/level/"
        "$academicYearId/academic-year";

    final response = await _api.dio.get(
      url,
      queryParameters: {'page': page, 'limit': limit, 'search': search},
    );

    return StudentDraftPaginationResponse.fromJson(response.data);
  }
}
