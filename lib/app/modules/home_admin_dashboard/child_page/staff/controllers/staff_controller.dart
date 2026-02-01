import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:rar_sis_fe_fl/app/core/base/master_controller.dart';
import 'package:rar_sis_fe_fl/app/core/enum.dart';
import 'package:rar_sis_fe_fl/app/core/pluto_core.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../services/staff/staff_model.dart';
import '../../../../../services/staff/staff_service.dart';
import '../../../../../widgets/circle_cache_avatar.dart';
import '../../../../../widgets/universal_profile_detail.dart';

class StaffController extends GetxController {
  // 1. Reactive Variables
  var rows = <PlutoRow>[].obs;
  var isLoading = false.obs;
  var dropdownItems = <DropdownMenuItem<String>>[].obs;

  // 2. Services & Dependencies
  late List<PlutoColumn> columns;
  final StaffService _service = Get.find<StaffService>();
  final MasterController masterController = Get.find<MasterController>();

  late GlobalKey<ScaffoldState> scaffoldKey;
  final formKey = GlobalKey<ShadFormState>();
  final box = GetStorage();

  final isCreate = false.obs;
  final schoolId = "".obs;
  final staffId = "".obs;

  // ==========================================
  // FORM CONTROLLERS & REACTIVE FIELDS
  // ==========================================
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  final nikController = TextEditingController();
  final nipController = TextEditingController();
  final bPlaceController = TextEditingController();

  final gender = Rxn<Gender>();
  final dob = Rxn<DateTime>();
  final hireDate = Rxn<DateTime>();
  final hireEnd = Rxn<DateTime>();
  final employeeType = Rxn<EmployeeType>();
  final workStatus = Rxn<WorkStatus>();
  final endStatus = Rxn<EmployeeEndStatus>();

  // Spesifik Staff: UUID Jabatan
  final selectedStaffPositionId = Rxn<String>();
  var selectedLevelIds = <String>[].obs;

  void bindScaffold(GlobalKey<ScaffoldState> key) => scaffoldKey = key;

  @override
  void onInit() {
    super.onInit();
    _initColumns();
    schoolId.value = box.read("school_id") ?? "";
    Future.microtask(() => fetchData());

    dropdownItems.value = getColumnDropdownOptions(columns, [
      'id',
      'no',
      'actions',
    ]);
  }

  // 3. Konfigurasi Kolom PlutoGrid
  void _initColumns() {
    columns = [
      PlutoColumn(
        title: 'NO',
        field: 'no',
        type: PlutoColumnType.text(),
        width: 60,
        renderer: (rendererContext) => Center(
          child: Text(
            ((rendererContext.stateManager.page - 1) *
                        rendererContext.stateManager.pageSize +
                    rendererContext.rowIdx +
                    1)
                .toString(),
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      PlutoColumn(
        title: 'AVATAR',
        field: 'imageUrl',
        type: PlutoColumnType.text(),
        width: 80,
        renderer: (rendererContext) =>
            GlobalAvatar(imageUrl: rendererContext.cell.value, size: 30),
      ),
      PlutoColumn(
        title: 'Nama Staff',
        field: 'fullName',
        type: PlutoColumnType.text(),
        width: 200,
      ),
      PlutoColumn(
        title: 'Jabatan',
        field: 'staffPosition',
        type: PlutoColumnType.text(),
        width: 150,
        renderer: (rendererContext) => Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.purple.shade200),
            ),
            child: Text(
              rendererContext.cell.value,
              style: const TextStyle(
                color: Colors.purple,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
      PlutoColumn(
        title: 'Email',
        field: 'email',
        type: PlutoColumnType.text(),
        width: 180,
      ),
      PlutoColumn(
        title: 'Akses Jenjang',
        field: 'schoolLevelAccess',
        type: PlutoColumnType.text(),
        width: 200,
        renderer: (rendererContext) {
          String val = rendererContext.cell.value;
          if (val == '-') return const Center(child: Text('-'));
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: val
                  .split(', ')
                  .map(
                    (e) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 2),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Text(
                        e,
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),
      PlutoColumn(
        title: 'Actions',
        field: 'actions',
        type: PlutoColumnType.text(),
        enableSorting: false,
        width: 160,
        renderer: (rendererContext) => Row(
          children: [
            IconButton(
              icon: const Icon(Icons.edit, size: 16, color: Colors.blue),
              onPressed: () => onUpdate(rendererContext.row.toJson()),
            ),
            IconButton(
              icon: const Icon(Icons.delete, size: 16, color: Colors.red),
              onPressed: () => doDelete(rendererContext.row.toJson()),
            ),
            IconButton(
              icon: const Icon(Icons.remove_red_eye, size: 16),
              onPressed: () {
                showDialog(
                  context: Get.context!,
                  builder: (context) => UniversalProfileDetail(
                    id: rendererContext.row.cells['id']?.value,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ];
  }

  // 4. Fetch & Mapping
  Future<void> fetchData({bool forceRefresh = false}) async {
    try {
      isLoading.value = true;
      final data = await _service.getAll(forceRefresh: forceRefresh);
      _mapToPlutoRows(data);
    } catch (e) {
      print("Error fetch staff: $e");
    } finally {
      isLoading.value = false;
    }
  }

  void _mapToPlutoRows(List<StaffResponse> list) {
    final mappedRows = list.map((staff) {
      final accessNames = staff.schoolLevelAccess.map((e) => e.name).join(', ');
      return PlutoRow(
        cells: {
          'no': PlutoCell(value: ''),
          'id': PlutoCell(value: staff.id),
          'fullName': PlutoCell(value: staff.user.fullName),
          'email': PlutoCell(value: staff.user.email),
          'imageUrl': PlutoCell(value: staff.user.imageUrl),
          'staffPosition': PlutoCell(value: staff.staffPosition.name),
          'schoolLevelAccess': PlutoCell(
            value: accessNames.isEmpty ? '-' : accessNames,
          ),
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
    if (!(formKey.currentState?.saveAndValidate() ?? false)) return;

    try {
      final request = CreateStaffRequest(
        email: emailController.text.trim(),
        fullName: fullNameController.text.trim(),
        gender: gender.value!,
        address: addressController.text.trim(),
        schoolId: schoolId.value,
        dob: dob.value!,
        birthPlace: bPlaceController.text.trim(),
        nik: nikController.text.trim(),
        hireDate: hireDate.value!,
        employeeType: employeeType.value!,
        hireEnd: hireEnd.value,
        phone: phoneController.text.trim(),
        staffPositionId: selectedStaffPositionId.value!, // Mapping Jabatan
        schoolLevelAccessIds: selectedLevelIds.toList(),
      );

      await _service.create(request);
      await fetchData(forceRefresh: true);
      scaffoldKey.currentState?.closeEndDrawer();
      clearForm();
    } catch (e) {
      print("Error Create Staff: $e");
    }
  }

  void onUpdate(Map<String, dynamic> rowData) async {
    final String? id = rowData['id'];
    if (id == null) return;

    staffId.value = id;
    final staff = await _service.getStaffByIdLocal(id);

    if (staff != null) {
      isCreate.value = false;
      clearForm();

      // Mapping ke Controller
      fullNameController.text = staff.user.fullName;
      emailController.text = staff.user.email;
      addressController.text = staff.user.address;
      gender.value = staff.user.gender;
      nikController.text = staff.nik;
      nipController.text = staff.nip ?? "";
      phoneController.text = staff.phone;
      bPlaceController.text = staff.birthPlace;
      dob.value = staff.dob;
      hireDate.value = staff.hireDate;
      hireEnd.value = staff.hireEnd;
      employeeType.value = staff.employeeType;
      workStatus.value = staff.workStatus;
      endStatus.value = staff.employeeEndStatus;
      selectedStaffPositionId.value = staff.staffPosition.id; // Set Jabatan

      selectedLevelIds.assignAll(
        staff.schoolLevelAccess.map((e) => e.id).toList(),
      );

      scaffoldKey.currentState?.openEndDrawer();

      // ShadForm Update State
      Future.delayed(const Duration(milliseconds: 250), () {
        final state = formKey.currentState;
        if (state != null) {
          state.fields['gender']?.didChange(staff.user.gender);
          state.fields['employeeType']?.didChange(staff.employeeType);
          state.fields['staffPositionId']?.didChange(staff.staffPosition.id);
          state.fields['dob']?.didChange(staff.dob);
          state.fields['hireEnd']?.didChange(staff.hireEnd);
          state.fields['hireDate']?.didChange(staff.hireDate);
          state.fields['workStatus']?.didChange(staff.workStatus);
          state.validate();
        }
      });
    }
  }

  Future<void> doUpdate() async {
    if (!(formKey.currentState?.saveAndValidate() ?? false)) return;

    try {
      final request = UpdateStaffRequest(
        fullName: fullNameController.text.trim(),
        gender: gender.value,
        address: addressController.text.trim(),
        dob: dob.value,
        birthPlace: bPlaceController.text.trim(),
        nik: nikController.text.trim(),
        nip: nipController.text.trim().isEmpty
            ? null
            : nipController.text.trim(),
        employeeType: employeeType.value,
        workStatus: workStatus.value,
        employeeEndStatus: endStatus.value,
        hireEnd: hireEnd.value,
        phone: phoneController.text.trim(),
        staffPositionId: selectedStaffPositionId.value,
        schoolLevelAccessIds: selectedLevelIds.toList(),
      );

      await _service.update(staffId.value, request);
      await fetchData(forceRefresh: true);
      scaffoldKey.currentState?.closeEndDrawer();
      clearForm();
    } catch (e) {
      print("Error Update Staff: $e");
    }
  }

  void clearForm() {
    fullNameController.clear();
    emailController.clear();
    addressController.clear();
    phoneController.clear();
    nikController.clear();
    nipController.clear();
    bPlaceController.clear();
    gender.value = null;
    dob.value = null;
    hireDate.value = null;
    hireEnd.value = null;
    employeeType.value = null;
    workStatus.value = null;
    endStatus.value = null;
    selectedStaffPositionId.value = null;
    selectedLevelIds.clear();
    formKey.currentState?.reset();
  }

  void onExport() async {
    Get.snackbar("Export", "Export Data", snackPosition: SnackPosition.BOTTOM);
  }

  void onRefresh() {
    fetchData(forceRefresh: true);
  }

  void doDelete(Map<String, dynamic> data) {
    // Logic delete
  }
}
