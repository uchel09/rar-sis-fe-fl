import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class AppSelectEnum<T extends Enum> extends StatelessWidget {
  final String label;
  final T selectedValue;
  final List<T> values;
  final void Function(T?) onChanged;
  final String Function(T)? labelBuilder;

  const AppSelectEnum({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.values,
    required this.onChanged,
    this.labelBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ShadSelect<T>(
          minWidth: constraints.maxWidth,
          maxWidth: constraints.maxWidth,
          initialValue: selectedValue,
          onChanged: onChanged,
          selectedOptionBuilder: (context, value) =>
              Text(labelBuilder?.call(value) ?? value.name.toUpperCase()),
          options: values.map((e) {
            return ShadOption(
              value: e,
              child: Text(labelBuilder?.call(e) ?? e.name.toUpperCase()),
            );
          }).toList(),
        );
      },
    );
  }
}
