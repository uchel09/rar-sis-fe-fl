import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../app/core/responsive_wrapper.dart';

class AsyncReusablePlutoTable extends StatefulWidget {
  final List<PlutoColumn> columns;
  final List<PlutoRow> rows;
  final bool isLoading;

  // server-side control
  final int page;
  final int pageSize;
  final int totalRows;
  final ValueChanged<int>? onPageChange;
  final ValueChanged<int>? onPageSizeChange;
  final ValueChanged<String>? onSearch;

  final String searchPlaceholder;
  final bool canCreate;
  final VoidCallback? onCreate;
  final bool canExport;
  final VoidCallback? onExport;
  final bool canRefresh;
  final VoidCallback? onRefresh;

  const AsyncReusablePlutoTable({
    super.key,
    required this.columns,
    required this.rows,
    required this.page,
    required this.pageSize,
    required this.totalRows,
    this.onPageChange,
    this.onPageSizeChange,
    this.onSearch,
    this.isLoading = false,
    this.searchPlaceholder = 'Search ...',
    this.canCreate = true,
    this.onCreate,
    this.canExport = true,
    this.onExport,
    this.canRefresh = false,
    this.onRefresh,
  });

  @override
  State<AsyncReusablePlutoTable> createState() =>
      _AsyncReusablePlutoTableState();
}

class _AsyncReusablePlutoTableState extends State<AsyncReusablePlutoTable> {
  PlutoGridStateManager? stateManager;

  int _lastPage = 1;
  int _lastPageSize = 10;
  String _searchText = '';
  bool _listenerAttached = false;

  @override
  void didUpdateWidget(covariant AsyncReusablePlutoTable oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (stateManager != null && oldWidget.rows != widget.rows) {
      stateManager!
        ..removeAllRows()
        ..appendRows(widget.rows)
        ..notifyListeners();
    }

    if (stateManager != null && oldWidget.isLoading != widget.isLoading) {
      stateManager!.setShowLoading(widget.isLoading);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ResponsiveWrapper(
      mobile: (c) => _layout(c, theme, true),
      tablet: (c) => _layout(c, theme, true),
      desktop: (c) => _layout(c, theme, false),
    );
  }

  Widget _layout(BuildContext context, ShadThemeData theme, bool isMobile) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 12 : 24),
      color: const Color(0xFFF8F9FD),
      child: Column(
        children: [
          _topBar(theme, isMobile),
          const SizedBox(height: 16),
          Expanded(child: _table(theme, isMobile)),
        ],
      ),
    );
  }

  // ================= TOP BAR =================

  Widget _topBar(ShadThemeData theme, bool isMobile) {
    final search = SizedBox(
      width: isMobile ? null : 280,
      child: ShadInput(
        placeholder: Text(widget.searchPlaceholder),
        leading: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Icon(LucideIcons.search, size: 18),
        ),
        onSubmitted: (v) {
          _searchText = v;
          widget.onSearch?.call(v);
        },
      ),
    );

    final rowInput = SizedBox(
      width: isMobile ? null : 90,
      child: ShadInput(
        placeholder: const Text("Rows"),
        keyboardType: TextInputType.number,
        onSubmitted: (v) {
          final size = int.tryParse(v);
          if (size != null && size > 0) {
            widget.onPageSizeChange?.call(size);
          }
        },
      ),
    );

    final actions = <Widget>[
      if (widget.canCreate)
        ShadButton(
          onPressed: widget.onCreate,
          backgroundColor: const Color(0xFF5E5EDD),
          child: const Text('Create', style: TextStyle(color: Colors.white)),
        ),
      if (widget.canExport)
        ShadButton.outline(
          onPressed: widget.onExport,
          child: const Text('Export'),
        ),
    ];

    if (isMobile) {
      return Column(
        children: [
          if (actions.isNotEmpty)
            Row(children: actions.map((e) => Expanded(child: e)).toList()),
          const SizedBox(height: 12),
          Row(children: [Expanded(child: search)]),
          const SizedBox(height: 10),
          Row(children: [Expanded(child: rowInput)]),
        ],
      );
    }

    return Row(
      children: [
        search,
        const SizedBox(width: 12),
        rowInput,
        const Spacer(),
        ...actions.expand((e) => [e, const SizedBox(width: 8)]).toList()
          ..removeLast(),
      ],
    );
  }

  // ================= TABLE =================

  Widget _table(ShadThemeData theme, bool isMobile) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: PlutoGrid(
        columns: widget.columns,
        rows: widget.rows,
        onLoaded: (event) {
          stateManager = event.stateManager;

          stateManager!
            ..setShowLoading(widget.isLoading)
            ..setPageSize(widget.pageSize, notify: false)
            ..setPage(widget.page, notify: false);

          _lastPage = widget.page;
          _lastPageSize = widget.pageSize;

          if (!_listenerAttached) {
            _listenerAttached = true;
            stateManager!.addListener(_paginationListener);
          }
        },
        createFooter: (state) => PlutoPagination(state),
        configuration: PlutoGridConfiguration(
          style: PlutoGridStyleConfig(
            columnHeight: isMobile ? 45 : 55,
            rowHeight: isMobile ? 55 : 65,
          ),
        ),
      ),
    );
  }

  // ================= PAGINATION LISTENER =================

  void _paginationListener() {
    if (stateManager == null) return;

    final page = stateManager!.page;
    final size = stateManager!.pageSize;

    if (page != null && page != _lastPage) {
      _lastPage = page;
      widget.onPageChange?.call(page);
    }

    if (size != null && size != _lastPageSize) {
      _lastPageSize = size;
      widget.onPageSizeChange?.call(size);
    }
  }

  @override
  void dispose() {
    if (stateManager != null && _listenerAttached) {
      stateManager!.removeListener(_paginationListener);
    }
    super.dispose();
  }
}
