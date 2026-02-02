import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../controllers/sub_curriculum_controller.dart';
import '../../../../../widgets/reusable_pluto_table.dart';
import '../../../../../widgets/right_form_drawer.dart';

class SubCurriculumView extends GetView<SubCurriculumController> {
  const SubCurriculumView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final scaffoldKey = GlobalKey<ScaffoldState>();

    // Bind scaffold key agar controller bisa buka endDrawer
    controller.scaffoldKey = scaffoldKey;

    return Scaffold(
      key: scaffoldKey,
      // 👉 DRAWER KANAN UNTUK FORM CREATE/EDIT
      endDrawer: RightFormDrawer(
        title: controller.isCreate.value
            ? 'Buat Sub Kurikulum'
            : 'Edit Sub Kurikulum',
        child: formSubCurriculum(),
      ),
      body: Obx(() {
        final curriculums = controller.curriculums;

        if (curriculums.isEmpty && controller.isLoading.isFalse) {
          return const Center(child: Text('Tidak ada kurikulum aktif'));
        }

        // Ganti bagian ini:
        // int initialIndex = curriculums
        //     .indexWhere((c) => c.id == controller.selectedCurriculumId.value)
        //     .clamp(0, curriculums.length - 1);

        // Menjadi ini:
        int initialIndex = 0;
        if (curriculums.isNotEmpty) {
          int foundIndex = curriculums.indexWhere(
            (c) => c.id == controller.selectedCurriculumId.value,
          );
          // Jika ditemukan (>= 0), gunakan index tersebut, jika tidak tetap 0
          initialIndex = foundIndex >= 0 ? foundIndex : 0;
        }

        return DefaultTabController(
          length: curriculums.length,
          initialIndex: initialIndex,
          child: Builder(
            builder: (context) {
              final tabController = DefaultTabController.of(context);

              // Listener untuk refresh data saat pindah Tab
              tabController.addListener(() {
                if (!tabController.indexIsChanging) {
                  controller.selectedCurriculumId.value =
                      curriculums[tabController.index].id;
                }
              });

              return Column(
                children: [
                  // --- HEADER: TABBAR ---
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: theme.colorScheme.border),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TabBar(
                            isScrollable: true,
                            tabAlignment: TabAlignment.start,
                            indicatorColor: theme.colorScheme.primary,
                            labelColor: theme.colorScheme.primary,
                            unselectedLabelColor: Colors.grey,
                            dividerColor: Colors.transparent,
                            tabs: curriculums
                                .map((cur) => Tab(text: cur.name))
                                .toList(),
                          ),
                        ),
                        // Switch Aktif/Non-Aktif
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Row(
                            children: [
                              Text(
                                "Tampilkan Aktif",
                                style: theme.textTheme.muted.copyWith(
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(width: 8),
                              ShadSwitch(
                                value: controller.showActive.value,
                                onChanged: (val) =>
                                    controller.showActive.value = val,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // --- CONTENT: PLUTO TABLE ---
                  Expanded(
                    child: TabBarView(
                      physics:
                          const NeverScrollableScrollPhysics(), // Biar tidak slide antar tab (grid sensitif)
                      children: curriculums.map((cur) {
                        return ReusablePlutoTable(
                          columns: controller.columns,
                          rows: controller.rows.toList(),
                          isLoading: controller.isLoading.value,
                          onCreate: controller.onCreate,
                          dropdownItems: controller.dropdownItems,
                          canExport: true,
                          canRefresh: true,
                          onRefresh: () =>
                              controller.fetchByCurriculum(forceRefresh: true),
                        );
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

  // 👉 FORM UNTUK CREATE/UPDATE
  Widget formSubCurriculum() {
    return Obx(
      () => ShadForm(
        key: controller.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Field Nama Sub Kurikulum
              ShadInputFormField(
                id: 'name',
                label: const Text('Nama Sub Kurikulum'),
                controller: controller.nameController,
                placeholder: const Text('Contoh: Tahfidz Reguler'),
                validator: (v) => v.isEmpty
                    ? 'Nama wajib diisi'
                    : (v.length > 100 ? 'Maksimal 100 karakter' : null),
              ),
              const SizedBox(height: 16),

              // Field Jenjang (School Level)
              ShadFormBuilderField<String>(
                id: 'schoolLevelId',
                label: const Text('Jenjang Sekolah'),
                initialValue: controller.selectedSchoolLevelId.value,
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Pilih Jenjang' : null,
                builder: (field) => ShadSelect<String>(
                  placeholder: const Text('Pilih Jenjang'),
                  options: controller.masterController.profileSchoolLevels
                      .map(
                        (lvl) =>
                            ShadOption(value: lvl.id, child: Text(lvl.name)),
                      )
                      .toList(),
                  selectedOptionBuilder: (context, value) {
                    // Cari data secara aman
                    final selected = controller
                        .masterController
                        .profileSchoolLevels
                        .firstWhereOrNull((e) => e.id == value);

                    // Jika ketemu tampilkan nama, jika tidak tampilkan placeholder sementara
                    return Text(selected?.name ?? 'Pilih Jenjang');
                  },
                  onChanged: (val) {
                    field.didChange(val);
                    controller.selectedSchoolLevelId.value = val!;
                  },
                ),
              ),
              const SizedBox(height: 32),

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
