// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/core/enum.dart';
import 'package:rar_sis_fe_fl/app/widgets/form/select.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../controllers/supad_school_level_controller.dart';
import '../../../../../widgets/reusable_pluto_table.dart';
import '../../../../../widgets/right_form_drawer.dart';
import 'package:flutter/services.dart';

class SupadSchoolLevelView extends GetView<SupadSchoolLevelController> {
  const SupadSchoolLevelView({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    controller.bindScaffold(scaffoldKey);

    return Scaffold(
      key: scaffoldKey,

      // 👉 DRAWER KANAN LANGSUNG DI SINI
      endDrawer: RightFormDrawer(
        title: 'Buat Jenjang Sekolah Baru',
        child: formSchoolLevel(),
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

  Widget formSchoolLevel() {
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
              label: const Text('Nama Jenjang'),
              controller: controller.nameController,
              placeholder: const Text('Contoh: SMK, SMA, SMP'),
              validator: (v) {
                if (v == null || v.isEmpty) return 'Nama wajib diisi';
                return null;
              },
            ),
            const SizedBox(height: 24),
            ShadFormBuilderField<SchoolLevelIdentity>(
              id: 'identity',
              label: const Text('Identitas Jenjang'),
              validator: (v) => v == null ? 'Wajib' : null,
              builder: (field) => AppSelectEnumSearch<SchoolLevelIdentity>(
                label: '',
                selectedValue: controller.identity.value,
                values: SchoolLevelIdentity.values,
                labelBuilder: (v) => v.name.replaceAll('_', ' '),
                onChanged: (val) {
                  field.didChange(val);
                  controller.identity.value = val;
                },
              ),
            ),
            const SizedBox(height: 24),
            ShadInputFormField(
              id: 'totalLevel',
              label: const Text('totalLevel'),
              controller: controller.totalLevelController,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
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

                // Is Major (Punya Jurusan?)
                _buildSwitchField(
                  id: 'isMajor',
                  label: 'Memiliki Jurusan',
                  value: controller.isMajor,
                ),

                // Is Enrollment Number (Punya NISN/Nomor Pendaftaran?)
                _buildSwitchField(
                  id: 'isEnrollmentNumber',
                  label: 'Gunakan Nisn untuk Pendaftaran',
                  value: controller.isEnrollmentNumber,
                ),
              ],
            ),

            const SizedBox(height: 32),

            // Tombol Submit
            ShadButton(
              width: double.infinity,
              child: Text(
                controller.levelId.value.isEmpty
                    ? 'Simpan Jenjang'
                    : 'Update Jenjang',
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
