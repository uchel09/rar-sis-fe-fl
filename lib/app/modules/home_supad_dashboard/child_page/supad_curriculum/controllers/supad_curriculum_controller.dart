import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:pluto_grid/pluto_grid.dart';

class SupadCurriculumController extends GetxController {
  // 1. Reactive Variables
  var rows = <PlutoRow>[].obs;
  var isLoading = false.obs;

  // 2. Definisi Kolom (Late karena butuh context/init)
  late List<PlutoColumn> columns;

  @override
  void onInit() {
    _initColumns();
    fetchData(); // Load data dummy
    super.onInit();
  }

  // 3. Konfigurasi Kolom & Renderer Action
  void _initColumns() {
    columns = [
      PlutoColumn(
        title: 'ID',
        field: 'id',
        type: PlutoColumnType.text(),
        width: 100,
      ),
      PlutoColumn(
        title: 'Nama Sekolah',
        field: 'name',
        type: PlutoColumnType.text(),
        width: 250,
      ),
      PlutoColumn(
        title: 'Email',
        field: 'email',
        type: PlutoColumnType.text(),
        width: 200,
      ),
      PlutoColumn(
        title: 'Status',
        field: 'status',
        type: PlutoColumnType.text(),
        width: 150,
      ),
      PlutoColumn(
        title: 'Actions',
        field: 'actions',
        type: PlutoColumnType.text(),
        enableSorting: false,
        enableFilterMenuItem: false,
        width: 130,
        renderer: (rendererContext) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                icon: const Icon(Icons.edit, size: 16, color: Colors.blue),
                onPressed: () => onUpdate(rendererContext.row.toJson()),
              ),
              IconButton(
                icon: const Icon(Icons.delete, size: 16, color: Colors.red),
                onPressed: () => doDelete(rendererContext.row.toJson()),
              ),
            ],
          );
        },
      ),
    ];
  }

  // 4. Fetch Data & Mapping Manual (Langsung di sini)
  void fetchData() {
    isLoading.value = true;

    // Dummy Data Mentah
    final List<Map<String, dynamic>> dummyRaw = [
      {
        'id': 'SCH-001',
        'name': 'SMA Negeri 1 Jakarta',
        'email': 'info@sman1jkt.sch.id',
        'status': 'Aktif',
      },
      {
        'id': 'SCH-002',
        'name': 'SMK Taruna Bhakti',
        'email': 'admin@tarunabhakti.sch.id',
        'status': 'Aktif',
      },
      {
        'id': 'SCH-003',
        'name': 'SMP Internasional',
        'email': 'contact@smpinter.com',
        'status': 'Non-Aktif',
      },
    ];

    // Proses Mapping Manual ke PlutoRow
    final mappedRows = dummyRaw.map((item) {
      return PlutoRow(
        cells: {
          'id': PlutoCell(value: item['id']),
          'name': PlutoCell(value: item['name']),
          'email': PlutoCell(value: item['email']),
          'status': PlutoCell(value: item['status']),
          'actions': PlutoCell(value: ''), // Kosong karena dirender IconButton
        },
      );
    }).toList();

    rows.assignAll(mappedRows);
    isLoading.value = false;
  }

  // 5. CRUD Logic
  void onCreate() {
    Get.snackbar(
      "Create",
      "Membuka form tambah data sekolah",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void onUpdate(Map<String, dynamic> data) {
    Get.snackbar(
      "Update",
      "Edit sekolah: ${data['name']}",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void doDelete(Map<String, dynamic> data) {
    // Contoh delete lokal (offline)
    rows.removeWhere((row) => row.cells['id']?.value == data['id']);
    Get.snackbar(
      "Delete",
      "Berhasil menghapus ${data['name']}",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
