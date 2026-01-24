// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/services/school_level/school_level_model.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../controllers/supad_admin_controller.dart';
import '../../../../../widgets/reusable_pluto_table.dart';
import '../../../../../widgets/right_form_drawer.dart';
import '../../../../../widgets/form/multi_select.dart';
import '../../../../../widgets/form/select.dart';
import '../../../../../widgets/form/app_date_picker.dart';
import 'package:rar_sis_fe_fl/app/core/enum.dart';
import 'package:flutter/services.dart';

class SupadAdminView extends GetView<SupadAdminController> {
  const SupadAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    controller.bindScaffold(scaffoldKey);

    return Scaffold(
      key: scaffoldKey,

      // 👉 DRAWER KANAN LANGSUNG DI SINI
      endDrawer: RightFormDrawer(
        title: 'Buat Admin Sekolah Baru',
        child: formAdmin(),
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

  Widget formAdmin() {
    return Obx(
      () => ShadForm(
        key: controller.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ==========================================
              // SECTION 1: USER BASIC DATA
              // ==========================================
              ShadInputFormField(
                id: 'fullName',
                label: const Text('Nama Lengkap'),
                controller: controller.fullNameController,
                placeholder: const Text('Masukkan nama lengkap'),
                validator: (v) => v.length < 3 ? 'Minimal 3 karakter' : null,
              ),

              const SizedBox(height: 16),
              if (controller.isCreate.value)
                ShadInputFormField(
                  id: 'email',
                  label: const Text('Email'),
                  controller: controller.emailController,
                  placeholder: const Text('admin@sekolah.com'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) =>
                      !GetUtils.isEmail(v) ? 'Email tidak valid' : null,
                ),

              const SizedBox(height: 16),

              // Row Gender & Role (Enum)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ShadFormBuilderField<Gender>(
                      id: 'gender',
                      label: const Text('Jenis Kelamin'),
                      validator: (v) => v == null ? 'Wajib' : null,
                      builder: (field) => AppSelectEnumSearch<Gender>(
                        label: '',
                        selectedValue: controller.gender.value,
                        values: Gender.values,
                        labelBuilder: (v) =>
                            v == Gender.MALE ? 'Laki-laki' : 'Perempuan',
                        onChanged: (val) {
                          field.didChange(val);
                          controller.gender.value = val;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ShadInputFormField(
                      id: 'phone',
                      label: const Text('No. HP'),
                      controller: controller.phoneController,
                      placeholder: const Text('0812...'),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              //alamat
              ShadInputFormField(
                id: 'address',
                label: const Text('Alamat'),
                controller: controller.addressController,
                maxLines: 2,
              ),

              const SizedBox(height: 32),

              // ==========================================
              // SECTION 2: PROFILE & EMPLOYMENT
              // ==========================================
              Text(
                'Data Kepegawaian',
                style: ShadTheme.of(Get.context!).textTheme.large,
              ),
              const Divider(),
              const SizedBox(height: 16),
              //nik dan dob
              Row(
                children: [
                  Expanded(
                    child: ShadInputFormField(
                      id: 'nik',
                      label: const Text('NIK'),
                      controller: controller.nikController,
                      placeholder: const Text('16 Digit NIK'),
                      // Tambahin validator di sini
                      validator: (v) {
                        // 1. Cek dulu apakah kosong
                        if (v == null || v.isEmpty) return 'Wajib diisi';

                        // 2. Baru cek panjangnya
                        if (v.length < 16) return 'Harus 16 digit';

                        // 3. Cek apakah angka semua
                        if (!GetUtils.isNumericOnly(v)) {
                          return 'Harus berupa angka';
                        }

                        return null;
                      },
                      // Opsional: Batasi inputan biar cuma bisa angka dan max 16 digit di keyboard
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(16),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ShadInputFormField(
                      id: 'birthPlace',
                      label: const Text('Tempat Lahir'),
                      controller: controller.bPlaceController,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              // nip dan status
              if (!controller.isCreate.value)
                Row(
                  children: [
                    Expanded(
                      child: ShadInputFormField(
                        id: 'nip',
                        label: const Text('NIP (optional bila sudah ada)'),
                        controller: controller.nipController,
                        placeholder: const Text('minimal 9 Digit'),
                        // Tambahin validator di sini
                        validator: (v) {
                          // 1. Kalau kosong, boleh (karena di DB boleh null)

                          if (v == null || v.isEmpty) return null;

                          // 2. Tapi kalau user ngetik, minimal harus 9 digit (misal)
                          if (v.length < 9) return 'NIP minimal 9 digit';

                          // 3. Harus angka
                          if (!GetUtils.isNumericOnly(v)) {
                            return 'NIP harus berupa angka';
                          }

                          return null;
                        },
                        // Opsional: Batasi inputan biar cuma bisa angka dan max 16 digit di keyboard
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(9),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),

                    Expanded(
                      child: ShadFormBuilderField<EmployeeStatus>(
                        id: 'status',
                        label: const Text('Status Pegawai'),
                        // 1. Tambahin initialValue biar pas Update langsung dapet data
                        initialValue: controller.status.value,
                        validator: (v) => v == null ? 'Wajib' : null,
                        builder: (field) => AppSelectEnumSearch<EmployeeStatus>(
                          // Pastikan Tipe-nya EmployeeStatus
                          label: '',
                          // 2. Hubungkan ke controller status, bukan gender!
                          selectedValue: controller.status.value,
                          values: EmployeeStatus.values,
                          // 3. Sesuaikan label dengan isi EmployeeStatus lo
                          labelBuilder: (v) => v.name.toUpperCase(),
                          onChanged: (val) {
                            field.didChange(val);
                            // 4. Update ke variable status
                            controller.status.value = val!;
                          },
                        ),
                      ),
                    ),
                  ],
                ),

              const SizedBox(height: 16),
              // DOB Picker
              ShadFormBuilderField<DateTime>(
                id: 'dob',
                label: const Text('Tanggal Lahir'),
                validator: (v) => v == null ? 'Wajib diisi' : null,
                builder: (field) => AppDatePicker(
                  label: '',
                  value: controller.dob.value,
                  onChanged: (date) {
                    field.didChange(date);
                    controller.dob.value = date;
                  },
                ),
              ),

              const SizedBox(height: 16),
              // Hire Date Picker
              if (controller.isCreate.value)
                ShadFormBuilderField<DateTime>(
                  id: 'hireDate',
                  label: const Text('Tanggal Mulai Kerja'),
                  validator: (v) => v == null ? 'Wajib diisi' : null,
                  builder: (field) => AppDatePicker(
                    label: '',
                    value: controller.hireDate.value,
                    onChanged: (date) {
                      field.didChange(date);
                      controller.hireDate.value = date;
                    },
                  ),
                ),

              const SizedBox(height: 16),

              // Multi Select Jenjang
              ShadFormBuilderField<List<String>>(
                id: 'schoolLevelAccessIds',
                label: const Text('Akses Jenjang Sekolah'),
                initialValue: controller.selectedLevelIds.toList(),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Pilih minimal satu' : null,
                builder: (field) => ShadSelectMultiple<SchoolLevelResponse>(
                  label: "pilih jenjang",

                  items: controller.schoolLevel.allSchoolLevels,
                  selectedIds: controller.selectedLevelIds.toList(),
                  idBuilder: (v) => v.id,
                  labelBuilder: (v) => v.name,
                  onChanged: (val) {
                    controller.selectedLevelIds.assignAll(val);
                    field.didChange(val);
                  },
                ),
              ),

              const SizedBox(height: 16),

              // Switch Honor
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Status Guru Honor?'),
                  ShadSwitch(
                    value: controller.isHonor.value,
                    onChanged: (v) => controller.isHonor.value = v,
                  ),
                ],
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
                      child: const Text('Simpan Admin'),
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
