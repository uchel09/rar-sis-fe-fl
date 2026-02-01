import 'package:get/get.dart' hide Response;
import 'package:rar_sis_fe_fl/app/modules/profile/controllers/profile_controller.dart';
import '../../providers/base_api_service.dart';
import './staff_model.dart';
import 'staff_local_service.dart';
import '../db/database.dart'; // Sesuaikan path database
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter/material.dart';

class StaffService extends GetxService {
  final BaseApiService _api = Get.find<BaseApiService>();

  // Inisialisasi Local Service
  late final StaffLocalService _localService;

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi local service dengan database instance
    _localService = StaffLocalService(Get.find<AppDatabase>());
  }

  // Ambil schoolId dari ProfileController secara reaktif
  String get currentSchoolId => Get.find<ProfileController>().schoolId.value;

  /// GET ALL: Fetch dari API -> Simpan ke Drift -> Return data dari Drift
  Future<List<StaffResponse>> getAll({bool forceRefresh = false}) async {
    // 1. Coba ambil dari DB Lokal dulu (selalu)
    List<StaffResponse> localData = [];

    if (forceRefresh) {
      try {
        print("INFO: Mengambil data dari API...");
        final response = await _api.dio.get('/staffs/$currentSchoolId/school');
        final List list = response.data['data'];
        final apiResults = list
            .map((item) => StaffResponse.fromJson(item))
            .toList();

        // Simpan hasil API ke DB Lokal (Background process)
        _localService
            .bulkInsert(apiResults)
            .catchError((e) => print("DB INSERT ERROR: $e"));

        return apiResults; // Return data segar dari API
      } catch (apiError) {
        print("API ERROR: $apiError");
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
  Future<void> create(CreateStaffRequest request) async {
    print(request);
    var res = await _api.dio.post('/staffs', data: request.toJson());
    if (res.statusCode == 200 || res.statusCode == 201) {
      // Pakai Get.context buat dapet context global GetX
      if (Get.context != null) {
        ShadToaster.of(Get.context!).show(
          ShadToast(
            title: const Text('Staff Berhasil Dibuat'),
            description: Text('Staff ${request.fullName} telah ditambahkan.'),
            action: ShadButton.outline(
              child: const Text('Undo'),
              onPressed: () => ShadToaster.of(Get.context!).hide(),
            ),
          ),
        );
      }
    }
  }

  /// UPDATE
  Future<void> update(String id, UpdateStaffRequest request) async {
    await _api.dio.put('/staffs/$id', data: request.toJson());
  }

  /// DELETE
  Future<void> delete(String id, String schoolId) async {
    await _api.dio.delete('/staffs/$id');
    // Refresh data lokal setelah delete sukses agar ID yang dihapus hilang dari Drift
    await getAll(forceRefresh: true);
  }

  Future<StaffResponse?> getStaffByIdLocal(String id) async {
    return await _localService.getById(id);
  }

  Future<void> deleteLocal() async {
    await _localService.clearAllStaffLocal();
  }
}
