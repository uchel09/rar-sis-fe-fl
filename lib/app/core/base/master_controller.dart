import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import '../../services/school_level/school_level_service.dart';
import '../../services/school_level/school_level_model.dart';

class MasterController extends GetxController {
  final SchoolLevelService _levelService = Get.find<SchoolLevelService>();

  // Data yang bakal lo panggil di Multiple Select mana pun
  var allSchoolLevels = <SchoolLevelResponse>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    syncData();

    // Update di sini: result sekarang adalah List<ConnectivityResult>
    Connectivity().onConnectivityChanged.listen((
      List<ConnectivityResult> results,
    ) {
      // Cek apakah ada koneksi aktif (bukan none) di dalam list
      if (results.isNotEmpty && !results.contains(ConnectivityResult.none)) {
        syncData();
      } else {
        print("INTERNET MATI: Menggunakan data lokal.");
      }
    });
  }

  Future<void> syncData() async {
    try {
      isLoading.value = true;
      // HIT API (Force Refresh)
      final data = await _levelService.getAll(forceRefresh: true);
      allSchoolLevels.assignAll(data);
    } catch (e) {
      print("INTERNET MATI/ERROR: Pake data lokal aja");
      // FALLBACK ke LOKAL (Force Refresh: false)
      final localData = await _levelService.getAll(forceRefresh: false);
      allSchoolLevels.assignAll(localData);
    } finally {
      isLoading.value = false;
    }
  }
}
