import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class RowDetailModal extends StatelessWidget {
  final PlutoRow row;
  final List<String> hiddenFields;

  const RowDetailModal({
    super.key,
    required this.row,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: visibleEntries.map((entry) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      entry.key.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
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
