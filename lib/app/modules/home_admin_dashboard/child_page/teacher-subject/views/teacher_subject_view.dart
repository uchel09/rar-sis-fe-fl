import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rar_sis_fe_fl/app/services/subject/subject_model.dart';
import 'package:rar_sis_fe_fl/app/services/teacher/teacher_model.dart';
import 'package:rar_sis_fe_fl/app/services/teacher_subject/teacher_subject_model.dart';
import '../../../../../widgets/form/single_select.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../controllers/teacher_subject_controller.dart';
import '../../../../../widgets/reusable_pluto_table.dart';
import '../../../../../widgets/right_form_drawer.dart';

class TeacherSubjectView extends GetView<TeacherSubjectController> {
  const TeacherSubjectView({super.key});

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
              ? 'Tambah Penugasan Guru'
              : 'Update Penugasan Guru',
          child: formTeacherSubject(),
        ),
      ),
      body: Obx(() {
        final levels = controller.masterController.profileSchoolLevels;

        if (levels.isEmpty && controller.isLoading.isFalse) {
          return const Center(child: Text('Tidak ada jenjang aktif'));
        }

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
                  // --- TABBAR JENJANG ---
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

                  // --- CONTENT TABLE ---
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: levels.map((cur) {
                        return Obx(() {
                          return ReusablePlutoTable(
                            key: ValueKey(
                              'ts_table_${cur.id}_${controller.rows.hashCode}',
                            ),
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

  Widget formTeacherSubject() {
    return Obx(
      () => ShadForm(
        key: controller.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- SELECT GURU ---
              ShadFormBuilderField<String>(
                key: const ValueKey('teacher_field'),
                id: 'teacherId',
                label: Text("Nama Guru"),
                initialValue: controller.selectedTeacherId.value,
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Pilih Guru' : null,
                builder: (field) => ShadSelectSingle<TeacherResponse>(
                  label: '',
                  items: controller.teachers,
                  selectedId: field.value,
                  idBuilder: (v) => v.id,
                  labelBuilder: (v) => '${v.user.fullName}',
                  onChanged: (val) {
                    field.didChange(val);
                    controller.selectedTeacherId.value = val ?? "";
                  },
                ),
              ),
              const SizedBox(height: 16),

              // --- SELECT MATA PELAJARAN ---
              ShadFormBuilderField<String>(
                key: ValueKey('mapel_id_${controller.selectedSubjectId.value}'),
                id: 'subjectId',
                initialValue: controller.selectedSubjectId.value,
                label: const Text('Mata Pelajaran'),
                validator: (v) =>
                    (v == null || v.isEmpty) ? 'Pilih Mapel' : null,
                builder: (field) => ShadSelectSingle<SubjectResponse>(
                  label: "",
                  // Pastikan label berupa Widget Text
                  items: controller.subjects,
                  selectedId: field.value,
                  idBuilder: (v) => v.id,
                  labelBuilder: (v) => '${v.name} ${v.subName ?? ""}',
                  onChanged: (valId) async {
                    // 1. Update nilai form field agar validator jalan
                    field.didChange(valId);
                    controller.parentTeacherSubjects.clear();

                    controller.selectedSubjectId.value = valId ?? "";
                  },
                ),
              ),
              const SizedBox(height: 16),

              // --- SELECT PARENT ---
              if (controller.parentTeacherSubjects.isNotEmpty)
                ShadFormBuilderField<String>(
                  // PENTING: Key unik biar field ke-reset pas ganti Mapel
                  key: ValueKey(
                    'parent_field_${controller.selectedSubjectId.value}',
                  ),
                  id: 'parentId',
                  initialValue: controller.selectedParentId.value,
                  label: const Text('Guru Mapel Induk'),
                  validator: (v) => (v == null || v.isEmpty)
                      ? 'Pilih Guru Mapel Induk'
                      : null,
                  builder: (field) => ShadSelectSingle<TeacherSubjectResponse>(
                    // HAPUS ShadFormBuilderField kedua di sini! (Tadi kamu double nesting)
                    label: "",
                    items: controller.parentTeacherSubjects,
                    selectedId: field.value,
                    idBuilder: (v) => v.id,
                    labelBuilder: (v) =>
                        '${v.teacherName}-${v.subjectName} ${v.subjectSubName}',
                    onChanged: (val) {
                      field.didChange(val); // Kasih tahu Form
                      controller.selectedParentId.value =
                          val ?? ""; // Update Controller
                    },
                  ),
                ),
              const SizedBox(height: 32),

              // --- ACTION BUTTONS ---
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
