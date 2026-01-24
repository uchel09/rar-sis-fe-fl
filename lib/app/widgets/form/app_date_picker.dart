import 'package:flutter/material.dart';

import 'package:shadcn_ui/shadcn_ui.dart';

class AppDatePicker extends StatelessWidget {
  final String label;
  final DateTime? value;
  final Function(DateTime?) onChanged;
  final String? placeholder;

  const AppDatePicker({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(label, style: ShadTheme.of(context).textTheme.list),
          const SizedBox(height: 8),
        ],
        // Tombol yang trigger DatePicker
        ShadButton.outline(
          width: double.infinity,
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
              context: context,
              initialDate: value ?? DateTime.now(),
              firstDate: DateTime(1950), // Buat DOB
              lastDate: DateTime(2100),
              // Styling biar mirip Shadcn
              builder: (context, child) {
                return Theme(
                  data: Theme.of(context).copyWith(
                    colorScheme: ColorScheme.light(
                      primary: ShadTheme.of(context).colorScheme.primary,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (picked != null) onChanged(picked);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value != null
                    ? DateFormat('dd MMMM yyyy').format(value!)
                    : (placeholder ?? 'Pilih tanggal'),
                style: ShadTheme.of(context).textTheme.muted,
              ),
              Icon(
                LucideIcons.calendar,
                size: 16,
                color: ShadTheme.of(context).colorScheme.mutedForeground,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
