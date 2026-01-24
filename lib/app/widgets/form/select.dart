import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AppSelectEnumSearch<T extends Enum> extends StatefulWidget {
  final String label;
  final T? selectedValue;
  final List<T> values;
  final String Function(T) labelBuilder;
  final void Function(T?) onChanged;

  const AppSelectEnumSearch({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.values,
    required this.labelBuilder,
    required this.onChanged,
  });

  @override
  State<AppSelectEnumSearch<T>> createState() => _AppSelectEnumSearchState<T>();
}

class _AppSelectEnumSearchState<T extends Enum>
    extends State<AppSelectEnumSearch<T>> {
  String searchValue = '';

  List<T> get filteredItems => widget.values
      .where(
        (e) => widget
            .labelBuilder(e)
            .toLowerCase()
            .contains(searchValue.toLowerCase()),
      )
      .toList();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ShadSelect<T>.withSearch(
          minWidth: constraints.maxWidth,
          maxWidth: constraints.maxWidth,
          placeholder: Text('Pilih ${widget.label}...'),
          searchPlaceholder: Text('Cari ${widget.label}'),
          onSearchChanged: (value) => setState(() => searchValue = value),

          // PAKAI initialValue, BUKAN value
          initialValue: widget.selectedValue,
          onChanged: widget.onChanged,

          options: [
            if (filteredItems.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 24),
                child: Center(child: Text('Data tidak ditemukan')),
              ),
            ...widget.values.map((e) {
              return Offstage(
                offstage: !filteredItems.contains(e),
                child: ShadOption(
                  value: e,
                  child: Text(widget.labelBuilder(e)),
                ),
              );
            }),
          ],
          selectedOptionBuilder: (context, value) {
            // 'value' di sini adalah item Enum yang terpilih
            return Text(widget.labelBuilder(value));
          },
        );
      },
    );
  }
}
