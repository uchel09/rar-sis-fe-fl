import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ShadSelectSingle<T> extends StatelessWidget {
  final String label;
  final List<T> items;
  final String? selectedId;
  final String Function(T) idBuilder;
  final String Function(T) labelBuilder;
  final void Function(String?) onChanged;

  const ShadSelectSingle({
    super.key,
    required this.label,
    required this.items,
    this.selectedId,
    required this.idBuilder,
    required this.labelBuilder,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ShadSelect<String>(
          minWidth: constraints.maxWidth,
          maxWidth: constraints.maxWidth,
          // Gunakan Key agar widget rebuild total saat data berubah
          key: ValueKey('select_${label}_$selectedId'),
          initialValue: selectedId,
          onChanged: onChanged,
          placeholder: Text('Pilih $label'),
          options: items.map((item) {
            final id = idBuilder(item);
            return ShadOption(value: id, child: Text(labelBuilder(item)));
          }).toList(),
          selectedOptionBuilder: (context, value) {
            final item = items.cast<T?>().firstWhere(
              (i) => i != null && idBuilder(i) == value,
              orElse: () => null,
            );
            return Text(item != null ? labelBuilder(item) : 'Pilih $label');
          },
        );
      },
    );
  }
}
