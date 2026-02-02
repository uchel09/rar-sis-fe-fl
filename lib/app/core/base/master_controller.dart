import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:rar_sis_fe_fl/app/services/curriculum/curriculum_model.dart';
import 'package:rar_sis_fe_fl/app/services/curriculum/curriculum_service.dart';
import 'package:rar_sis_fe_fl/app/services/staff_position/staff_position_model.dart';
import 'package:rar_sis_fe_fl/app/services/staff_position/staff_position_service.dart';
import '../../services/school_level/school_level_service.dart';
import '../../services/school_level/school_level_model.dart';
import 'package:get_storage/get_storage.dart';

class MasterController extends GetxController {
  final SchoolLevelService _schoolLevelService = Get.find<SchoolLevelService>();
  final StaffPositionService _staffPositionService =
      Get.find<StaffPositionService>();
  final CurriculumService _curriculumService = Get.find<CurriculumService>();
  final box = GetStorage();
  var allSchoolLevels = <SchoolLevelResponse>[].obs;
  var allCurriculums = <CurriculumResponse>[].obs;
  var allStaffPositions = <StaffPositionResponse>[].obs;
  var profileSchoolLevels = <SchoolLevelResponse>[].obs;
  var levelAccessProfileId = "".obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    // Panggil sekali di awal

    Future.microtask(() => _loadProfileAccess());
    Future.microtask(() => syncAllMasterData());

    Connectivity().onConnectivityChanged.listen((results) {
      if (results.isNotEmpty && !results.contains(ConnectivityResult.none)) {
        // Hanya sync ulang jika sedang tidak loading untuk menghindari spam
        if (!isLoading.value) {
          Future.microtask(() => syncAllMasterData());
        }
      }
    });
  }

  void _loadProfileAccess() async {
    final storedData = await box.read("profile_school_level_access");

    if (storedData != null && storedData is List) {
      profileSchoolLevels.assignAll(
        storedData.map((e) => SchoolLevelResponse.fromJson(e)).toList(),
      );

      // Set initial value jika belum terpilih
      if (profileSchoolLevels.isNotEmpty &&
          levelAccessProfileId.value.isEmpty) {
        levelAccessProfileId.value = profileSchoolLevels.first.id;
      }
    }
  }

  Future<void> syncAllMasterData() async {
    try {
      isLoading.value = true;

      // Menjalankan kedua fungsi secara paralel
      await Future.wait([
        _fetchSchoolLevels(),
        _fetchStaffPositions(),
        _fetchCurriculums(),
      ]);
    } finally {
      isLoading.value = false;
    }
  }

  // Fungsi internal yang menangani logic try-catch masing-masing
  Future<void> _fetchSchoolLevels() async {
    try {
      final data = await _schoolLevelService.getAll(forceRefresh: true);
      allSchoolLevels.assignAll(data);
    } catch (e) {
      final local = await _schoolLevelService.getAll(forceRefresh: false);
      allSchoolLevels.assignAll(local);
    }
  }

  Future<void> _fetchStaffPositions() async {
    try {
      final data = await _staffPositionService.getAll(forceRefresh: true);
      allStaffPositions.assignAll(data);
    } catch (e) {
      final local = await _staffPositionService.getAll(forceRefresh: false);
      allStaffPositions.assignAll(local);
    }
  }

  Future<void> _fetchCurriculums() async {
    try {
      await _curriculumService.getAll(forceRefresh: true);
      final data = await _curriculumService.getAll();
      allCurriculums.assignAll(data);
    } catch (e) {
      final local = await _curriculumService.getAll();
      allCurriculums.assignAll(local);
    }
  }
}
