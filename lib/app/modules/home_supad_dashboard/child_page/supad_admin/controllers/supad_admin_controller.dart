import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/services/school_admin/school_admin_service.dart';
import '../../../../../services/school_admin/school_admin_model.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import '../../../../../widgets/row_detail_modal.dart';
import '../../../../../core/pluto_core.dart';
import '../../../../../widgets/circle_cache_avatar.dart';
import "package:shadcn_ui/shadcn_ui.dart";
import 'package:get/get.dart' as g;

class SupadAdminController extends GetxController {
  // 1. Reactive Variables
  var rows = <PlutoRow>[].obs;
  var isLoading = false.obs;
  var dropdownItems = <DropdownMenuItem<String>>[].obs;
  // 2. Definisi Kolom (Late karena butuh context/init)
  late List<PlutoColumn> columns;
  final SchoolAdminService _service = Get.find<SchoolAdminService>();
  late GlobalKey<ScaffoldState> scaffoldKey;

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

      // 3. Nama Lengkap (Dari UserInfo)
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

      // 4. Email (Dari UserInfo)
      PlutoColumn(
        title: 'Email',
        field: 'email',
        type: PlutoColumnType.text(),
        width: 180,
      ),

      // 5. NIK
      PlutoColumn(
        title: 'NIK',
        field: 'nik',
        type: PlutoColumnType.text(),
        width: 150,
      ),

      // 6. Status (Enum EmployeeStatus)
      PlutoColumn(
        title: 'Status',
        field: 'status',
        type: PlutoColumnType.text(),
        width: 120,
        renderer: (rendererContext) {
          // Styling status (optional)
          Color textColor = rendererContext.cell.value == 'ACTIVE'
              ? Colors.green
              : Colors.red;
          return Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: textColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                rendererContext.cell.value.toString(),
                style: TextStyle(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          );
        },
      ),

      // 7. Access Level (Menampilkan jumlah akses)
      PlutoColumn(
        title: 'Akses Jenjang',
        field: 'schoolLevelAccess',
        type: PlutoColumnType.text(),
        width: 250,
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
                          fontSize: 11,
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

      // 8. Actions
      PlutoColumn(
        title: 'Actions',
        field: 'actions',
        type: PlutoColumnType.text(),
        enableSorting: false,
        enableFilterMenuItem: false,
        width: 160,
        renderer: (rendererContext) {
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
                  Get.dialog(
                    RowDetailModal(
                      row: rendererContext.row,
                      columns: columns,
                      hiddenFields: const ['no', 'actions', 'id'],
                    ),
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
        final freshData = await _service.getAll(forceRefresh: forceRefresh);
        _mapToPlutoRows(freshData);

        if (rows.isEmpty) {
          Get.snackbar("Info", "Tidak ada data admin ditemukan.");
        }
      }
    } catch (e) {
      print("error: $e");
    } finally {
      isLoading.value = false;
    }
  }

  /// Mapping ke PlutoRow: Fokus hanya pada konversi ke View/Tabel
  void _mapToPlutoRows(List<SchoolAdminResponse> adminList) {
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
          'imageUrl': PlutoCell(value: admin.user.imageUrl),
          'email': PlutoCell(value: admin.user.email),
          'nik': PlutoCell(value: admin.nik),
          'status': PlutoCell(value: admin.status.name),
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
    scaffoldKey.currentState?.openEndDrawer();
  }

  void onExport() async {
    print("delete local");
    // _service.deleteLocal();
  }

  void onRefresh() {
    fetchData(forceRefresh: true);
  }

  void onUpdate(Map<String, dynamic> data) {
    Get.snackbar(
      "Update",
      "Edit sekolah: ${data['name']}",
      snackPosition: SnackPosition.BOTTOM,
    );
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
}
