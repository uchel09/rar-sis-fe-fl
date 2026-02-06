import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' as g;
import 'package:get_storage/get_storage.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:rar_sis_fe_fl/app/core/base/master_controller.dart';
import 'package:rar_sis_fe_fl/app/services/subject/subject_model.dart';
import 'package:rar_sis_fe_fl/app/services/subject/subject_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../../../core/pluto_core.dart';

class SubjectController extends GetxController {
  final SubjectService _service = Get.find<SubjectService>();
  final MasterController masterController = Get.find<MasterController>();

  // --- State Management ---
  var rows = <PlutoRow>[].obs;
  var isLoading = false.obs;
  var dropdownItems = <DropdownMenuItem<String>>[].obs;
  final isCreate = true.obs;
  final subjectId = "".obs;
  final isParent = false.obs;
  var box = GetStorage();
  final schoolId = "".obs;

  // --- Tab & Selection State ---
  final selectedLevelId = "".obs; // ID Jenjang untuk filtering Tab
  var selectedAccessLevelIds = <String>[].obs; // Untuk Multi-select di Form

  // --- UI & Form ---
  late List<PlutoColumn> columns;
  late GlobalKey<ScaffoldState> scaffoldKey;
  final formKey = GlobalKey<ShadFormState>();
  final nameController = TextEditingController();
  final subNameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _initColumns();
    _initialLoad();

    // Worker: Refresh data otomatis saat Tab Jenjang berubah
    ever(selectedLevelId, (_) {
      if (selectedLevelId.value.isNotEmpty) fetchBySchoolLevel();
    });

    // Helper dropdown options untuk PlutoGrid
    dropdownItems.value = getColumnDropdownOptions(columns, [
      'id',
      'no',
      'actions',
    ]);

    schoolId.value = box.read("school_id") ?? "";
  }

  Future<void> _initialLoad() async {
    await _service.getAll(forceRefresh: true);
    await fetchBySchoolLevel();

    // 2. Set default tab ke jenjang pertama milik user
    if (masterController.profileSchoolLevels.isNotEmpty) {
      selectedLevelId.value = masterController.profileSchoolLevels.first.id;
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
        renderer: (ctx) => Center(
          child: Text(
            (ctx.rowIdx + 1).toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      PlutoColumn(
        title: 'Mata Pelajaran',
        field: 'name',
        type: PlutoColumnType.text(),
        width: 250,
      ),
      PlutoColumn(
        title: 'Sub Mapel',
        field: 'subName',
        type: PlutoColumnType.text(),
        width: 250,
      ),
      PlutoColumn(
        title: 'Subject Induk',
        field: 'isParent',
        type: PlutoColumnType.text(),
        width: 250,
      ),
      PlutoColumn(
        title: 'Akses Jenjang',
        field: 'schoolLevelAccess',
        type: PlutoColumnType.text(),
        width: 350,
        renderer: (ctx) {
          String val = ctx.cell.value.toString();
          if (val == '-' || val.isEmpty) return const Center(child: Text('-'));
          List<String> items = val.split(', ');
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: items.map((e) => _buildLevelBadge(e)).toList(),
            ),
          );
        },
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
                icon: const Icon(
                  Icons.delete,
                  size: 18,
                  color: Colors.red,
                ), // Ubah ke delete
                onPressed: () =>
                    confirmDelete(rendererContext.row.cells['id']?.value),
              ),
            ],
          );
        },
      ),
    ];
  }

  Widget _buildLevelBadge(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.blue,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// Fetch data dari local Drift dengan filter LIKE %levelId%
  Future<void> fetchBySchoolLevel({bool forceRefresh = false}) async {
    try {
      if (selectedLevelId.value.isEmpty) return;
      isLoading.value = true;

      final data = await _service.getAllBySchoolLevel(
        schoolLevelId: selectedLevelId.value,
        forceRefresh: forceRefresh,
      );

      _mapToPlutoRows(data);
    } catch (e) {
      debugPrint("Error Fetch Subject: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void _mapToPlutoRows(List<SubjectResponse> list) {
    final mappedRows = list.map((item) {
      final accessNames = item.schoolLevelAccess.map((e) => e.name).join(', ');
      return PlutoRow(
        cells: {
          'no': PlutoCell(value: ''),
          'id': PlutoCell(value: item.id),
          'name': PlutoCell(value: item.name),
          'isParent': PlutoCell(value: item.isParent),
          'subName': PlutoCell(
            value: item.subName.isEmpty ? '-' : item.subName,
          ),
          'schoolLevelAccess': PlutoCell(
            value: accessNames.isEmpty ? '-' : accessNames,
          ),
          'actions': PlutoCell(value: ''),
        },
      );
    }).toList();

    rows.assignAll(mappedRows);
  }

  // --- CRUD Logic ---

  void onCreate() {
    clearForm();
    isCreate.value = true;
    scaffoldKey.currentState?.openEndDrawer();
  }

  Future<void> doCreate() async {
    if (!(formKey.currentState?.saveAndValidate() ?? false)) return;

    try {
      final request = CreateSubjectRequest(
        name: nameController.text.trim(),
        subName: subNameController.text.trim(),
        schoolId: schoolId.value,
        isParent: isParent.value,
        schoolLevelAccessIds: selectedAccessLevelIds,
      );
      print("Create Subject====================");
      print(request.subName);

      await _service.create(request);
      await fetchBySchoolLevel(forceRefresh: true);

      scaffoldKey.currentState?.closeEndDrawer();
      clearForm();
    } catch (e) {
      debugPrint("Create Error: $e");
    }
  }

  void onUpdate(Map<String, dynamic> rowData) async {
    final String? id = rowData['id'];
    if (id == null) return;

    subjectId.value = id;
    final data = await _service.getSubjectByIdLocal(id);

    if (data != null) {
      isCreate.value = false;
      isParent.value = data.isParent;
      nameController.text = data.name;
      subNameController.text = data.subName;
      selectedAccessLevelIds.assignAll(data.schoolLevelAccess.map((e) => e.id));

      scaffoldKey.currentState?.openEndDrawer();

      // Sinkronisasi ShadForm
      Future.delayed(const Duration(milliseconds: 250), () {
        final state = formKey.currentState;
        if (state != null) {
          state.fields['accessLevels']?.didChange(
            selectedAccessLevelIds.toList(),
          );
          state.validate();
        }
      });
    }
  }

  Future<void> doUpdate() async {
    if (!(formKey.currentState?.saveAndValidate() ?? false)) return;

    try {
      final request = UpdateSubjectRequest(
        name: nameController.text.trim(),
        subName: subNameController.text.trim(),
        isParent: isParent.value,
        schoolLevelAccessIds: selectedAccessLevelIds,
      );
      print(request.toJson());
      await _service.updateSubject(subjectId.value, request);
      await fetchBySchoolLevel(forceRefresh: true);

      scaffoldKey.currentState?.closeEndDrawer();
      clearForm();
    } catch (e) {
      debugPrint("Update Error: $e");
    }
  }

  void confirmDelete(String? id) {
    if (id == null || id.isEmpty) return;
    showShadDialog(
      context: g.Get.context!,
      barrierDismissible: false,
      builder: (context) => ShadDialog(
        title: const Text("Delete Subject"),
        description: const Text("Apakah anda yakin menghapus data ini?"),
        actions: [
          ShadButton.outline(
            child: const Text('Batal'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ShadButton.destructive(
            child: const Text('Hapus Sekarang'),
            onPressed: () async {
              await doDelete(id); // Jalankan fungsi delete
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Future<void> doDelete(String id) async {
    try {
      await _service.deleteSubject(id);
      await fetchBySchoolLevel(forceRefresh: true);
    } catch (e) {
      debugPrint("Delete Error: $e");
    }
  }

  void clearForm() {
    nameController.clear();
    selectedAccessLevelIds.clear();
    isParent.value = false;
    subNameController.clear();
    formKey.currentState?.reset();
  }
}
