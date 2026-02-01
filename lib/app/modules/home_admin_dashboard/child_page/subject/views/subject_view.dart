import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/subject_controller.dart';

class SubjectView extends GetView<SubjectController> {
  const SubjectView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SubjectView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SubjectView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
