import 'package:get/get.dart' hide Response;
import 'package:rar_sis_fe_fl/app/modules/profile/controllers/profile_controller.dart';
import '../../providers/base_api_service.dart';
import './staff_position_model.dart';
import 'staff_position_local_service.dart';
import '../db/database.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:flutter/material.dart';

class StaffPositionService extends GetxService {
  final BaseApiService _api = Get.find<BaseApiService>();

  // Inisialisasi Local Service
  late final StaffPositionLocalService _localService;

  @override
  void onInit() {
    super.onInit();
    // Inisialisasi local service dengan database instance
    _localService = StaffPositionLocalService(Get.find<AppDatabase>());
  }

  // Ambil schoolId secara reaktif
  String get currentSchoolId => Get.find<ProfileController>().schoolId.value;

  /// GET ALL: Fetch API -> Sync Drift -> Return Data
  Future<List<StaffPositionResponse>> getAll({
    bool forceRefresh = false,
  }) async {
    List<StaffPositionResponse> localData = [];

    if (forceRefresh) {
      try {
        print("INFO: Mengambil data Staff Position dari API...");
        // Endpoint disesuaikan dengan schoolId
        final response = await _api.dio.get(
          '/staff-positions/$currentSchoolId/school',
        );

        final List list = response.data['data'];
        final apiResults = list
            .map((item) => StaffPositionResponse.fromJson(item))
            .toList();

        // Background Sinkronisasi ke Lokal
        _localService
            .bulkInsert(apiResults)
            .catchError((e) => print("DB INSERT ERROR (Position): $e"));

        return apiResults;
      } catch (apiError) {
        print("API ERROR: $apiError");
        return localData;
      }
    } else {
      try {
        localData = await _localService.getAllLocal();
        print("INFO: Mengambil data Staff Position dari Lokal...");
      } catch (e) {
        print("LOKAL DB READ ERROR: $e");
      }
      return localData;
    }
  }

  /// CREATE
  Future<void> create(CreateStaffPositionRequest request) async {
    var res = await _api.dio.post('/staff-positions', data: request.toJson());

    if (res.statusCode == 200 || res.statusCode == 201) {
      if (Get.context != null) {
        ShadToaster.of(Get.context!).show(
          ShadToast(
            title: const Text('Jabatan Berhasil Dibuat'),
            description: Text('Jabatan ${request.name} telah ditambahkan.'),
            action: ShadButton.outline(
              child: const Text('Tutup'),
              onPressed: () => ShadToaster.of(Get.context!).hide(),
            ),
          ),
        );
      }
    }
  }

  /// UPDATE
  Future<void> update(String id, UpdateStaffPositionRequest request) async {
    var res = await _api.dio.put(
      '/staff-positions/$id',
      data: request.toJson(),
    );

    if (res.statusCode == 200) {
      if (Get.context != null) {
        ShadToaster.of(Get.context!).show(
          const ShadToast(
            title: Text('Update Berhasil'),
            description: Text('Data jabatan telah diperbarui.'),
          ),
        );
      }
    }
  }

  /// DELETE
  Future<void> delete(String id) async {
    await _api.dio.delete('/staff-positions/$id');
    // Refresh data lokal agar sinkron
    await getAll(forceRefresh: true);
  }

  /// Get Single from Local
  Future<StaffPositionResponse?> getByIdLocal(String id) async {
    return await _localService.getById(id);
  }

  /// Clear Local Table
  Future<void> clearLocal() async {
    await _localService.clearAllLocal();
  }
}
