import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import '../../app/core/responsive_wrapper.dart';

class ReusablePlutoTable extends StatefulWidget {
  final List<PlutoColumn> columns;
  final List<PlutoRow> rows;
  final bool isLoading;
  final String searchPlaceholder;
  final bool canCreate;
  final VoidCallback? onCreate;

  const ReusablePlutoTable({
    super.key,
    required this.columns,
    required this.rows,
    this.isLoading = false,
    this.searchPlaceholder = 'Search by merchant, category...',
    this.canCreate = true,
    this.onCreate,
  });

  @override
  State<ReusablePlutoTable> createState() => _ReusablePlutoTableState();
}

class _ReusablePlutoTableState extends State<ReusablePlutoTable> {
  PlutoGridStateManager? stateManager;

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
      color: const Color(0xFFF8F9FD), // Background luar abu-abu sangat muda
      child: Column(
        children: [
          _buildTopBar(theme),
          const SizedBox(height: 16),
          Expanded(child: _buildTableCard(theme)),
        ],
      ),
    );
  }

  // Bagian Filter & Search di atas tabel
  Widget _buildTopBar(ShadThemeData theme) {
    return Row(
      children: [
        const Icon(Icons.filter, size: 20, color: Color(0xFF64748B)),
        const SizedBox(width: 16),
        Expanded(
          child: ShadInput(
            placeholder: Text(widget.searchPlaceholder),
            leading: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Icon(
                LucideIcons.search,
                size: 18,
                color: Color(0xFF94A3B8),
              ),
            ),
            onChanged: (value) => stateManager?.setFilter(
              (element) => element.cells.values.any(
                (c) => c.value.toString().toLowerCase().contains(
                  value.toLowerCase(),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        // Simulasi Date Range & Category seperti di gambar
        _buildFakeDropdown("Date Range", LucideIcons.calendar),
        const SizedBox(width: 12),
        _buildFakeDropdown("Category", null),
        const SizedBox(width: 12),
        if (widget.canCreate)
          ShadButton(
            onPressed: widget.onCreate,
            backgroundColor: const Color(
              0xFF5E5EDD,
            ), // Warna ungu seperti tombol Export
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

  Widget _buildFakeDropdown(String label, IconData? icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      child: Row(
        children: [
          Text(label, style: const TextStyle(color: Color(0xFF64748B))),
          const SizedBox(width: 8),
          Icon(
            icon ?? LucideIcons.chevronDown,
            size: 16,
            color: const Color(0xFF64748B),
          ),
        ],
      ),
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
          // Set jumlah baris per halaman (seperti AntD)
          stateManager?.setPageSize(10, notify: false);
        },
        createFooter: (stateManager) {
          stateManager.setPageSize(10, notify: false); // Default 10 per page
          return PlutoPagination(stateManager);
        },
        configuration: PlutoGridConfiguration(
          columnFilter: const PlutoGridColumnFilterConfig(filters: []),
          style: PlutoGridStyleConfig(
            gridBorderColor: Colors.transparent,
            gridBackgroundColor: Colors.white,
            borderColor: const Color(0xFFF1F5F9), // Warna divider horizontal
            columnHeight: 50,
            rowHeight: 60,
            // Header Text
            columnTextStyle: const TextStyle(
              color: Color(0xFF64748B),
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
            // Cell Text
            cellTextStyle: const TextStyle(
              color: Color(0xFF1E293B),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            // Hilangkan warna saat di klik agar bersih
            activatedColor: const Color(0xFFF8FAFC),
            rowColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
