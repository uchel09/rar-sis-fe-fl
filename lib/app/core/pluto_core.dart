// pluto_utils.dart
import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

List<DropdownMenuItem<String>> getColumnDropdownOptions(
  List<PlutoColumn> columns,
  List<String> fieldForb, // daftar field yang dilarang
) {
  return columns
      .where(
        (col) => !fieldForb.contains(col.field),
      ) // filter berdasarkan fieldForb
      .map(
        (col) =>
            DropdownMenuItem<String>(value: col.field, child: Text(col.title)),
      )
      .toList();
}
