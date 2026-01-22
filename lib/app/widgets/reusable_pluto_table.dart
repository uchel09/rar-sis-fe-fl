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
  final bool canExport;
  final VoidCallback? onExport;
  final bool canRefresh;
  final VoidCallback? onRefresh;
  final List<DropdownMenuItem<String>> dropdownItems;

  const ReusablePlutoTable({
    super.key,
    required this.columns,
    required this.rows,
    this.isLoading = false,
    this.searchPlaceholder = 'Search ...',
    this.canCreate = true,
    this.onCreate,
    this.canExport = true,
    this.onExport,
    this.canRefresh = false,
    this.onRefresh,
    required this.dropdownItems,
  });

  @override
  State<ReusablePlutoTable> createState() => _ReusablePlutoTableState();
}

class _ReusablePlutoTableState extends State<ReusablePlutoTable> {
  PlutoGridStateManager? stateManager;
  String? selectedValue = 'all';
  String _searchText = '';
  bool _listenerAttached = false;
  @override
  void didUpdateWidget(covariant ReusablePlutoTable oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (stateManager != null && oldWidget.rows != widget.rows) {
      stateManager!
        ..removeAllRows()
        ..appendRows(widget.rows)
        ..setPage(1, notify: false)
        ..notifyListeners();
    }

    if (stateManager != null && oldWidget.isLoading != widget.isLoading) {
      stateManager!.setShowLoading(widget.isLoading);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    // Menggunakan ResponsiveWrapper untuk menentukan layout
    return ResponsiveWrapper(
      mobile: (context) => _buildLayout(context, theme, device: 'mobile'),
      tablet: (context) => _buildLayout(context, theme, device: 'mobile'),
      desktop: (context) => _buildLayout(context, theme, device: 'desktop'),
    );
  }

  Widget _buildLayout(
    BuildContext context,
    ShadThemeData theme, {
    required String device,
  }) {
    bool isMobile = device == 'mobile';

    return Container(
      // Padding adaptif: lebih rapat di mobile
      padding: EdgeInsets.all(isMobile ? 12 : 24),
      color: const Color(0xFFF8F9FD),
      child: Column(
        children: [
          _buildTopBar(theme, device),
          const SizedBox(height: 16),
          Expanded(child: _buildTableCard(theme, device)),
        ],
      ),
    );
  }

  // --- FUNGSI LOGIK (TIDAK DIUBAH) ---
  void _executePageSize(String value) {
    int? size = int.tryParse(value);
    if (size != null && size > 0) {
      stateManager?.setPageSize(size, notify: false);
      stateManager?.setPage(1, notify: false);
      stateManager?.notifyListeners();
      if (mounted) setState(() {});
    }
  }

  void _executeFilter(String value) {
    _searchText = value;
    if (value.isEmpty) {
      // BUG FIX: Jika kosong, hapus semua filter agar tabel kembali penuh
      stateManager!.setFilter(null);
    }
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
    stateManager!.setPage(1, notify: false);

    stateManager!.notifyListeners();

    if (mounted) setState(() {});
  }

  // --- GAYA LAYOUT TOPBAR (ADAPTIF) ---
  Widget _buildTopBar(ShadThemeData theme, String device) {
    bool isMobile = device == 'mobile';
    bool isTablet = device == 'tablet';

    // 0. Definisikan Tombol Refresh (Recycle) dengan Tooltip
    final refreshButton = widget.canRefresh
        ? ShadTooltip(
            builder: (context) => const Text("Refresh Data"),
            anchor: const ShadAnchor(offset: Offset(20, 10)),
            child: ShadButton.ghost(
              child: const Icon(LucideIcons.refreshCcw, size: 20),
              onPressed: widget.onRefresh,
            ),
          )
        : const SizedBox.shrink();

    // 1. Definisikan Filter Widgets (Search, Rows, Dropdown)
    final searchInput = SizedBox(
      width: isMobile ? null : (isTablet ? 200 : 300),
      child: ShadInput(
        placeholder: Text(widget.searchPlaceholder),
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Icon(LucideIcons.search, size: 18, color: Color(0xFF94A3B8)),
        ),
        onChanged: _executeFilter,
      ),
    );

    final rowInput = SizedBox(
      width: isMobile ? null : 80,
      child: ShadInput(
        placeholder: const Text("Rows"),
        keyboardType: TextInputType.number,
        onChanged: _executePageSize,
      ),
    );

    final dropdown = _buildDropdown("Category", isMobile);

    // 2. Definisikan Tombol Aksi (Create & Export)
    List<Widget> actionButtons = [];
    if (widget.canCreate) {
      actionButtons.add(
        ShadButton(
          onPressed: widget.onCreate,
          width: isMobile ? null : 140,
          backgroundColor: const Color(0xFF5E5EDD),
          child: const Text(
            'Create',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }
    if (widget.canExport) {
      actionButtons.add(
        ShadButton.outline(
          onPressed: widget.onExport,
          child: const Text(
            'Export',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    // --- RENDER LAYOUT MOBILE ---
    if (isMobile) {
      return Column(
        children: [
          // KHUSUS MOBILE: Tombol Create/Export di PALING ATAS
          if (actionButtons.isNotEmpty) ...[
            Row(
              children: actionButtons
                  .map(
                    (btn) => Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: btn == actionButtons.last ? 0 : 10,
                        ),
                        child: btn,
                      ),
                    ),
                  )
                  .toList(),
            ),
            const SizedBox(height: 12),
          ],
          // Refresh Button + Search Bar
          Row(
            children: [
              refreshButton,
              if (widget.canRefresh) const SizedBox(width: 8),
              Expanded(child: searchInput),
            ],
          ),
          const SizedBox(height: 10),
          // Row Input & Dropdown
          Row(
            children: [
              Expanded(child: rowInput),
              const SizedBox(width: 10),
              Expanded(child: dropdown),
            ],
          ),
        ],
      );
    }

    // --- RENDER LAYOUT DESKTOP & TABLET ---
    return Row(
      children: [
        const Icon(Icons.filter_list, size: 20, color: Color(0xFF64748B)),
        const SizedBox(width: 16),
        // Tombol Refresh diletakkan sebelum search
        refreshButton,
        if (widget.canRefresh) const SizedBox(width: 12),
        searchInput,
        const SizedBox(width: 12),
        rowInput,
        const SizedBox(width: 12),
        dropdown,
        const Spacer(),
        ...actionButtons
            .expand((btn) => [btn, const SizedBox(width: 8)])
            .toList()
          ..removeLast(),
      ],
    );
  }

  Widget _buildDropdown(String label, bool isMobile) {
    return ShadSelect<String>(
      initialValue: selectedValue,
      minWidth: isMobile ? double.infinity : 160,
      options: [
        const ShadOption(value: 'all', child: Text('All Columns')),
        ...widget.dropdownItems.map(
          (item) => ShadOption(value: item.value ?? '', child: item.child),
        ),
      ],
      selectedOptionBuilder: (context, value) {
        final selectedItem = widget.dropdownItems.firstWhere(
          (item) => item.value == value,
          orElse: () =>
              DropdownMenuItem(value: 'all', child: const Text('All Columns')),
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
        setState(() => selectedValue = value);
        _executeFilter(_searchText);
      },
    );
  }

  // --- GAYA LAYOUT TABEL (ADAPTIF) ---
  Widget _buildTableCard(ShadThemeData theme, String device) {
    bool isMobile = device == 'mobile';

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
          if (!_listenerAttached) {
            _listenerAttached = true;

            stateManager!.addListener(_columnVisibilityGuard);
          }
        },
        createFooter: (state) {
          state.setPageSize(10, notify: true);
          return PlutoPagination(state, pageSizeToMove: 1);
        },
        configuration: PlutoGridConfiguration(
          columnFilter: const PlutoGridColumnFilterConfig(filters: []),
          style: PlutoGridStyleConfig(
            gridBorderColor: Colors.transparent,
            gridBackgroundColor: Colors.white,
            borderColor: const Color(0xFFF1F5F9),
            // Penyesuaian ukuran cell agar enak dilihat di mobile
            columnHeight: isMobile ? 45 : 55,
            rowHeight: isMobile ? 55 : 65,
            columnTextStyle: TextStyle(
              color: const Color(0xFF64748B),
              fontWeight: FontWeight.w600,
              fontSize: isMobile ? 12 : 13,
            ),
            cellTextStyle: TextStyle(
              color: const Color(0xFF1E293B),
              fontSize: isMobile ? 13 : 14,
              fontWeight: FontWeight.w500,
            ),
            activatedColor: const Color(0xFFF8FAFC),
            rowColor: Colors.white,
          ),
        ),
      ),
    );
  }

  void _columnVisibilityGuard() {
    if (stateManager == null) return;

    final visibleCount = stateManager!.columns.where((c) => !c.hide).length;

    for (final col in stateManager!.columns) {
      col.enableHideColumnMenuItem = visibleCount > 3;
    }
  }

  @override
  void dispose() {
    if (stateManager != null && _listenerAttached) {
      stateManager!.removeListener(_columnVisibilityGuard);
    }
    super.dispose();
  }
}
