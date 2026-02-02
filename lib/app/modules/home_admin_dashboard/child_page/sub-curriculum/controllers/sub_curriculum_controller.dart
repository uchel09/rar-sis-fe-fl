import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/core/base/master_controller.dart';
import 'package:rar_sis_fe_fl/app/services/curriculum/curriculum_model.dart';
import 'package:rar_sis_fe_fl/app/services/curriculum/curriculum_service.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:rar_sis_fe_fl/app/services/sub_curriculum/sub_curriculum_model.dart';
import 'package:rar_sis_fe_fl/app/services/sub_curriculum/sub_curriculum_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../core/pluto_core.dart';

class SubCurriculumController extends GetxController {
  final CurriculumService curriculumService = Get.find<CurriculumService>();
  var rows = <PlutoRow>[].obs;
  var isLoading = false.obs;
  var dropdownItems = <DropdownMenuItem<String>>[].obs;
  final isCreate = true.obs;
  final subCurriculumId = "".obs;
  var box = GetStorage();
  final schoolId = "".obs;
  var showActive = true.obs;
  final MasterController masterController = Get.find<MasterController>();

  late List<PlutoColumn> columns;
  final SubCurriculumService _service = Get.find<SubCurriculumService>();
  late GlobalKey<ScaffoldState> scaffoldKey;
  final formKey = GlobalKey<ShadFormState>();
  // List lokal untuk menampung hasil dari service
  var curriculums = <CurriculumResponse>[].obs;
  var selectedCurriculumId = "".obs;
  final nameController = TextEditingController();
  var selectedSchoolLevelId = "".obs;
  @override
  void onInit() {
    super.onInit();
    _initColumns();
    // Load data pertama kali
    Future.microtask(() => fetchAllData());
    fetchLocalCurriculums();
    ever(selectedCurriculumId, (_) {
      if (selectedCurriculumId.value.isNotEmpty) {
        fetchByCurriculum();
      }
    });
    // Worker: Ambil ulang data setiap kali switch showActive berubah
    ever(showActive, (_) => fetchLocalCurriculums());
    Future.microtask(() => fetchByCurriculum());

    // Helper untuk filter dropdown (asumsi Anda punya utility ini di core)
    dropdownItems.value = getColumnDropdownOptions(columns, [
      'id',
      'no',
      'actions',
    ]);
    schoolId.value = box.read("school_id");
  }

  Future<void> fetchLocalCurriculums() async {
    try {
      isLoading.value = true;

      // Ambil langsung dari local service
      final data = await curriculumService.getCurriculumByActiveLocal(
        showActive.value,
      );

      curriculums.assignAll(data);

      // Logika penentuan Tab yang aktif
      if (curriculums.isNotEmpty) {
        // Cek apakah ID yang lama masih ada di list yang baru (setelah filter)
        bool stillExist = curriculums.any(
          (c) => c.id == selectedCurriculumId.value,
        );
        if (!stillExist) {
          selectedCurriculumId.value = curriculums.first.id;
        }
      } else {
        selectedCurriculumId.value = "";
      }
    } catch (e) {
      print("Error fetch local curriculums: $e");
    } finally {
      isLoading.value = false;
    }
  }

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
        title: 'Sub Kurikulum',
        field: 'name',
        type: PlutoColumnType.text(),
        width: 250,
      ),
      PlutoColumn(
        title: 'Jenjang',
        field: 'schoolLevelName',
        type: PlutoColumnType.text(),
        width: 300,
      ),
    ];
  }

  Future<void> fetchAllData({bool forceRefresh = false}) async {
    try {
      isLoading.value = true;
      var data = await _service.getAll(forceRefresh: forceRefresh);
      print("data Get all");
      print(data);
    } catch (e) {
      debugPrint("Error Fetch Sub Kurikulum $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchByCurriculum({bool forceRefresh = false}) async {
    try {
      // 1. Validasi ID
      if (selectedCurriculumId.value.isEmpty) return;

      isLoading.value = true;

      // 2. Jika force refresh, kita kosongkan baris agar UI terupdate
      if (forceRefresh) {
        rows.clear();
      }

      // 3. Panggil service (Mapping manual terjadi di dalam _service.getAllByCurriculum)
      final data = await _service.getAllByCurriculum(
        forceRefresh: forceRefresh,
        curriculumId: selectedCurriculumId.value,
      );

      // 4. Update UI
      _mapToPlutoRows(data);

      debugPrint(
        "Data refreshed for curriculum: ${selectedCurriculumId.value}",
      );
    } catch (e) {
      debugPrint("Error Fetch Sub Kurikulum: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void _mapToPlutoRows(List<SubCurriculumResponse> list) {
    final mappedRows = list.map((item) {
      return PlutoRow(
        cells: {
          'no': PlutoCell(value: ''),
          'id': PlutoCell(value: item.id),
          'name': PlutoCell(value: item.name),
          'schoolLevelName': PlutoCell(value: item.schoolLevel.name),
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
      final request = CreateSubCurriculumRequest(
        name: nameController.text.trim(),
        curriculumId: selectedCurriculumId.value,
        schoolLevelId: selectedSchoolLevelId.value,
      );

      await _service.create(request);
      await fetchByCurriculum(forceRefresh: true);

      scaffoldKey.currentState?.closeEndDrawer();
      clearForm();
    } catch (e) {
      debugPrint("Create Error: $e");
    }
  }

  void onUpdate(Map<String, dynamic> rowData) async {
    final String? id = rowData['id'];
    if (id == null) return;

    subCurriculumId.value = id;
    final data = await _service.getSubByIdLocal(id);

    if (data != null) {
      isCreate.value = false;
      nameController.text = data.name;
      selectedCurriculumId.value = data.curriculumId;
      selectedSchoolLevelId.value = data.schoolLevel.id;

      scaffoldKey.currentState?.openEndDrawer();

      // Delay untuk sinkronisasi ShadForm
      Future.delayed(const Duration(milliseconds: 250), () {
        final state = formKey.currentState;
        if (state != null) {
          state.fields['curriculumId']?.didChange(data.curriculumId);
          state.fields['schoolLevel']?.didChange(data.schoolLevel.id);

          state.validate();
        }
      });
    }
  }

  Future<void> doUpdate() async {
    if (!(formKey.currentState?.saveAndValidate() ?? false)) return;

    try {
      final request = UpdateSubCurriculumRequest(
        name: nameController.text.trim(),
        schoolLevelId: selectedSchoolLevelId.value,
        curriculumId: selectedCurriculumId.value,
      );

      await _service.update(subCurriculumId.value, request);
      await fetchByCurriculum(forceRefresh: true);

      scaffoldKey.currentState?.closeEndDrawer();
      clearForm();
    } catch (e) {
      debugPrint("Update Error: $e");
    }
  }

  void clearForm() {
    nameController.clear();

    formKey.currentState?.reset();
  }
}
