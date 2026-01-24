import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/services/curriculum/curriculum_service.dart';
import '../../../../../services/curriculum/curriculum_model.dart';
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import '../../../../../widgets/row_detail_modal.dart';
import '../../../../../core/pluto_core.dart';
import 'package:get/get.dart' as g;

class SupadCurriculumController extends GetxController {
  // 1. Reactive Variables
  var rows = <PlutoRow>[].obs;
  var isLoading = false.obs;
  var dropdownItems = <DropdownMenuItem<String>>[].obs;
  // 2. Definisi Kolom (Late karena butuh context/init)
  late List<PlutoColumn> columns;
  final CurriculumService _service = Get.find<CurriculumService>();
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
      // 1. Nomor Urut
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

      // 2. Nama Kurikulum
      PlutoColumn(
        title: 'Nama Kurikulum',
        field: 'name',
        type: PlutoColumnType.text(),
        width: 250,
      ),

      // 3. Status (Boolean isActive)
      PlutoColumn(
        title: 'Status',
        field: 'isActive',
        type: PlutoColumnType.text(),
        width: 120,
        renderer: (rendererContext) {
          // Ambil value boolean murni dari cell
          final bool active = rendererContext.cell.value as bool;

          return Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                // Shadcn-like Badge Style
                color: active
                    ? const Color(0xFFDCFCE7) // Green 100
                    : const Color(0xFFF1F5F9), // Slate 100
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: active
                      ? const Color(0xFF22C55E) // Green 500
                      : const Color(0xFF94A3B8), // Slate 400
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

      // 4. Actions
      PlutoColumn(
        title: 'Actions',
        field: 'actions',
        type: PlutoColumnType.text(),
        enableSorting: false,
        enableFilterMenuItem: false,
        width: 140,
        renderer: (rendererContext) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
              IconButton(
                icon: const Icon(
                  Icons.visibility_outlined,
                  size: 18,
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
  void _mapToPlutoRows(List<CurriculumResponse> curriculumList) {
    final mappedRows = curriculumList.map((curriculum) {
      return PlutoRow(
        cells: {
          'no': PlutoCell(
            value: '',
          ), // Renderer nomor urut sudah kita handle di initColumns
          'id': PlutoCell(value: curriculum.id),
          'schoolId': PlutoCell(value: curriculum.schoolId),
          'name': PlutoCell(value: curriculum.name),
          // Sesuai request: isActive dikirim sebagai boolean murni
          'isActive': PlutoCell(value: curriculum.isActive),
          'createdAt': PlutoCell(value: curriculum.createdAt),
          'updatedAt': PlutoCell(value: curriculum.updatedAt),
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
    _service.deleteLocal();
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

  Future<void> getAdminByIdLocal(String id) async {
    final curriculum = await _service.getCurriculumByIdLocal(id);
    if (curriculum != null) {
      print("get curriculum by id");
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
}
