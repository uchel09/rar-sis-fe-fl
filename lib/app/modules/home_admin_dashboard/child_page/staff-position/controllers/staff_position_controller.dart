import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:rar_sis_fe_fl/app/services/staff_position/staff_position_model.dart';
import 'package:rar_sis_fe_fl/app/services/staff_position/staff_position_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../core/pluto_core.dart';

class StaffPositionController extends GetxController {
  // 1. Reactive Variables
  var rows = <PlutoRow>[].obs;
  var isLoading = false.obs;
  var dropdownItems = <DropdownMenuItem<String>>[].obs;
  final isCreate = true.obs;
  final positionId = "".obs;
  var box = GetStorage();
  final schoolId = "".obs;

  // 2. Services & Key
  late List<PlutoColumn> columns;
  final StaffPositionService _service = Get.find<StaffPositionService>();
  late GlobalKey<ScaffoldState> scaffoldKey;
  final formKey = GlobalKey<ShadFormState>();

  // 3. Form Controllers
  final nameController = TextEditingController();
  final descController = TextEditingController();
  final isActive = true.obs;

  void bindScaffold(GlobalKey<ScaffoldState> key) {
    scaffoldKey = key;
  }

  @override
  void onInit() {
    _initColumns();
    Future.microtask(() => fetchData());

    // Helper untuk filter dropdown (asumsi Anda punya utility ini di core)
    dropdownItems.value = getColumnDropdownOptions(columns, [
      'id',
      'no',
      'actions',
    ]);
    schoolId.value = box.read("school_id");
    super.onInit();
  }

  // 4. Konfigurasi Kolom PlutoGrid
  void _initColumns() {
    columns = [
      PlutoColumn(
        title: 'NO',
        field: 'no',
        type: PlutoColumnType.text(),
        width: 60,
        enableSorting: false,
        renderer: (rendererContext) {
          int nomorUrut =
              ((rendererContext.stateManager.page - 1) *
                  rendererContext.stateManager.pageSize) +
              rendererContext.rowIdx +
              1;
          return Center(
            child: Text(
              nomorUrut.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
      ),
      PlutoColumn(
        title: 'Nama Jabatan',
        field: 'name',
        type: PlutoColumnType.text(),
        width: 250,
      ),
      PlutoColumn(
        title: 'Deskripsi',
        field: 'description',
        type: PlutoColumnType.text(),
        width: 300,
      ),
      PlutoColumn(
        title: 'Status',
        field: 'isActive',
        type: PlutoColumnType.text(),
        width: 120,
      ),
      PlutoColumn(
        title: 'Actions',
        field: 'actions',
        type: PlutoColumnType.text(),
        width: 150,
        renderer: (rendererContext) {
          return Row(
            children: [
              IconButton(
                icon: const Icon(Icons.edit, size: 18, color: Colors.blue),
                onPressed: () => onUpdate(rendererContext.row.toJson()),
              ),
              IconButton(
                icon: const Icon(Icons.delete, size: 18, color: Colors.red),
                onPressed: () => doDelete(rendererContext.row.toJson()),
              ),
            ],
          );
        },
      ),
    ];
  }

  // 5. Fetch Data
  Future<void> fetchData({bool forceRefresh = false}) async {
    try {
      isLoading.value = true;
      final data = await _service.getAll(forceRefresh: forceRefresh);
      _mapToPlutoRows(data);
    } catch (e) {
      debugPrint("Error Fetch Staff Position: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void _mapToPlutoRows(List<StaffPositionResponse> list) {
    final mappedRows = list.map((item) {
      return PlutoRow(
        cells: {
          'no': PlutoCell(value: ''),
          'id': PlutoCell(value: item.id),
          'name': PlutoCell(value: item.name),
          'description': PlutoCell(value: item.description),
          'isActive': PlutoCell(value: item.isActive ? 'Aktif' : 'Non-Aktif'),
          'actions': PlutoCell(value: ''),
        },
      );
    }).toList();
    rows.assignAll(mappedRows);
  }

  // 6. CRUD Logic
  void onCreate() {
    clearForm();
    isCreate.value = true;
    scaffoldKey.currentState?.openEndDrawer();
  }

  Future<void> doCreate() async {
    if (!(formKey.currentState?.saveAndValidate() ?? false)) return;

    try {
      final request = CreateStaffPositionRequest(
        name: nameController.text.trim(),
        description: descController.text.trim(),
        schoolId: schoolId.value,
        isActive: isActive.value,
      );

      await _service.create(request);
      await fetchData(forceRefresh: true);

      scaffoldKey.currentState?.closeEndDrawer();
      clearForm();
    } catch (e) {
      debugPrint("Create Error: $e");
    }
  }

  void onUpdate(Map<String, dynamic> rowData) async {
    final String? id = rowData['id'];
    if (id == null) return;

    positionId.value = id;
    final data = await _service.getByIdLocal(id);

    if (data != null) {
      isCreate.value = false;
      nameController.text = data.name;
      descController.text = data.description;
      isActive.value = data.isActive;

      scaffoldKey.currentState?.openEndDrawer();

      // Delay untuk sinkronisasi ShadForm
      Future.delayed(const Duration(milliseconds: 250), () {
        formKey.currentState?.fields['isActive']?.didChange(data.isActive);
        formKey.currentState?.validate();
      });
    }
  }

  Future<void> doUpdate() async {
    if (!(formKey.currentState?.saveAndValidate() ?? false)) return;

    try {
      final request = UpdateStaffPositionRequest(
        name: nameController.text.trim(),
        description: descController.text.trim(),
        isActive: isActive.value,
      );

      await _service.update(positionId.value, request);
      await fetchData(forceRefresh: true);

      scaffoldKey.currentState?.closeEndDrawer();
      clearForm();
    } catch (e) {
      debugPrint("Update Error: $e");
    }
  }

  Future<void> doDelete(Map<String, dynamic> rowData) async {
    final id = rowData['id'];
    final name = rowData['name'];

    // Tampilkan konfirmasi atau langsung delete
    await _service.delete(id);
    await fetchData(forceRefresh: true);

    Get.snackbar("Sukses", "Jabatan $name berhasil dihapus");
  }

  void clearForm() {
    nameController.clear();
    descController.clear();
    isActive.value = true;
    formKey.currentState?.reset();
  }

  void onRefresh() => fetchData(forceRefresh: true);
}
