import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../controllers/supad_curriculum_controller.dart';
import '../../../../../widgets/reusable_pluto_table.dart';
import '../../../../../widgets/right_form_drawer.dart';
import '../../../../../widgets/form/multi_select.dart';

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
        title: 'Buat Kurikulum',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShadInputFormField(
              id: 'username',
              label: const Text('Username'),
              placeholder: const Text('Enter your username'),
              description: const Text('This is your public display name.'),
              validator: (v) {
                if (v.length < 2) {
                  return 'Username must be at least 2 characters.';
                }
                return null;
              },
            ),
            // Obx(
            //   () => ShadSelectMultiple<SchoolLevelResponse>(
            //     label: 'Jenjang Sekolah',
            //     items: controller.allLevels,
            //     selectedIds: controller.selectedLevelIds,
            //     idBuilder: (v) => v.id,
            //     labelBuilder: (v) => v.name,
            //     onChanged: (val) => controller.selectedLevelIds.assignAll(val),
            //   ),
            // )
          ],
        ),
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
}
