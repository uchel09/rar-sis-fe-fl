import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:rar_sis_fe_fl/app/services/student-draft/student_draft_service.dart';
import 'package:flutter/material.dart';

class PpdbRegistrationController extends GetxController {
  final StudentDraftService _service = Get.find<StudentDraftService>();

  // ⭐ OBSERVABLES - SUDAH LENGKAP
  final RxList<PlutoRow> rows = <PlutoRow>[].obs;
  final RxList<PlutoColumn> columns = <PlutoColumn>[].obs;
  final RxInt currentPage = 1.obs;
  final RxInt totalPages = 1.obs;
  final RxInt totalRows = 0.obs;
  final RxInt limit = 30.obs;
  final RxBool isLoading = false.obs;
  final RxString searchQuery = ''.obs;

  // ⭐ CONTROLLERS - HAPUS limitController (pakai dropdown)
  final TextEditingController searchController = TextEditingController();
  final limitOptions = [10, 20, 30, 50, 100];

  // ⭐ PLUTOGRID STATE
  PlutoGridStateManager? stateManager;

  @override
  void onInit() {
    super.onInit();
    _initColumns();
    _initControllers();
    _loadData(); // ✅ Load pertama
    _setupListeners();
  }

  /// ⭐ 1. COLUMNS LENGKAP + RENDERER
  void _initColumns() {
    columns.value = [
      // No column dengan pagination
      PlutoColumn(
        title: 'No',
        field: 'index',
        type: PlutoColumnType.number(),
        width: 70,
        renderer: (rendererContext) {
          return Center(
            child: Text(
              '${rendererContext.rowIdx + 1 + (currentPage.value - 1) * limit.value}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
          );
        },
      ),
      // Nama Lengkap
      PlutoColumn(
        title: 'Nama Lengkap',
        field: 'fullName',
        type: PlutoColumnType.text(),
        width: 280,
        minWidth: 200,
      ),
      // Nomor Pendaftaran
      PlutoColumn(
        title: 'No. Pendaftaran',
        field: 'enrollmentNumber',
        type: PlutoColumnType.text(),
        width: 180,
        minWidth: 140,
      ),
      // Email (tambahan)
      PlutoColumn(
        title: 'Email',
        field: 'email',
        type: PlutoColumnType.text(),
        width: 220,
      ),
      // Status (tambahan)
      PlutoColumn(
        title: 'Status',
        field: 'status',
        type: PlutoColumnType.text(),
        width: 120,
        renderer: (rendererContext) {
          final status = rendererContext.cell.value.toString().toLowerCase();
          Color? color;
          IconData? icon;

          switch (status) {
            case 'draft':
              color = Colors.orange;
              icon = Icons.drafts_outlined;
              break;
            case 'active':
              color = Colors.green;
              icon = Icons.verified;
              break;
            case 'pending':
              color = Colors.blue;
              icon = Icons.hourglass_empty;
              break;
            default:
              color = Colors.grey;
          }

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: color?.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (icon != null) ...[
                  Icon(icon, size: 14, color: color),
                  const SizedBox(width: 4),
                ],
                Text(
                  status.toUpperCase(),
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ];
  }

  /// ⭐ 2. INIT CONTROLLERS
  void _initControllers() {
    searchController.text = '';
  }

  /// ⭐ 3. LISTENERS
  void _setupListeners() {
    // Auto refresh saat search berubah (debounce 500ms)
    debounce(searchQuery, (_) {
      currentPage.value = 1;
      _loadData();
    }, time: const Duration(milliseconds: 500));
  }

  /// ⭐ 4. MAIN DATA LOADER - FIXED
  Future<void> _loadData({bool isRefresh = false}) async {
    if (isLoading.value) return;

    isLoading.value = true;

    try {
      final response = await _service.getAll(
        page: currentPage.value,
        limit: limit.value,
        search: searchQuery.value.isNotEmpty ? searchQuery.value : null,
      );

      // Update pagination info DULU
      totalPages.value = response.lastPage ?? 1;
      totalRows.value = response.totalData ?? 0;

      // Convert ke PlutoRows
      rows.value = response.data.map((student) {
        return PlutoRow(
          cells: {
            'index': PlutoCell(value: 0), // Renderer handle
            'fullName': PlutoCell(value: student.fullName ?? '-'),
            'enrollmentNumber': PlutoCell(
              value: student.enrollmentNumber ?? '-',
            ),
            'email': PlutoCell(value: student.email ?? '-'),
            'status': PlutoCell(value: student.status.name ?? 'Draft'),
          },
        );
      }).toList();

      // Fix page jika melebihi total
      if (currentPage.value > totalPages.value) {
        currentPage.value = totalPages.value;
      }

      print(
        '📊 PAGE: ${currentPage.value}/${totalPages.value} | '
        'ROWS: ${totalRows.value} | LOADED: ${rows.length}',
      );
    } catch (e) {
      print('❌ ERROR: $e');
      Get.snackbar(
        'Error!',
        'Gagal memuat data: ${e.toString()}',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  /// ⭐ 5. SEARCH - ON SUBMIT ONLY
  void onSearchSubmitted(String value) {
    final trimmedValue = value.trim();
    searchQuery.value = trimmedValue;
    // _loadData dipanggil otomatis oleh debounce
  }

  void clearSearch() {
    searchController.clear();
    searchQuery.value = '';
  }

  /// ⭐ 6. LIMIT HANDLER - FIXED untuk DROPDOWN
  void changeLimit(int newLimit) {
    if (newLimit == limit.value) return;

    limit.value = newLimit;
    currentPage.value = 1;
    _loadData();
  }

  /// ⭐ 7. PAGINATION - SEMUA READY
  void nextPage() {
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
      _loadData();
    }
  }

  void previousPage() {
    if (currentPage.value > 1) {
      currentPage.value--;
      _loadData();
    }
  }

  void goToPage(int page) {
    if (page >= 1 && page <= totalPages.value && page != currentPage.value) {
      currentPage.value = page;
      _loadData();
    }
  }

  /// ⭐ 8. REFRESH - FIXED
  Future<void> refreshData() async {
    searchQuery.value = '';
    searchController.clear();

    await _loadData(isRefresh: true);
  }

  /// ⭐ 9. PLUTOGRID CALLBACKS
  void onPlutoGridLoaded(PlutoGridOnLoadedEvent event) {
    stateManager = event.stateManager;
    print('🔗 PlutoGrid loaded: ${stateManager!.rows.length} rows');
  }

  void onGridChanged(PlutoGridOnChangedEvent event) {
    print('📝 Grid changed: ${event.column.field} = ${event.value}');
  }

  /// ⭐ 10. GETTERS - VALIDATION
  bool get canGoPrevious => currentPage.value > 1;
  bool get canGoNext => currentPage.value < totalPages.value;
  bool get hasData => rows.isNotEmpty && !isLoading.value;
  bool get isEmpty => rows.isEmpty && !isLoading.value;
  bool get showSearchClear => searchQuery.value.isNotEmpty;

  /// ⭐ 11. CLEANUP
  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}
