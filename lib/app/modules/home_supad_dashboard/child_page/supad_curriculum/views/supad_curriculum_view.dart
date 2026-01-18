import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/supad_curriculum_controller.dart';

class SupadCurriculumView extends GetView<SupadCurriculumController> {
  const SupadCurriculumView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SupadCurriculumView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SupadCurriculumView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
