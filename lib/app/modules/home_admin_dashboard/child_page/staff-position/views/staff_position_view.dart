import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../widgets/reusable_pluto_table.dart';
import '../../../../../widgets/right_form_drawer.dart';
import '../controllers/staff_position_controller.dart';

class StaffPositionView extends GetView<StaffPositionController> {
  const StaffPositionView({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    controller.bindScaffold(scaffoldKey);

    return Scaffold(
      key: scaffoldKey,
      // Form diletakkan di Drawer Kanan sesuai pola project Anda
      endDrawer: Obx(
        () => RightFormDrawer(
          title: controller.isCreate.value
              ? 'Tambah Jabatan'
              : 'Update Jabatan',
          child: _formStaffPosition(),
        ),
      ),
      body: Obx(
        () => ReusablePlutoTable(
          columns: controller.columns,
          rows: controller.rows.toList(),
          isLoading: controller.isLoading.value,
          onCreate: controller.onCreate,
          canCreate: true,
          dropdownItems: controller.dropdownItems,
          canExport: true,
          onExport: () => controller.onRefresh(), // Atau logic export Anda
          canRefresh: true,
          onRefresh: controller.onRefresh,
        ),
      ),
    );
  }

  Widget _formStaffPosition() {
    return Obx(
      () => ShadForm(
        key: controller.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Informasi Jabatan',
                style: ShadTheme.of(Get.context!).textTheme.large,
              ),
              const Divider(),
              const SizedBox(height: 16),

              // Nama Jabatan
              ShadInputFormField(
                id: 'name',
                label: const Text('Nama Jabatan'),
                controller: controller.nameController,
                placeholder: const Text('Misal: Satpam, Tata Usaha dll'),
                validator: (v) =>
                    v.isEmpty ? 'Nama jabatan tidak boleh kosong' : null,
              ),

              const SizedBox(height: 16),

              // Deskripsi
              ShadInputFormField(
                id: 'description',
                label: const Text('Deskripsi'),
                controller: controller.descController,
                placeholder: const Text(
                  'Tuliskan deskripsi singkat jabatan...',
                ),
                maxLines: 3,
              ),

              const SizedBox(height: 16),

              // Status Aktif (Switch/Checkbox menggunakan ShadFormBuilderField)
              ShadFormBuilderField<bool>(
                id: 'isActive',
                label: const Text('Status Jabatan'),
                initialValue: controller.isActive.value,
                builder: (field) => Row(
                  children: [
                    ShadSwitch(
                      value: field.value ?? true,
                      onChanged: (val) {
                        field.didChange(val);
                        controller.isActive.value = val;
                      },
                    ),
                    const SizedBox(width: 8),
                    Text(
                      controller.isActive.value ? 'Aktif' : 'Non-Aktif',
                      style: TextStyle(
                        color: controller.isActive.value
                            ? Colors.green
                            : Colors.red,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 40),

              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ShadButton.outline(
                      child: const Text('Batal'),
                      onPressed: () =>
                          controller.scaffoldKey.currentState?.closeEndDrawer(),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ShadButton(
                      child: Text(
                        controller.isCreate.value
                            ? 'Simpan Jabatan'
                            : 'Update Jabatan',
                      ),
                      onPressed: () {
                        if (controller.isCreate.value) {
                          controller.doCreate();
                        } else {
                          controller.doUpdate();
                        }
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
