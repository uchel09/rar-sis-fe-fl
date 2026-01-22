import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/supad_admin_controller.dart';
import '../../../../../widgets/reusable_pluto_table.dart';

class SupadAdminView extends GetView<SupadAdminController> {
  const SupadAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ReusablePlutoTable(
          columns: controller.columns,
          rows: controller.rows.toList(),
          isLoading: controller.isLoading.value,
          onCreate: controller.onCreate, // Ini aman, gak bentrok
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
