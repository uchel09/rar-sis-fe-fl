// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../controllers/supad_curriculum_controller.dart';
import '../../../../../widgets/reusable_pluto_table.dart';
import '../../../../../widgets/right_form_drawer.dart';

class SupadCurriculumView extends GetView<SupadCurriculumController> {
  const SupadCurriculumView({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    controller.bindScaffold(scaffoldKey);

    return Scaffold(
      key: scaffoldKey,

      // 👉 DRAWER KANAN LANGSUNG DI SINI
      endDrawer: RightFormDrawer(
        title: 'Buat Kurikulum Baru',
        child: formCurriculum(),
      ),

      body: Obx(
        () => ReusablePlutoTable(
          columns: controller.columns,
          rows: controller.rows.toList(),
          isLoading: controller.isLoading.value,
          onCreate: controller.onCreate,
          dropdownItems: controller.dropdownItems,
          canExport: true,
          onExport: controller.onExport,
          canRefresh: true,
          onRefresh: controller.onRefresh,
        ),
      ),
    );
  }

  Widget formCurriculum() {
    return ShadForm(
      key: controller.formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Nama Jenjang
            ShadInputFormField(
              id: 'name',
              label: const Text('Nama Kurikulum'),
              controller: controller.nameController,
              placeholder: const Text('Contoh: Merdeka, 2013'),
              validator: (v) {
                if (v == null || v.isEmpty) return 'Nama wajib diisi';
                return null;
              },
            ),

            const SizedBox(height: 24),

            // Baris Switch untuk Boolean Fields
            Wrap(
              spacing: 20,
              runSpacing: 20,
              children: [
                // Is Active
                _buildSwitchField(
                  id: 'isActive',
                  label: 'Status Aktif',
                  value: controller.isActive,
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Tombol Submit
            ShadButton(
              width: double.infinity,
              child: Text(
                controller.currId.value.isEmpty ? 'Buat ' : 'Update ',
              ),
              onPressed: () {
                if (controller.isCreate.value) {
                  controller.doCreate();
                } else {
                  controller.doUpdate();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper biar gak nulis berulang buat Switch
  Widget _buildSwitchField({
    required String id,
    required String label,
    required RxBool value,
  }) {
    return ShadFormBuilderField<bool>(
      id: id,
      label: Text(label),
      initialValue: value.value,
      builder: (field) => Obx(
        () => Row(
          children: [
            ShadSwitch(
              value: value.value,
              onChanged: (val) {
                field.didChange(val);
                value.value = val;
              },
            ),
            const SizedBox(width: 8),
            Text(value.value ? 'Ya' : 'Tidak'),
          ],
        ),
      ),
    );
  }
}
