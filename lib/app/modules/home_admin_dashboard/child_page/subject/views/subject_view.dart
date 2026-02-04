import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/services/school_level/school_level_model.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../controllers/subject_controller.dart';
import '../../../../../widgets/reusable_pluto_table.dart';
import '../../../../../widgets/right_form_drawer.dart';
// ignore_for_file: unnecessary_null_comparison

import '../../../../../widgets/form/multi_select.dart';

class SubjectView extends GetView<SubjectController> {
  const SubjectView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final scaffoldKey = GlobalKey<ScaffoldState>();
    controller.scaffoldKey = scaffoldKey;

    return Scaffold(
      key: scaffoldKey,
      endDrawer: Obx(
        () => RightFormDrawer(
          title: controller.isCreate.value
              ? 'Buat Mata Pelajaran'
              : 'Update Mata Pelajaran',
          child: formSubject(),
        ),
      ),
      body: Obx(() {
        // Tab diambil dari School Level (SD, SMP, SMA, dst)
        final levels = controller.masterController.profileSchoolLevels;

        if (levels.isEmpty && controller.isLoading.isFalse) {
          return const Center(child: Text('Tidak ada jenjang aktif'));
        }

        // Logic index agar tab tidak reset ke nol saat reactive update
        int initialIndex = 0;
        if (levels.isNotEmpty) {
          int foundIndex = levels.indexWhere(
            (l) => l.id == controller.selectedLevelId.value,
          );
          initialIndex = foundIndex >= 0 ? foundIndex : 0;
        }

        return DefaultTabController(
          length: levels.length,
          initialIndex: initialIndex,
          child: Builder(
            builder: (context) {
              final tabController = DefaultTabController.of(context);

              tabController.addListener(() {
                if (!tabController.indexIsChanging) {
                  controller.selectedLevelId.value =
                      levels[tabController.index].id;
                }
              });

              return Column(
                children: [
                  // --- TABBAR: BERDASARKAN JENJANG ---
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: theme.colorScheme.border),
                      ),
                    ),
                    child: TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      indicatorColor: theme.colorScheme.primary,
                      labelColor: theme.colorScheme.primary,
                      unselectedLabelColor: Colors.grey,
                      dividerColor: Colors.transparent,
                      tabs: levels.map((l) => Tab(text: l.name)).toList(),
                    ),
                  ),

                  // --- TABLE CONTENT ---
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: levels.map((cur) {
                        return Obx(() {
                          final tableKey = ValueKey(
                            'table_${cur.id}_${controller.rows.hashCode}',
                          );
                          return ReusablePlutoTable(
                            key: tableKey,
                            columns: controller.columns,
                            rows: controller.rows.toList(),
                            isLoading: controller.isLoading.value,
                            onCreate: controller.onCreate,
                            dropdownItems: controller.dropdownItems,
                            canExport: true,
                            canRefresh: true,
                            onRefresh: () => controller.fetchBySchoolLevel(
                              forceRefresh: true,
                            ),
                          );
                        });
                      }).toList(),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      }),
    );
  }

  Widget formSubject() {
    return Obx(
      () => ShadForm(
        key: controller.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShadInputFormField(
                id: 'name',
                label: const Text('Nama Mata Pelajaran'),
                controller: controller.nameController,
                placeholder: const Text('Contoh: Matematika'),
                validator: (v) => v.isEmpty ? 'Nama wajib diisi' : null,
              ),
              SizedBox(height: 15),
              ShadInputFormField(
                id: 'subName',
                label: const Text('Sub Mapel (optional)'),
                description: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Contoh: Mapel Agama -> Sub: Islam, Kristen, Buddha, dll',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                    Text(
                      'Contoh: Mapel Seni -> Sub: Tari, Musik, dll.',
                      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                    ),
                  ],
                ),
                controller: controller.subNameController,
                placeholder: const Text('Contoh: Kristen, Islam, Tari, Musik'),
                // Validator diperbaiki agar tidak memaksa user mengisi
                validator: (v) {
                  if (v != null && v.isNotEmpty && v.length > 100) {
                    return 'Maksimal 100 karakter';
                  }
                  return null; // Mengembalikan null berarti valid (boleh kosong)
                },
              ),
              const SizedBox(height: 16),

              // Multi-Select Jenjang karena satu Mapel bisa untuk banyak Jenjang
              ShadFormBuilderField<List<String>>(
                id: 'schoolLevelAccessIds',
                label: const Text('Akses Jenjang Sekolah'),
                initialValue: controller.selectedAccessLevelIds.toList(),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Pilih minimal satu' : null,
                builder: (field) => ShadSelectMultiple<SchoolLevelResponse>(
                  label: "pilih jenjang",
                  items: controller.masterController.profileSchoolLevels,
                  selectedIds: controller.selectedAccessLevelIds.toList(),
                  idBuilder: (v) => v.id,
                  labelBuilder: (v) => v.name,
                  onChanged: (val) {
                    controller.selectedAccessLevelIds.assignAll(val);
                    field.didChange(val);
                  },
                ),
              ),
              const SizedBox(height: 32),

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
                        controller.isCreate.value ? 'Simpan' : 'Update',
                      ),
                      onPressed: () => controller.isCreate.value
                          ? controller.doCreate()
                          : controller.doUpdate(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
