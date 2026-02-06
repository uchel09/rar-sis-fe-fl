import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:rar_sis_fe_fl/app/core/base/master_controller.dart';
import 'package:rar_sis_fe_fl/app/services/subject/subject_model.dart';
import 'package:rar_sis_fe_fl/app/services/subject/subject_service.dart';
import 'package:rar_sis_fe_fl/app/services/teacher/teacher_model.dart';
import 'package:rar_sis_fe_fl/app/services/teacher/teacher_service.dart';
import 'package:rar_sis_fe_fl/app/services/teacher_subject/teacher_subject_model.dart';
import 'package:rar_sis_fe_fl/app/services/teacher_subject/teacher_subject_service.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../../../core/pluto_core.dart';

class TeacherSubjectController extends GetxController {
  final TeacherSubjectService service = Get.find<TeacherSubjectService>();
  final TeacherService _teacherService = Get.find<TeacherService>();
  final SubjectService _subjectService = Get.find<SubjectService>();
  final MasterController masterController = Get.find<MasterController>();

  // --- State Management ---
  var rows = <PlutoRow>[].obs;
  var isLoading = false.obs;
  var dropdownItems = <DropdownMenuItem<String>>[].obs;
  var teachers = <TeacherResponse>[].obs;
  var subjects = <SubjectResponse>[].obs;
  var parentTeacherSubjects = <TeacherSubjectResponse>[].obs;
  var isVisibleParent = false.obs;
  final isCreate = true.obs;
  final teacherSubjectId = "".obs;
  var box = GetStorage();
  final schoolId = "".obs;

  // --- Tab & Selection State (1-1) ---
  final selectedLevelId = "".obs;
  final selectedTeacherId = "".obs;
  final selectedSubjectId = "".obs;
  final selectedParentId = "".obs; // Buat Agama/Seni

  // --- UI & Form ---
  late List<PlutoColumn> columns;
  late GlobalKey<ScaffoldState> scaffoldKey;
  final formKey = GlobalKey<ShadFormState>();

  @override
  void onInit() {
    super.onInit();
    _initColumns();
    _initialLoad();

    // Worker: Refresh otomatis pas ganti Tab Jenjang
    ever(selectedLevelId, (_) {
      if (selectedLevelId.value.isNotEmpty) {
        fetchBySchoolLevel();
        fetchTeacherBySchoolLevel();
        fetchSubjectBySchoolLevel();
      }
    });
    ever(selectedSubjectId, _handleSubjectChange);

    dropdownItems.value = getColumnDropdownOptions(columns, [
      'id',
      'no',
      'actions',
    ]);

    schoolId.value = box.read("school_id") ?? "";
  }

  Future<void> _initialLoad() async {
    await service.getAll(forceRefresh: true);
    await fetchBySchoolLevel();

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
        title: 'Guru',
        field: 'teacherName',
        type: PlutoColumnType.text(),
        width: 200,
      ),
      PlutoColumn(
        title: 'Mata Pelajaran',
        field: 'subjectName',
        type: PlutoColumnType.text(),
        width: 200,
      ),
      PlutoColumn(
        title: 'Sub Mapel',
        field: 'subjectSubName',
        type: PlutoColumnType.text(),
        width: 180,
      ),
      PlutoColumn(
        title: 'Actions',
        field: 'actions',
        type: PlutoColumnType.text(),
        width: 150,
        renderer: (ctx) => Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit, size: 18, color: Colors.blue),
              onPressed: () => onUpdate(ctx.row.toJson()),
            ),
            IconButton(
              icon: const Icon(Icons.delete, size: 18, color: Colors.red),
              onPressed: () => confirmDelete(ctx.row.cells['id']?.value),
            ),
          ],
        ),
      ),
    ];
  }

  Future<void> fetchBySchoolLevel({bool forceRefresh = false}) async {
    try {
      if (selectedLevelId.value.isEmpty) return;
      isLoading.value = true;

      final data = await service.getBySchoolLevel(
        schoolLevelId: selectedLevelId.value,
        forceRefresh: forceRefresh,
      );

      _mapToPlutoRows(data);
    } catch (e) {
      debugPrint("Error Fetch Teacher Subject: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchTeacherBySchoolLevel({bool forceRefresh = false}) async {
    try {
      if (selectedLevelId.value.isEmpty) return;
      isLoading.value = true;

      // 1. Ambil data (Bisa dari lokal dulu)
      var result = await _teacherService.getAllBySchoolLevelId(
        forceRefresh: forceRefresh, // Pakai parameter dari fungsi
        schoolLevelId: selectedLevelId.value,
      );

      // 2. Jika data kosong dan kita belum sedang forceRefresh, hajar ke API
      if (result.isEmpty && !forceRefresh) {
        print("INFO: Data lokal kosong, fetch ke API...");
        result = await _teacherService.getAllBySchoolLevelId(
          forceRefresh: true,
          schoolLevelId: selectedLevelId.value,
        );
      }

      // 3. Masukkan ke RxList
      teachers.assignAll(result);
    } catch (e) {
      debugPrint("Error Fetch Teacher: $e");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchSubjectBySchoolLevel({bool forceRefresh = false}) async {
    try {
      if (selectedLevelId.value.isEmpty) return;
      isLoading.value = true;

      // 1. Ambil data (Bisa dari lokal dulu)
      var result = await _subjectService.getAllBySchoolLevel(
        forceRefresh: forceRefresh, // Pakai parameter dari fungsi
        schoolLevelId: selectedLevelId.value,
      );

      // 2. Jika data kosong dan kita belum sedang forceRefresh, hajar ke API
      if (result.isEmpty && !forceRefresh) {
        print("INFO: Data lokal kosong, fetch ke API...");
        result = await _subjectService.getAllBySchoolLevel(
          forceRefresh: true,
          schoolLevelId: selectedLevelId.value,
        );
      }

      // 3. Masukkan ke RxList
      subjects.assignAll(result);
    } catch (e) {
      debugPrint("Error Fetch Teacher: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void _handleSubjectChange(String id) async {
    // 1. Reset state awal
    parentTeacherSubjects.clear();

    if (id.isEmpty) return;

    // 2. Cari data mapel di list lokal
    final subject = subjects.firstWhereOrNull((s) => s.id == id);
    if (subject == null) return;

    // 3. Cek apakah perlu cari parent (Bukan Parent & punya subName)
    final needsParent =
        subject.isParent == false && (subject.subName?.isNotEmpty ?? false);

    if (needsParent) {
      try {
        // Panggil service
        final results = await service.getAllSubjectNameIsParentLocal(
          subject.name,
          true,
        );
        parentTeacherSubjects.assignAll(results);
      } catch (e) {
        debugPrint("Error fetching parent subjects: $e");
      }
    }
  }

  void _mapToPlutoRows(List<TeacherSubjectResponse> list) {
    final mappedRows = list.map((item) {
      return PlutoRow(
        cells: {
          'no': PlutoCell(value: ''),
          'id': PlutoCell(value: item.id),
          'teacherName': PlutoCell(value: item.teacherName),
          'subjectName': PlutoCell(value: item.subjectName),
          'subjectSubName': PlutoCell(
            value: item.subjectSubName.isEmpty ? '-' : item.subjectSubName,
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
      final request = CreateTeacherSubjectRequest(
        teacherId: selectedTeacherId.value,
        subjectId: selectedSubjectId.value,
        schoolLevelId: selectedLevelId.value,
        parentId: selectedParentId.value.isEmpty
            ? null
            : selectedParentId.value,
      );
      print("teacher dan subject ===========");
      print(request.toJson());

      await service.create(request);
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

    try {
      // 1. Ambil data spesifik dari lokal
      final data = await service.getByIdLocal(id);
      if (data == null) return;

      teacherSubjectId.value = id;
      isCreate.value = false;

      // 2. Buka drawer dulu biar ViewId terdaftar di Windows
      FocusManager.instance.primaryFocus?.unfocus();
      scaffoldKey.currentState?.openEndDrawer();

      // 3. Tunggu animasi drawer kelar
      await Future.delayed(const Duration(milliseconds: 350));

      // 4. Update state reaktif
      // Ingat: selectedSubjectId akan men-trigger _handleSubjectChange otomatis dari onInit
      selectedTeacherId.value = data.teacherId;
      selectedSubjectId.value = data.subjectId;

      // 5. Kasih waktu buat _handleSubjectChange nyari parent
      await Future.delayed(const Duration(milliseconds: 200));
      selectedParentId.value = data.parentId ?? "";

      // 6. Baru tembak ke form fields
      final state = formKey.currentState;
      if (state != null) {
        state.fields['teacherId']?.didChange(data.teacherId);
        state.fields['subjectId']?.didChange(data.subjectId);

        if (state.fields['parentId'] != null) {
          state.fields['parentId']?.didChange(data.parentId ?? "");
        }
      }
    } catch (e) {
      debugPrint("Update Error: $e");
    }
  }

  Future<void> doUpdate() async {
    if (!(formKey.currentState?.saveAndValidate() ?? false)) return;

    try {
      isLoading.value = true; // Kasih loading biar user gak klik berkali-kali

      final request = UpdateTeacherSubjectRequest(
        teacherId: selectedTeacherId.value,
        subjectId: selectedSubjectId.value,
        schoolLevelId: selectedLevelId.value,
        parentId: selectedParentId.value.isEmpty
            ? null
            : selectedParentId.value,
      );

      // 1. Eksekusi Update ke API/Service
      await service.updateTeacherSubject(teacherSubjectId.value, request);

      // 2. Refresh data tabel (karena ini async, biarkan jalan di background)
      await fetchBySchoolLevel(forceRefresh: true);

      // 3. TUTUP DRAWER DULU
      FocusManager.instance.primaryFocus
          ?.unfocus(); // Lepas fokus sebelum tutup
      scaffoldKey.currentState?.closeEndDrawer();

      // 4. KASIH JEDA ANIMASI sebelum clear form
      // Biar drawer bener-bener ilang dari layar baru state-nya kita hancurin
      await Future.delayed(const Duration(milliseconds: 300));
      clearForm();
    } catch (e) {
      debugPrint("Update Error: $e");
      // Tampilkan notifikasi error di sini kalau perlu
    } finally {
      isLoading.value = false;
    }
  }

  void confirmDelete(String? id) {
    if (id == null) return;
    showShadDialog(
      context: Get.context!,
      builder: (context) => ShadDialog(
        title: const Text("Delete Penugasan"),
        description: const Text("Yakin hapus data ini?"),
        actions: [
          ShadButton.outline(
            child: const Text('Batal'),
            onPressed: () => Get.back(),
          ),
          ShadButton.destructive(
            child: const Text('Hapus'),
            onPressed: () async {
              await service.delete(id);
              await fetchBySchoolLevel(forceRefresh: true);
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  void clearForm() {
    selectedTeacherId.value = "";
    selectedSubjectId.value = "";
    selectedParentId.value = "";
    formKey.currentState?.reset();
  }
}
