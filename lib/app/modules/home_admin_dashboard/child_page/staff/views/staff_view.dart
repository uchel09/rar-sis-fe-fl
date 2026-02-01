// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/services/school_level/school_level_model.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../controllers/staff_controller.dart'; // Sesuaikan ke StaffController
import '../../../../../widgets/reusable_pluto_table.dart';
import '../../../../../widgets/right_form_drawer.dart';
import '../../../../../widgets/form/multi_select.dart';
import '../../../../../widgets/form/select.dart';
import '../../../../../widgets/form/app_date_picker.dart';
import 'package:rar_sis_fe_fl/app/core/enum.dart';
import 'package:flutter/services.dart';

class StaffView extends GetView<StaffController> {
  const StaffView({super.key});

  @override
  Widget build(BuildContext context) {
    final scaffoldKey = GlobalKey<ScaffoldState>();

    controller.bindScaffold(scaffoldKey);

    return Scaffold(
      key: scaffoldKey,
      // 👉 DRAWER KANAN UNTUK STAFF
      endDrawer: RightFormDrawer(
        title: controller.isCreate.value ? 'Buat Staff Baru' : 'Edit Staff',
        child: formStaff(),
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

  Widget formStaff() {
    return Obx(
      () => ShadForm(
        key: controller.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
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
                  placeholder: const Text('staff@sekolah.com'),
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

              // Penambahan Field JABATAN (STAFF POSITION)
              ShadFormBuilderField<String>(
                id: 'staffPositionId',
                label: const Text('Jabatan / Posisi'),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Pilih Jabatan' : null,
                builder: (field) => ShadSelect<String>(
                  placeholder: const Text('Pilih Jabatan'),
                  options: controller.masterController.allStaffPositions
                      .map(
                        (pos) =>
                            ShadOption(value: pos.id, child: Text(pos.name)),
                      )
                      .toList(),
                  selectedOptionBuilder: (context, value) => Text(
                    controller.masterController.allStaffPositions
                        .firstWhere((e) => e.id == value)
                        .name,
                  ),
                  onChanged: (val) {
                    field.didChange(val);
                    controller.selectedStaffPositionId.value = val;
                  },
                ),
              ),

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
                        label: const Text('Status Akhir'),
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

              ShadFormBuilderField<List<String>>(
                id: 'schoolLevelAccessIds',
                label: const Text('Akses Jenjang Sekolah'),
                initialValue: controller.selectedLevelIds.toList(),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Pilih minimal satu' : null,
                builder: (field) => ShadSelectMultiple<SchoolLevelResponse>(
                  label: "Pilih jenjang",
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
                            ? 'Simpan Staff'
                            : 'Update Staff',
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
