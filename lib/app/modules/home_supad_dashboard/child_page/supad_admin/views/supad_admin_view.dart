import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/supad_admin_controller.dart';
import '../../../../../widgets/reusable_pluto_table.dart';
import '../../../../../widgets/right_form_drawer.dart';

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
        title: 'Create Admin',
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(decoration: const InputDecoration(labelText: 'Nama')),
            const SizedBox(height: 16),
            TextField(decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 16),
            TextField(decoration: const InputDecoration(labelText: 'NIK')),
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
