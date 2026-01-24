import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ShadSelectMultiple<T> extends StatelessWidget {
  final String label;
  final List<T> items;
  final List<String> selectedIds;
  final String Function(T) idBuilder;
  final String Function(T) labelBuilder;
  final void Function(List<String>) onChanged;

  const ShadSelectMultiple({
    super.key,
    required this.label,
    required this.items,
    required this.selectedIds,
    required this.idBuilder,
    required this.labelBuilder,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ShadSelect<String>.multiple(
          minWidth: constraints.maxWidth,
          maxWidth: constraints.maxWidth,
          initialValues: selectedIds.toSet(),
          onChanged: (Set<String> values) => onChanged(values.toList()),
          placeholder: Text('Pilih $label'),
          options: [
            ...items.map((item) {
              final id = idBuilder(item);
              final isSelected = selectedIds.contains(id);

              return ShadOption(
                value: id,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      labelBuilder(item),
                      // Kasih warna teks biru kalau terpilih biar makin tegas
                      style: TextStyle(
                        color: isSelected ? Colors.blue.shade700 : null,
                        fontWeight: isSelected ? FontWeight.bold : null,
                      ),
                    ),
                    if (isSelected)
                      Icon(
                        Icons
                            .check_circle_rounded, // Pake yang rounded biar modern
                        size: 20,
                        color: Colors.blue.shade400, // Biru muda cerah
                      ),
                  ],
                ),
              );
            }),
          ],
          selectedOptionsBuilder: (context, values) {
            if (values.isEmpty) return Text('Pilih $label');

            return Wrap(
              spacing: 4,
              runSpacing: 4,
              children: items
                  .where((i) => values.contains(idBuilder(i)))
                  .map(
                    (i) => Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(color: Colors.blue.shade200),
                      ),
                      child: Text(
                        labelBuilder(i),
                        style: const TextStyle(
                          fontSize: 11,
                          color: Colors.blue,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            );
          },
        );
      },
    );
  }
}
