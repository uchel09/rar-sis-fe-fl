import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/core/base/master_controller.dart';
import 'package:rar_sis_fe_fl/app/services/teacher/teacher_service.dart';
import 'package:rar_sis_fe_fl/app/core/enum.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../../../services/teacher/teacher_model.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import '../../../../../widgets/universal_profile_detail.dart';
import '../../../../../core/pluto_core.dart';
import '../../../../../widgets/circle_cache_avatar.dart';
import 'package:get/get.dart' as g;
import 'package:get_storage/get_storage.dart';

class TeacherController extends GetxController {
  // 1. Reactive Variables
  var rows = <PlutoRow>[].obs;
  var isLoading = false.obs;
  var dropdownItems = <DropdownMenuItem<String>>[].obs;

  // 2. Definisi Kolom (Late karena butuh context/init)
  late List<PlutoColumn> columns;
  final TeacherService _service = Get.find<TeacherService>();
  final MasterController masterController = Get.find<MasterController>();
  // Penampung UUID jenjang yang dipilih di form (reaktif)
  // form
  late GlobalKey<ScaffoldState> scaffoldKey;
  final formKey = GlobalKey<ShadFormState>();
  var box = GetStorage();
  final isCreate = false.obs;
  final schoolId = "".obs;

  // ==========================================
  // 1. USER BASIC DATA (String & Enums)
  // ==========================================
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();
  final gender = Rxn<Gender>();

  // ==========================================
  // 2. PROFILE DATA (Detail & Employment)
  // ==========================================
  // schoolId ambil langsung dari storage
  final adminId = "".obs;
  final nikController = TextEditingController();
  final nipController = TextEditingController();
  final phoneController = TextEditingController();
  final bPlaceController = TextEditingController(); // birthPlace
  final dob = Rxn<DateTime>(); // Date of Birth
  final employeeType = Rxn<EmployeeType>(); // Untuk Kontrak/Tetap
  final workStatus = Rxn<WorkStatus>(); // Untuk Aktif/Sakit/Izin
  final endStatus = Rxn<EmployeeEndStatus>(); // Untuk Resign/Pensiun
  final hireDate = Rxn<DateTime>();
  final hireEnd = Rxn<DateTime>();
  var selectedLevelIds = <String>[].obs;

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
      // 1. Kolom Nomor Urut
      PlutoColumn(
        title: 'NO',
        field: 'no',
        type: PlutoColumnType.text(),
        width: 60,
        enableSorting: false,
        enableContextMenu: false,
        renderer: (rendererContext) {
          final stateManager = rendererContext.stateManager;
          int pageOffset = (stateManager.page - 1) * stateManager.pageSize;
          int nomorUrut = pageOffset + rendererContext.rowIdx + 1;
          return Center(
            child: Text(
              nomorUrut.toString(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          );
        },
      ),

      // Nama Lengkap (Dari UserInfo)
      PlutoColumn(
        title: 'avatar',
        field: 'imageUrl',
        type: PlutoColumnType.text(),
        width: 50,
        renderer: (rendererContext) {
          // Ambil string URL langsung dari cell baris ini
          final String? url = rendererContext.cell.value;

          return GlobalAvatar(
            imageUrl: url, // Pakai url dari baris ini, bukan dari profil login
            size: 30,
            borderWidth: 1,
            borderColor: const Color(0xFF64b5f6),
          );
        },
      ),
      PlutoColumn(
        title: 'Nama Admin',
        enableHideColumnMenuItem: false,
        field: 'fullName', // Kita akan mapping user.fullName ke field ini
        type: PlutoColumnType.text(),
        width: 200,
      ),

      // Email (Dari UserInfo)
      PlutoColumn(
        title: 'Email',
        field: 'email',
        type: PlutoColumnType.text(),
        width: 180,
      ),
      // gender
      PlutoColumn(
        title: 'Gender',
        field: 'gender',
        type: PlutoColumnType.text(),
        width: 120,
        renderer: (rendererContext) {
          final val = rendererContext.cell.value.toString().toLowerCase();

          String label = val == 'female' ? 'Perempuan' : 'Laki-laki';
          Color chipColor = val == 'female' ? Colors.pink : Colors.blue;

          return Center(
            // Tambahkan Center di sini
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              decoration: BoxDecoration(
                color: chipColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: chipColor.withOpacity(0.5)),
              ),
              child: Text(
                label,
                textAlign: TextAlign
                    .center, // Opsional: memastikan teks di dalam container juga center
                style: TextStyle(
                  color: chipColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
            ),
          );
        },
      ),

      //NIK
      PlutoColumn(
        title: 'NIK',
        field: 'nik',
        type: PlutoColumnType.text(),
        width: 150,
      ),
      //  NIP
      PlutoColumn(
        title: 'NIP',
        field: 'nip',
        type: PlutoColumnType.text(),
        width: 150,
      ),

      PlutoColumn(
        title: 'Akses Jenjang',
        field: 'schoolLevelAccess',
        type: PlutoColumnType.text(),
        // width: 200,
        renderer: (rendererContext) {
          // String dari cell (misal: "SD, SMP, SMA")
          String value = rendererContext.cell.value.toString();
          if (value.isEmpty || value == '-')
            return const Center(child: Text('-'));

          List<String> levels = value.split(', ');

          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: levels
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
                          fontSize: 14,
                          color: Colors.blue,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          );
        },
      ),

      //  Actions
      PlutoColumn(
        title: 'Actions',
        field: 'actions',
        type: PlutoColumnType.text(),
        enableSorting: false,
        enableFilterMenuItem: false,
        width: 160,
        renderer: (rendererContext) {
          final String rowId =
              rendererContext.row.cells['id']?.value.toString() ?? '';
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
                icon: const Icon(
                  Icons.remove_red_eye_sharp,
                  size: 16,
                  color: Colors.black,
                ),
                onPressed: () {
                  showDialog(
                    context: Get.context!,
                    builder: (context) =>
                        const UniversalProfileDetail(id: '123'),
                  );
                },
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
        _mapToPlutoRows(localData);
      } else {
        final freshData = await _service.getAll(forceRefresh: true);
        _mapToPlutoRows(freshData);
      }
    } catch (e) {
      print("error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Mapping ke PlutoRow: Fokus hanya pada konversi ke View/Tabel
  void _mapToPlutoRows(List<TeacherResponse> adminList) {
    final mappedRows = adminList.map((admin) {
      // Karena admin.schoolLevelAccess sudah berbentuk List<SchoolLevelAccess>
      // kita tinggal gabung namanya untuk tampilan kolom tabel.
      final String accessNames = admin.schoolLevelAccess
          .map((e) => e.name)
          .join(', ');
      return PlutoRow(
        cells: {
          'no': PlutoCell(value: ''),
          'id': PlutoCell(value: admin.id),
          'fullName': PlutoCell(value: admin.user.fullName),
          'email': PlutoCell(value: admin.user.email),
          'imageUrl': PlutoCell(value: admin.user.imageUrl),
          'gender': PlutoCell(value: admin.user.gender.name.toLowerCase()),
          'nik': PlutoCell(value: admin.nik),
          'nip': PlutoCell(value: admin.nip),
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
    // 1. Validasi Form (Trigger error merah di UI)
    if (!(formKey.currentState?.saveAndValidate() ?? false)) return;

    try {
      // 2. Mapping Manual dari Controller ke Model Request
      // Kita pakai "!" karena sudah divalidasi oleh ShadForm (tidak mungkin null)
      final request = CreateTeacherRequest(
        // 1. User Group
        email: emailController.text.trim(),
        fullName: fullNameController.text.trim(),
        gender: gender.value!,
        address: addressController.text.trim(),

        // 2. Profile Group
        schoolId: schoolId.value,
        dob: dob.value!,
        birthPlace: bPlaceController.text.trim(),
        nik: nikController.text.trim(),
        hireDate: hireDate.value!,
        phone: phoneController.text.trim(),

        // ✅ TAMBAHKAN INI (Wajib sesuai Model & Service NestJS)
        employeeType: employeeType.value!,
        hireEnd: hireEnd.value, // Ini boleh null jika pegawai tetap
        // 3. Access Group
        schoolLevelAccessIds: selectedLevelIds.toList(),
      );

      await _service.create(request);
      await fetchData(forceRefresh: true);
      // 3. Tembak ke Service
      // await _service.createAdmin(request.toJson());

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

  void clearForm() {
    // user
    fullNameController.clear();
    emailController.clear();
    gender.value = null;
    addressController.clear();
    // profile
    dob.value = null;
    bPlaceController.clear();
    nikController.clear();
    nipController.clear();

    hireDate.value = null;
    phoneController.clear();
    hireEnd.value = null;
    employeeType.value = null;
    workStatus.value = null;
    endStatus.value = null;
    selectedLevelIds.clear();

    formKey.currentState?.reset(); // Reset state validasi ShadForm
  }

  void onUpdate(Map<String, dynamic> rowData) async {
    final String? id = rowData['id'];
    if (id == null) return;

    adminId.value = id;
    final admin = await _service.getTeacherByIdLocal(id);

    if (admin != null) {
      isCreate.value = false;
      clearForm();

      // --- MAPPING MANUAL KE CONTROLLER ---
      fullNameController.text = admin.user.fullName;
      emailController.text = admin.user.email;
      addressController.text = admin.user.address;
      gender.value = admin.user.gender;
      nikController.text = admin.nik;
      nipController.text = admin.nip ?? "";
      phoneController.text = admin.phone;
      bPlaceController.text = admin.birthPlace;
      dob.value = admin.dob;
      hireDate.value = admin.hireDate;
      hireEnd.value = admin.hireEnd;
      employeeType.value = admin.employeeType;
      workStatus.value = admin.workStatus;
      endStatus.value = admin.employeeEndStatus;

      selectedLevelIds.assignAll(
        admin.schoolLevelAccess.map((e) => e.id).toList(),
      );

      // 1. Buka Drawer dulu agar widget-nya teregistrasi di UI
      scaffoldKey.currentState?.openEndDrawer();

      // 2. FORCE UPDATE STATE UNTUK PICKER & SELECT
      // Kasih delay 200-300ms supaya drawer sudah terbuka sempurna
      Future.delayed(const Duration(milliseconds: 250), () {
        final state = formKey.currentState;
        if (state != null) {
          // Paksa isi nilai ke internal state ShadForm field demi field
          // ID di sini HARUS sama dengan ID di widget ShadFormBuilderField lo
          state.fields['gender']?.didChange(admin.user.gender);
          state.fields['employeeType']?.didChange(admin.employeeType);
          state.fields['workStatus']?.didChange(admin.workStatus);
          state.fields['employeeEndStatus']?.didChange(admin.employeeEndStatus);
          state.fields['hireEnd']?.didChange(admin.hireEnd);
          state.fields['dob']?.didChange(admin.dob);
          state.fields['hireDate']?.didChange(admin.hireDate);

          // Panggil validate sekali saja di akhir untuk menghapus pesan error merah
          state.validate();
        }
      });
    }
  }

  Future<void> doUpdate() async {
    // 1. Validasi Form (Trigger error merah di UI)
    if (!(formKey.currentState?.saveAndValidate() ?? false)) return;

    try {
      // 2. Mapping Manual dari Controller ke Model Request
      // Kita pakai "!" karena sudah divalidasi oleh ShadForm (tidak mungkin null)
      final request = UpdateTeacherRequest(
        // User Group
        fullName: fullNameController.text.trim(),
        gender: gender.value!,
        address: addressController.text.trim(),

        // Profile Group
        dob: dob.value!,
        birthPlace: bPlaceController.text.trim(),
        nik: nikController.text.trim(),
        nip: nipController.text.trim().isEmpty
            ? null
            : nipController.text.trim(),
        phone: phoneController.text.trim(),
        employeeType: employeeType.value,
        workStatus: workStatus.value,
        employeeEndStatus: endStatus.value,
        hireEnd: hireEnd.value,
        schoolLevelAccessIds: selectedLevelIds.toList(),
      );

      await _service.update(adminId.value, request);
      await fetchData(forceRefresh: true);

      // 3. Tembak ke Service
      // await _service.createAdmin(request.toJson());

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

  Future<void> getAdminByIdLocal(String id) async {
    final admin = await _service.getTeacherByIdLocal(id);
    if (admin != null) {
      print(admin.user.fullName);
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

  void onExport() async {
    Get.snackbar("Export", "Export Data", snackPosition: SnackPosition.BOTTOM);
  }

  void onRefresh() {
    fetchData(forceRefresh: true);
  }
}
