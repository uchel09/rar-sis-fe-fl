import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_teacher_dashboard_controller.dart';

class HomeTeacherDashboardView extends GetView<HomeTeacherDashboardController> {
  const HomeTeacherDashboardView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeTeacherDashboardView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'HomeTeacherDashboardView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
