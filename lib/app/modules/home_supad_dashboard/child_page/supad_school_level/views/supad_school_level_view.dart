import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/supad_school_level_controller.dart';

class SupadSchoolLevelView extends GetView<SupadSchoolLevelController> {
  const SupadSchoolLevelView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SupadSchoolLevelView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SupadSchoolLevelView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
