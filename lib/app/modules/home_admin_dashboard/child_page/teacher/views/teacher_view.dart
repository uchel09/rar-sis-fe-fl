// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/services/school_level/school_level_model.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../controllers/teacher_controller.dart';
import '../../../../../widgets/reusable_pluto_table.dart';
import '../../../../../widgets/right_form_drawer.dart';
import '../../../../../widgets/form/multi_select.dart';
import '../../../../../widgets/form/select.dart';
import '../../../../../widgets/form/app_date_picker.dart';
import 'package:rar_sis_fe_fl/app/core/enum.dart';
import 'package:flutter/services.dart';

class TeacherView extends GetView<TeacherController> {
  const TeacherView({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    controller.bindScaffold(scaffoldKey);

    return Scaffold(
      key: scaffoldKey,

      // 👉 DRAWER KANAN LANGSUNG DI SINI
      endDrawer: RightFormDrawer(title: 'Buat Guru Baru', child: formTeacher()),

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

  Widget formTeacher() {
    return Obx(
      () => ShadForm(
        key: controller.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(
            16,
          ), // Padding sedikit diperlebar agar rapi di Tablet
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

              Row(
                children: [
                  Expanded(
                    child: ShadInputFormField(
                      id: 'nik',
                      label: const Text('NIK'),
                      controller: controller.nikController,
                      placeholder: const Text('16 Digit NIK'),
                      validator: (v) {
                        if (v == null || v.isEmpty) return 'Wajib diisi';
                        if (v.length < 16) return 'Harus 16 digit';
                        if (!GetUtils.isNumericOnly(v))
                          return 'Harus berupa angka';
                        return null;
                      },
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

              // Tipe Pegawai & Work Status (BARU)
              Row(
                children: [
                  Expanded(
                    child: ShadFormBuilderField<EmployeeType>(
                      id: 'employeeType',
                      label: const Text('Tipe Pegawai'),
                      validator: (v) => v == null ? 'Wajib' : null,
                      builder: (field) => AppSelectEnumSearch<EmployeeType>(
                        label: '',
                        selectedValue: controller.employeeType.value,
                        values: EmployeeType.values,
                        labelBuilder: (v) => v.name.replaceAll('_', ' '),
                        onChanged: (val) {
                          field.didChange(val);
                          controller.employeeType.value = val;
                        },
                      ),
                    ),
                  ),
                  if (!controller.isCreate.value) ...[
                    const SizedBox(width: 16),
                    Expanded(
                      child: ShadFormBuilderField<WorkStatus>(
                        id: 'workStatus',
                        label: const Text('Status Kehadiran'),
                        builder: (field) => AppSelectEnumSearch<WorkStatus>(
                          label: '',
                          selectedValue: controller.workStatus.value,
                          values: WorkStatus.values,
                          labelBuilder: (v) => v.name,
                          onChanged: (val) {
                            field.didChange(val);
                            controller.workStatus.value = val;
                          },
                        ),
                      ),
                    ),
                  ],
                ],
              ),

              const SizedBox(height: 16),

              // NIP & End Status (Hanya muncul jika Update)
              if (!controller.isCreate.value)
                Row(
                  children: [
                    Expanded(
                      child: ShadInputFormField(
                        id: 'nip',
                        label: const Text('NIP (Opsional)'),
                        controller: controller.nipController,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(9),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ShadFormBuilderField<EmployeeEndStatus>(
                        id: 'endStatus',
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Status Akhir'),

                            // Tombol Reset ke Null
                          ],
                        ),
                        builder: (field) =>
                            AppSelectEnumSearch<EmployeeEndStatus>(
                              label: '',
                              selectedValue: controller.endStatus.value,
                              values: EmployeeEndStatus.values,
                              labelBuilder: (v) => v.name,
                              onChanged: (val) {
                                field.didChange(val);
                                controller.endStatus.value = val;
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

              // Hire Date & Hire End (BARU)
              Row(
                children: [
                  Expanded(
                    child: ShadFormBuilderField<DateTime>(
                      id: 'hireDate',
                      label: const Text('Mulai Kerja'),
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
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ShadFormBuilderField<DateTime>(
                      id: 'hireEnd',
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Berakhir Kerja'),
                          // Tombol Hapus muncul jika tanggal sudah terisi
                          Obx(
                            () => controller.hireEnd.value != null
                                ? GestureDetector(
                                    onTap: () {
                                      controller.hireEnd.value = null;
                                      controller
                                          .formKey
                                          .currentState
                                          ?.fields['hireEnd']
                                          ?.didChange(null);
                                    },
                                    child: const Text(
                                      'Hapus',
                                      style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          ),
                        ],
                      ),
                      builder: (field) => AppDatePicker(
                        label: '',
                        value: controller.hireEnd.value,
                        onChanged: (date) {
                          field.didChange(date);
                          controller.hireEnd.value = date;
                        },
                      ),
                    ),
                  ),
                ],
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
                  items: controller.masterController.allSchoolLevels,
                  selectedIds: controller.selectedLevelIds.toList(),
                  idBuilder: (v) => v.id,
                  labelBuilder: (v) => v.name,
                  onChanged: (val) {
                    controller.selectedLevelIds.assignAll(val);
                    field.didChange(val);
                  },
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
