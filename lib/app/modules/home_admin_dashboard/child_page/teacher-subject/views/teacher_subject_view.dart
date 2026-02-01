import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/teacher_subject_controller.dart';

class TeacherSubjectView extends GetView<TeacherSubjectController> {
  const TeacherSubjectView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TeacherSubjectView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TeacherSubjectView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
