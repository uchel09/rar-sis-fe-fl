import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_student_dashboard_controller.dart';

class HomeStudentDashboardView extends GetView<HomeStudentDashboardController> {
  const HomeStudentDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeStudentDashboardView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeStudentDashboardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
