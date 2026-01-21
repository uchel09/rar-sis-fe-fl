import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../app/core/responsive_wrapper.dart';

class ReusablePlutoTable extends StatefulWidget {
  final List<PlutoColumn> columns;
  final List<PlutoRow> rows;
  final bool isLoading;
  final String searchPlaceholder;
  final bool canCreate;
  final VoidCallback? onCreate;
  final List<DropdownMenuItem<String>> dropdownItems;

  const ReusablePlutoTable({
    super.key,
    required this.columns,
    required this.rows,
    this.isLoading = false,
    this.searchPlaceholder = 'Search by merchant, category...',
    this.canCreate = true,
    this.onCreate,
    required this.dropdownItems,
  });

  @override
  State<ReusablePlutoTable> createState() => _ReusablePlutoTableState();
}

class _ReusablePlutoTableState extends State<ReusablePlutoTable> {
  PlutoGridStateManager? stateManager;
  String? selectedValue = 'all';
  String _searchText = ''; // Simpen teks pencarian di sini

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ResponsiveWrapper(
      mobile: (context) => _buildLayout(context, theme),
      tablet: (context) => _buildLayout(context, theme),
      desktop: (context) => _buildLayout(context, theme),
    );
  }

  Widget _buildLayout(BuildContext context, ShadThemeData theme) {
    return Container(
      padding: const EdgeInsets.all(24),
      color: const Color(0xFFF8F9FD),
      child: Column(
        children: [
          _buildTopBar(theme),
          const SizedBox(height: 16),
          Expanded(child: _buildTableCard(theme)),
        ],
      ),
    );
  }

  void _executePageSize(String value) {
    int? size = int.tryParse(value);
    if (size != null && size > 0) {
      // 1. Set ukurannya
      stateManager?.setPageSize(size, notify: false);

      // 2. Paksa balik ke page 1 supaya grid nge-render ulang dari awal
      stateManager?.setPage(1, notify: false);

      // 3. Baru notify semua widget (termasuk pagination di footer)
      stateManager?.notifyListeners();

      // 4. Opsional: kalau mau pasti banget widget parent ikut tau
      if (mounted) setState(() {});
    }
  }

  // Fungsi Filter yang bisa dipanggil kapan aja
  void _executeFilter(String value) {
    _searchText = value; // Update nilai search terakhir

    if (selectedValue == 'all') {
      stateManager?.setFilter(
        (element) => element.cells.values.any(
          (c) => c.value.toString().toLowerCase().contains(value.toLowerCase()),
        ),
      );
    } else {
      stateManager?.setFilter((row) {
        final cellValue =
            row.cells[selectedValue]?.value?.toString().toLowerCase() ?? '';
        return cellValue.contains(value.toLowerCase());
      });
    }
  }

  Widget _buildTopBar(ShadThemeData theme) {
    return Row(
      children: [
        const Icon(Icons.filter, size: 20, color: Color(0xFF64748B)),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            children: [
              ShadInput(
                placeholder: Text(widget.searchPlaceholder),
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Icon(
                    LucideIcons.search,
                    size: 18,
                    color: Color(0xFF94A3B8),
                  ),
                ),
                onChanged: (value) =>
                    _executeFilter(value), // Panggil fungsi filter
              ),
              ShadInput(
                placeholder: Text("Row per page"),
                leading: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Icon(
                    LucideIcons.search,
                    size: 18,
                    color: Color(0xFF94A3B8),
                  ),
                ),
                onChanged: (value) =>
                    _executePageSize(value), // Panggil fungsi filter
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        _buildDropdown("Category"),
        const SizedBox(width: 12),
        if (widget.canCreate)
          ShadButton(
            onPressed: widget.onCreate,
            backgroundColor: const Color(0xFF5E5EDD),
            child: const Text(
              'EXPORT',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildDropdown(String label) {
    return ShadSelect<String>(
      initialValue: selectedValue,
      minWidth: 160,
      options: [
        const ShadOption(value: 'all', child: Text('All Columns')),
        ...widget.dropdownItems.map((item) {
          return ShadOption(value: item.value ?? '', child: item.child);
        }),
      ],
      selectedOptionBuilder: (context, value) {
        if (value == 'all') {
          return const Text(
            'All Columns',
            style: TextStyle(
              color: Color(0xFF1E293B),
              fontWeight: FontWeight.w500,
            ),
          );
        }
        final selectedItem = widget.dropdownItems.firstWhere(
          (item) => item.value == value,
          orElse: () => DropdownMenuItem(value: '', child: Text(label)),
        );
        return DefaultTextStyle(
          style: const TextStyle(
            color: Color(0xFF1E293B),
            fontWeight: FontWeight.w500,
          ),
          child: selectedItem.child,
        );
      },
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });

        // Panggil lagi filternya pake teks yang terakhir disimpen
        _executeFilter(_searchText);
      },
    );
  }

  Widget _buildTableCard(ShadThemeData theme) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: PlutoGrid(
        columns: widget.columns,
        rows: widget.rows,
        onLoaded: (event) {
          stateManager = event.stateManager;
          stateManager?.setShowLoading(widget.isLoading);
          // stateManager?.setPageSize(10, notify: true);
          // INI LOGIC LIMIT 3 KOLOM LU YANG ILANG TADI
          stateManager?.addListener(() {
            if (stateManager != null) {
              int visibleCount = stateManager!.columns
                  .where((c) => !c.hide)
                  .length;

              for (var col in stateManager!.columns) {
                // Kalau sisa 3 kolom atau kurang, disable menu hide
                col.enableHideColumnMenuItem = visibleCount > 3;
              }
            }

            // TRIGGER REBUILD UNTUK PAGINATION AKTIF
          });
        },
        createFooter: (state) {
          // 2. Gunakan listener atau pastikan stateManager terupdate
          state.setPageSize(10, notify: true);
          return PlutoPagination(
            state,
            // Ini kuncinya: Membatasi jangkauan tombol navigasi
            pageSizeToMove: 1,
          );
        },
        configuration: PlutoGridConfiguration(
          columnFilter: const PlutoGridColumnFilterConfig(filters: []),
          style: PlutoGridStyleConfig(
            gridBorderColor: Colors.transparent,
            gridBackgroundColor: Colors.white,
            borderColor: const Color(0xFFF1F5F9),
            columnHeight: 50,
            rowHeight: 60,
            columnTextStyle: const TextStyle(
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
            cellTextStyle: const TextStyle(
              color: Color(0xFF1E293B),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            activatedColor: const Color(0xFFF8FAFC),
            rowColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
