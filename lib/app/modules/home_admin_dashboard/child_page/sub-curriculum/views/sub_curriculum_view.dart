import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../controllers/sub_curriculum_controller.dart';
import '../../../../../widgets/reusable_pluto_table.dart';
import '../../../../../widgets/right_form_drawer.dart';
import 'package:flutter/services.dart';
import 'package:rar_sis_fe_fl/app/services/sub_curriculum/sub_curriculum_model.dart';

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
      endDrawer: Obx(
        () => RightFormDrawer(
          title: controller.isManageSubjects.value
              ? 'Manage Mata Pelajaran'
              : (controller.isCreate.value
                    ? 'Buat Sub Kurikulum'
                    : 'Edit Sub Kurikulum'),
          child: controller.isManageSubjects.value
              ? listSubjectPicker(context) // Widget baru
              : formSubCurriculum(),
        ),
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
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Tombol Kurang
                  ShadButton.outline(
                    child: const Icon(Icons.remove, size: 16),
                    onPressed: () {
                      int current =
                          int.tryParse(
                            controller.minutesPerjPController.text,
                          ) ??
                          35;
                      if (current > 5) {
                        controller.minutesPerjPController.text = (current - 5)
                            .toString();
                      }
                    },
                  ),
                  const SizedBox(width: 8),

                  // Input Tengah
                  Expanded(
                    child: ShadInputFormField(
                      id: 'minutesPerJp',
                      label: const Text('Menit per JP'),
                      controller: controller.minutesPerjPController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),

                  const SizedBox(width: 8),
                  // Tombol Tambah
                  ShadButton.outline(
                    child: const Icon(Icons.add, size: 16),
                    onPressed: () {
                      int current =
                          int.tryParse(
                            controller.minutesPerjPController.text,
                          ) ??
                          35;
                      controller.minutesPerjPController.text = (current + 5)
                          .toString();
                    },
                  ),
                ],
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

  Widget listSubjectPicker(BuildContext context) {
    return Obx(() {
      // 1. State Loading
      if (controller.isLoading.value) {
        return const SizedBox(
          height: 300,
          child: Center(child: CircularProgressIndicator()),
        );
      }

      // 2. State Kosong
      if (controller.availableSubjects.isEmpty) {
        return const Padding(
          padding: EdgeInsets.all(24.0),
          child: Center(
            child: Text(
              "Tidak ada daftar mata pelajaran untuk jenjang ini. Silakan buat di Master Mapel.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ),
        );
      }

      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header Info
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: // Ganti bagian Alert tadi dengan ini:
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: ShadTheme.of(
                    context,
                  ).colorScheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: ShadTheme.of(
                      context,
                    ).colorScheme.primary.withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 16,
                      color: ShadTheme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    const Expanded(
                      child: Text(
                        "Pilih mata pelajaran dan tentukan jumlah Jam Pelajaran (JP) per minggu.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // List Mata Pelajaran
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.availableSubjects.length,
            itemBuilder: (context, index) {
              final subject = controller.availableSubjects[index];

              // Bungkus dengan Obx di sini agar setiap perubahan di list terpantau
              return Obx(() {
                // Logic pengecekan apakah id mapel ini ada di list terpilih
                final assignItem = controller.selectedSubjectsForAssign
                    .firstWhereOrNull((s) => s.subjectId == subject.id);
                final bool isSelected = assignItem != null;

                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isSelected, // Sekarang reaktif
                        onChanged: (val) {
                          controller.toggleSubject(subject.id, val ?? false);
                        },
                      ),
                      Expanded(
                        child: Text('${subject.name} ${subject.subName}'),
                      ),
                      if (isSelected)
                        SizedBox(
                          width: 60,
                          child: ShadInput(
                            initialValue: assignItem.hoursPerWeek.toString(),
                            onChanged: (v) =>
                                controller.updateJP(subject.id, v),
                          ),
                        ),
                    ],
                  ),
                );
              });
            },
          ),

          // Footer Actions
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ShadButton.outline(
                    child: const Text("Batal"),
                    onPressed: () =>
                        controller.scaffoldKey.currentState?.closeEndDrawer(),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ShadButton(
                    onPressed: controller.doBulkAssign,
                    child: const Text("Simpan"),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}
