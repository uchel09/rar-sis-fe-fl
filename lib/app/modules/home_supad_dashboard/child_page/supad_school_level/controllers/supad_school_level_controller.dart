import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rar_sis_fe_fl/app/core/base/master_controller.dart';
import 'package:rar_sis_fe_fl/app/services/school_level/school_level_service.dart';
import 'package:rar_sis_fe_fl/app/services/school_level/school_level_model.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
// import '../../../../../widgets/row_detail_modal.dart';
import '../../../../../core/pluto_core.dart';
import 'package:get/get.dart' as g;

class SupadSchoolLevelController extends GetxController {
  // 1. Reactive Variables
  var box = GetStorage();
  var rows = <PlutoRow>[].obs;
  var isLoading = false.obs;
  var dropdownItems = <DropdownMenuItem<String>>[].obs;
  // 2. Definisi Kolom (Late karena butuh context/init)
  late List<PlutoColumn> columns;
  final SchoolLevelService _service = Get.find<SchoolLevelService>();
  final MasterController _master = Get.find<MasterController>();

  //form
  late GlobalKey<ScaffoldState> scaffoldKey;
  final formKey = GlobalKey<ShadFormState>();
  final isCreate = false.obs;
  final schoolId = "".obs;
  final nameController = TextEditingController();

  // Boolean States (Default true/false)
  final isActive = true.obs;
  final isMajor = false.obs;
  final isEnrollmentNumber = false.obs;

  // Untuk penanda mode Update
  final levelId = "".obs;

  void clearForm() {
    nameController.clear();
    isActive.value = true;
    isMajor.value = false;
    isEnrollmentNumber.value = false;
  }

  void bindScaffold(GlobalKey<ScaffoldState> key) {
    scaffoldKey = key;
  }

  @override
  void onInit() {
    _initColumns();
    Future.microtask(() => fetchData());
    dropdownItems.value = getColumnDropdownOptions(
      columns,
      ['id', 'no', 'actions'], // field yang dilarang
    );
    schoolId.value = box.read("school_id");
    super.onInit();
  }

  // 3. Konfigurasi Kolom & Renderer Action
  void _initColumns() {
    columns = [
      // 1. NO
      PlutoColumn(
        title: 'NO',
        field: 'no',
        type: PlutoColumnType.text(),
        width: 60,
        enableSorting: false,
        renderer: (rendererContext) {
          return Center(
            child: Text(
              (rendererContext.rowIdx + 1).toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
      ),

      // 2. Nama Jenjang
      PlutoColumn(
        title: 'Nama Jenjang',
        field: 'name',
        type: PlutoColumnType.text(),
        width: 200,
      ),

      // 3. Status Aktif (Badge Style)
      PlutoColumn(
        title: 'Status',
        field: 'isActive',
        type: PlutoColumnType.text(),
        width: 120,
        renderer: (rendererContext) {
          final bool active = rendererContext.cell.value as bool;
          return Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: active
                    ? const Color(0xFFDCFCE7)
                    : const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: active
                      ? const Color(0xFF22C55E)
                      : const Color(0xFF94A3B8),
                ),
              ),
              child: Text(
                active ? 'Aktif' : 'Non-Aktif',
                style: TextStyle(
                  color: active
                      ? const Color(0xFF166534)
                      : const Color(0xFF475569),
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        },
      ),

      // 4. Memiliki Jurusan? (Icon Style)
      PlutoColumn(
        title: 'Jurusan',
        field: 'isMajor',
        type: PlutoColumnType.text(),
        width: 100,
        renderer: (rendererContext) {
          final bool isMajor = rendererContext.cell.value as bool;
          return Icon(
            isMajor ? Icons.check_circle_outline : Icons.highlight_off,
            color: isMajor ? Colors.blue : Colors.grey,
            size: 20,
          );
        },
      ),

      // 5. No. Pendaftaran?
      PlutoColumn(
        title: 'No. Daftar',
        field: 'isEnrollmentNumber',
        type: PlutoColumnType.text(),
        width: 110,
        renderer: (rendererContext) {
          final bool isEnroll = rendererContext.cell.value as bool;
          return Icon(
            isEnroll
                ? Icons.assignment_turned_in_outlined
                : Icons.remove_circle_outline,
            color: isEnroll ? Colors.orange : Colors.grey,
            size: 20,
          );
        },
      ),

      // 6. Actions
      PlutoColumn(
        title: 'Actions',
        field: 'actions',
        type: PlutoColumnType.text(),
        width: 140,
        enableSorting: false,
        renderer: (rendererContext) {
          return Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.edit_outlined,
                  size: 18,
                  color: Colors.blue,
                ),
                onPressed: () => onUpdate(rendererContext.row.toJson()),
              ),
              IconButton(
                icon: const Icon(
                  Icons.delete_outline,
                  size: 18,
                  color: Colors.red,
                ),
                onPressed: () => doDelete(rendererContext.row.toJson()),
              ),
            ],
          );
        },
      ),
    ];
  }

  // 4. Fetch Data & Mapping Manual (Langsung di sini)
  Future<void> fetchData({bool forceRefresh = false}) async {
    try {
      isLoading.value = true;
      final localData = await _service.getAll(forceRefresh: forceRefresh);
      if (localData.isNotEmpty) {
        _master.allSchoolLevels.assignAll(localData);
        _mapToPlutoRows(localData);
      } else {
        final freshData = await _service.getAll(forceRefresh: true);
        _master.allSchoolLevels.assignAll(freshData);
        _mapToPlutoRows(freshData);
      }
    } catch (e) {
      print("error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Mapping ke PlutoRow: Fokus hanya pada konversi ke View/Tabel
  void _mapToPlutoRows(List<SchoolLevelResponse> data) {
    final mappedRows = data.map((item) {
      return PlutoRow(
        cells: {
          'no': PlutoCell(value: ''),
          'id': PlutoCell(value: item.id),
          'name': PlutoCell(value: item.name),
          'isActive': PlutoCell(value: item.isActive), // Boolean
          'isMajor': PlutoCell(value: item.isMajor), // Boolean
          'isEnrollmentNumber': PlutoCell(
            value: item.isEnrollmentNumber,
          ), // Boolean
          'actions': PlutoCell(value: ''),
        },
      );
    }).toList();
    rows.assignAll(mappedRows);
  }
  // 5. CRUD Logic

  void onCreate() {
    clearForm();
    isCreate.value = true;
    scaffoldKey.currentState?.openEndDrawer();
  }

  Future<void> doCreate() async {
    // 1. Validasi Form (Trigger error merah di UI)
    if (!(formKey.currentState?.saveAndValidate() ?? false)) return;

    try {
      // 2. Mapping Manual dari Controller ke Model Request
      // Kita pakai "!" karena sudah divalidasi oleh ShadForm (tidak mungkin null)
      final request = CreateSchoolLevelRequest(
        schoolId: schoolId.value,
        name: nameController.text.trim(),
        isActive: isActive.value,
        isMajor: isMajor.value,
        isEnrollmentNumber: isEnrollmentNumber.value,
      );

      await _service.create(request);
      await fetchData(forceRefresh: true);
      // 3. Tembak ke Service

      print("Payload siap kirim: ${request.toJson()}");

      // Close Drawer & Reset
      scaffoldKey.currentState?.closeEndDrawer();
      clearForm();

      // Tampilkan notifikasi sukses
      // ShadToaster.show(const ShadToast(description: Text('Admin berhasil dibuat!')));
    } catch (e) {
      print("Error pas mapping/simpan: $e");
    }
  }

  void onUpdate(Map<String, dynamic> rowData) async {
    final String? id = rowData['id'];
    if (id == null) return;
    levelId.value = id;
    final schoolLevel = await _service.getBySchoolLevelIdLocal(id);

    if (schoolLevel != null) {
      isCreate.value = false;
      clearForm();
      nameController.text = schoolLevel.name;
      isActive.value = schoolLevel.isActive;
      isMajor.value = schoolLevel.isMajor;
      isEnrollmentNumber.value = schoolLevel.isEnrollmentNumber;

      // 1. Buka Drawer dulu agar widget-nya teregistrasi di UI
      scaffoldKey.currentState?.openEndDrawer();

      // 2. FORCE UPDATE STATE UNTUK PICKER & SELECT
      // Kasih delay 200-300ms supaya drawer sudah terbuka sempurna
      Future.delayed(const Duration(milliseconds: 250), () {
        final state = formKey.currentState;
        if (state != null) {
          state.fields['name']?.didChange(schoolLevel.name);
          state.fields['isActive']?.didChange(schoolLevel.isActive);
          state.fields['isEnrollmentNumber']?.didChange(
            schoolLevel.isEnrollmentNumber,
          );
          state.fields['isMajor']?.didChange(schoolLevel.isMajor);

          state.validate();
        }
      });
    }
  }

  Future<void> doUpdate() async {
    print("do updateeeeeeeeeeeeeeeeeee ${levelId.value}");
    // 1. Validasi Form (Trigger error merah di UI)
    if (!(formKey.currentState?.saveAndValidate() ?? false)) return;

    try {
      // 2. Mapping Manual dari Controller ke Model Request
      // Kita pakai "!" karena sudah divalidasi oleh ShadForm (tidak mungkin null)
      final request = UpdateSchoolLevelRequest(
        name: nameController.text.trim(),
        isActive: isActive.value,
        isEnrollmentNumber: isEnrollmentNumber.value,
        isMajor: isMajor.value,
      );

      await _service.update(levelId.value, request);
      await fetchData(forceRefresh: true);

      // 3. Tembak ke Service

      print("Payload siap kirim: ${request.toJson()}");

      // Close Drawer & Reset
      scaffoldKey.currentState?.closeEndDrawer();
      clearForm();

      // Tampilkan notifikasi sukses
      // ShadToaster.show(const ShadToast(description: Text('Admin berhasil dibuat!')));
    } catch (e) {
      print("Error pas mapping/simpan: $e");
    }
  }

  void doDelete(Map<String, dynamic> data) {
    // Contoh delete lokal (offline)
    rows.removeWhere((row) => row.cells['id']?.value == data['id']);
    Get.snackbar(
      "Delete",
      "Berhasil menghapus ${data['name']}",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void onRefresh() {
    fetchData(forceRefresh: true);
  }

  void onExport() async {
    print("delete local");
    _service.deleteLocal();
  }
}
