import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../../../widgets/reusable_pluto_table.dart';
import '../controllers/supad_curriculum_controller.dart';

class SupadCurriculumView extends GetView<SupadCurriculumController> {
  const SupadCurriculumView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ReusablePlutoTable(
        columns: controller.columns,
        rows: controller.rows,
        isLoading: controller.isLoading.value,
        onCreate: controller.onCreate, // Ini aman, gak bentrok
        dropdownItems: controller.dropdownItems,
        canExport: true,
      ),
    );
  }
}
