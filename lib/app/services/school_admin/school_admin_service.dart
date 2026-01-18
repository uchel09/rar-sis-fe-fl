import 'package:get/get.dart' hide Response;
import '../../providers/base_api_service.dart';

import './school_admin_model.dart';

import 'package:get_storage/get_storage.dart'; // Tambahkan ini

class SchoolAdminService extends GetxService {
  final BaseApiService _api = Get.find<BaseApiService>();

  // Inisialisasi GetStorage
  final _storage = GetStorage();
  final String _storageKey = 'cached_school_admins';

  final _adminList = <SchoolAdminResponse>[].obs;
  List<SchoolAdminResponse> get adminList => _adminList;

  bool _isFetched = false;

  @override
  void onInit() {
    super.onInit();
    // 1. Saat service pertama kali jalan, muat data dari HP ke memori RAM
    _loadFromStorage();
  }

  // Fungsi internal untuk membaca storage
  void _loadFromStorage() {
    final rawData = _storage.read(_storageKey);
    if (rawData != null) {
      final List list = rawData;
      _adminList.assignAll(
        list.map((item) => SchoolAdminResponse.fromJson(item)).toList(),
      );
      _isFetched = true; // Tandai sudah ada data (meskipun dari cache)
    }
  }

  // Fungsi internal untuk menyimpan ke HP
  void _saveToStorage() {
    final dataToSave = _adminList.map((item) => item.toJson()).toList();
    _storage.write(_storageKey, dataToSave);
  }

  /// GET ALL (Mirip Query dengan caching permanen)
  Future<List<SchoolAdminResponse>> getAll(
    String schoolId, {
    bool forceRefresh = false,
  }) async {
    // Jika data sudah ada (baik dari storage atau RAM) dan tidak force refresh
    if (_isFetched && !forceRefresh) {
      return _adminList;
    }

    final response = await _api.dio.get('/school-admins/$schoolId/school');
    final List list = response.data['data'];

    final results = list
        .map((item) => SchoolAdminResponse.fromJson(item))
        .toList();

    // 2. Update state di RAM
    _adminList.assignAll(results);
    _isFetched = true;

    // 3. Simpan ke Storage Permanen (HP)
    _saveToStorage();

    return _adminList;
  }

  /// CREATE
  Future<void> create(CreateSchoolAdminRequest request) async {
    await _api.dio.post('/school-admins', data: request.toJson());
    // Invalidate & Sinkronkan ulang
    await getAll(request.schoolId, forceRefresh: true);
  }

  /// UPDATE
  Future<void> update(
    String id,
    UpdateSchoolAdminRequest request,
    String schoolId,
  ) async {
    await _api.dio.put('/school-admins/$id', data: request.toJson());
    // Invalidate & Sinkronkan ulang
    await getAll(schoolId, forceRefresh: true);
  }

  /// DELETE
  Future<void> delete(String id, String schoolId) async {
    await _api.dio.delete('/school-admins/$id');
    // Invalidate & Sinkronkan ulang
    await getAll(schoolId, forceRefresh: true);
  }

  /// Opsional: Hapus cache saat logout
  void clearCache() {
    _storage.remove(_storageKey);
    _adminList.clear();
    _isFetched = false;
  }
}
