import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RowDetailModal extends StatelessWidget {
  final PlutoRow row;
  final List<PlutoColumn> columns; // Tambahkan ini
  final List<String> hiddenFields;

  const RowDetailModal({
    super.key,
    required this.row,
    required this.columns, // Wajib diisi
    this.hiddenFields = const [],
  });

  @override
  Widget build(BuildContext context) {
    final visibleEntries = row.cells.entries
        .where((e) => !hiddenFields.contains(e.key))
        .toList();

    return ShadDialog(
      title: const Text('Detail Data'),
      child: SizedBox(
        width: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: visibleEntries.map((entry) {
            // CARA AMBIL TITLE LANGSUNG:
            // Cari kolom yang field-nya sama dengan key cell saat ini
            final column = columns.firstWhere(
              (col) => col.field == entry.key,
              orElse: () => PlutoColumn(
                title: entry.key, // Fallback ke key jika tidak ketemu
                field: entry.key,
                type: PlutoColumnType.text(),
              ),
            );

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      column.title, // Gunakan title dari column
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Text(" : "),
                  Expanded(
                    flex: 3,
                    child: Text(entry.value.value?.toString() ?? '-'),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
